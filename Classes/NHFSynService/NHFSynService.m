//
//  JHUserInfoUpdate.m
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/27.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFSynService.h"

@implementation NHFWeakServiceObject

@end

@interface NHFSynService ()

@property (nonatomic, retain) NSMutableArray *objects;

@end

@implementation NHFSynService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _objects = [NSMutableArray new];
    }
    return self;
}

- (void)addObject:(id)object aSelector:(SEL)aSelector {
    if (object == nil ||
        aSelector == NULL) {
        return;
    }
    NHFWeakServiceObject *jhWeakObject = [NHFWeakServiceObject new];
    jhWeakObject.weakObject = object;
    jhWeakObject.selString = NSStringFromSelector(aSelector);
    [_objects addObject:jhWeakObject];
}

- (void)removeObject:(id)object aSelector:(SEL)aSelector {
    if (object == nil) {
        return;
    }
    NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:_objects];
    for (NHFWeakServiceObject *jhWeakObject in retainObjects) {
        if (jhWeakObject.weakObject == object) {
            if (aSelector == NULL) {
                [self removeObject:jhWeakObject];
            } else if ([jhWeakObject.selString isEqualToString:NSStringFromSelector(aSelector)]) {
                [self removeObject:jhWeakObject];
            }
        }
    }
}

- (void)updateObject {
    NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:_objects];
    for (NHFWeakServiceObject *jhWeakObject in retainObjects) {
        if (jhWeakObject.weakObject == nil) {
            [self removeObject:jhWeakObject];
            continue;
        }
        NSObject *objc = jhWeakObject.weakObject;
        SEL sel = NSSelectorFromString(jhWeakObject.selString);
        if ([objc respondsToSelector:sel]) {
            SEL selector = NSSelectorFromString(jhWeakObject.selString);
            IMP imp = [objc methodForSelector:selector];
            void (*func)(id, SEL) = (void *)imp;
            func(objc, selector);
        }
    }
}

- (void)updateObjectBySel:(NSString *)selString {
    NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:_objects];
    for (NHFWeakServiceObject *jhWeakObject in retainObjects) {
        if (jhWeakObject.weakObject == nil) {
            [self removeObject:jhWeakObject];
            continue;
        }
        
        NSObject *objc = jhWeakObject.weakObject;
        if (![jhWeakObject.selString isEqualToString:selString]) {
            continue;
        }
        SEL sel = NSSelectorFromString(jhWeakObject.selString);
        if ([objc respondsToSelector:sel]) {
            SEL selector = NSSelectorFromString(jhWeakObject.selString);
            IMP imp = [objc methodForSelector:selector];
            void (*func)(id, SEL) = (void *)imp;
            func(objc, selector);
        }
    }
}

- (void)removeObject:(NHFWeakServiceObject *)jhWeakObject {
    @synchronized (self) {
        [_objects removeObject:jhWeakObject];
    }
}

@end
