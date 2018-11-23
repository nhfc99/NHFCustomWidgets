//
//  JHUserInfoUpdate.m
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/27.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFSynService.h"

static NHFSynService *_nhfSynService = nil;

@implementation NHFWeakServiceObject

@end

@interface NHFSynService ()

@property (nonatomic, retain) NSMutableDictionary *objectsMap;

@end

@implementation NHFSynService

+ (instancetype)getInstancetype {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _nhfSynService = [NHFSynService new];
    });
    return _nhfSynService;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _objectsMap = [NSMutableDictionary new];
    }
    return self;
}

- (void)addObject:(id)object
        aSelector:(SEL)aSelector
             type:(NSString *)type {
    if (object == nil ||
        aSelector == nil ||
        type == nil) {
        return;
    }
    
    //数据源
    NHFWeakServiceObject *jhWeakObject = [NHFWeakServiceObject new];
    jhWeakObject.weakObject = object;
    jhWeakObject.selString = NSStringFromSelector(aSelector);
    
    NSMutableArray *objects = [NSMutableArray new];
    NSArray *mapObjects = [_objectsMap objectForKey:type];
    if (mapObjects == nil) {
        [objects addObject:jhWeakObject];
        [_objectsMap setObject:objects forKey:type];
    } else {
        [objects addObjectsFromArray:mapObjects];
        //检查重复的数据
        [objects enumerateObjectsUsingBlock:^(NHFWeakServiceObject *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.weakObject == jhWeakObject.weakObject &&
                [obj.selString isEqualToString:jhWeakObject.selString]) {
                [objects removeObjectAtIndex:idx];
                *stop = true;
            }
        }];
        [objects addObject:jhWeakObject];
        [_objectsMap setObject:objects forKey:type];
    }
}

- (void)updateObject:(NSString *)type {
    NSArray *mapObjects = [_objectsMap objectForKey:type];
    NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:mapObjects];
    [retainObjects enumerateObjectsUsingBlock:^(NHFWeakServiceObject *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.weakObject == nil) {
            [retainObjects removeObjectIdenticalTo:obj];
        } else {
            NSObject *objc = obj.weakObject;
            SEL sel = NSSelectorFromString(obj.selString);
            if ([objc respondsToSelector:sel]) {
                SEL selector = NSSelectorFromString(obj.selString);
                IMP imp = [objc methodForSelector:selector];
                void (*func)(id, SEL) = (void *)imp;
                func(objc, selector);
            }
        }
    }];
    [_objectsMap removeObjectForKey:type];
    [_objectsMap setObject:retainObjects forKey:type];
}

- (void)updateObject:(NSString *)type
           selString:(NSString *)selString {
    NSArray *mapObjects = [_objectsMap objectForKey:type];
    NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:mapObjects];
    [retainObjects enumerateObjectsUsingBlock:^(NHFWeakServiceObject *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.weakObject == nil) {
            [retainObjects removeObjectIdenticalTo:obj];
        } else if ([obj.selString isEqualToString:selString]) {
            NSObject *objc = obj.weakObject;
            SEL sel = NSSelectorFromString(obj.selString);
            if ([objc respondsToSelector:sel]) {
                SEL selector = NSSelectorFromString(obj.selString);
                IMP imp = [objc methodForSelector:selector];
                void (*func)(id, SEL) = (void *)imp;
                func(objc, selector);
            }
        }
    }];
    [_objectsMap removeObjectForKey:type];
    [_objectsMap setObject:retainObjects forKey:type];
}

@end
