//
//  JHUserInfoUpdate.m
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/27.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFSynService.h"

static NHFSynServiceCache *_nhfSynServiceCache = nil;

@interface NHFSynServiceCache ()

@property (nonatomic, retain) NSMutableDictionary *cacheService;

@end

@implementation NHFSynServiceCache

+ (instancetype)getInstancetype {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _nhfSynServiceCache = [NHFSynServiceCache new];
    });
    return _nhfSynServiceCache;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cacheService = [NSMutableDictionary new];
    }
    return self;
}

//添加指定的对象
- (void)addObject:(NHFSynService *)object keyString:(NSString *)keyString {
    if (object == nil ||
        keyString == nil) {
        return;
    }
    //保存对象
    NHFWeakServiceObject *jhWeakObject = [NHFWeakServiceObject new];
    jhWeakObject.weakObject = object;
    [_cacheService removeObjectForKey:keyString];
    [_cacheService setObject:jhWeakObject forKey:keyString];
}

- (NHFSynService *)objectForKeyString:(NSString *)keyString {
    //判断是否为空，如果为空了就清除
    NHFWeakServiceObject *jhWeakObject = [_cacheService objectForKey:keyString];
    if (jhWeakObject.weakObject) {
        return jhWeakObject.weakObject;
    }
    [self removeKeyString:keyString];
    return nil;
}

//移除指定的键名
- (void)removeKeyString:(NSString *)keyString {
    [_cacheService removeObjectForKey:keyString];
}

@end

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

#pragma mark - 存储本对象，用于其他地方随时使用
- (void)saveServiceKey:(NSString *)key {
    [[NHFSynServiceCache getInstancetype] addObject:self keyString:key];
}

+ (NHFSynService *)serviceKey:(NSString *)key {
    return [[NHFSynServiceCache getInstancetype] objectForKeyString:key];
}

@end
