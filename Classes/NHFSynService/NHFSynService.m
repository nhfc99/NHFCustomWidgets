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
    
    @synchronized (self) {
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
                if (obj.weakObject == nil) {
                    [objects removeObjectAtIndex:idx];
                } else if (obj.weakObject == jhWeakObject.weakObject &&
                    [obj.selString isEqualToString:jhWeakObject.selString]) {
                    [objects removeObjectAtIndex:idx];
                    *stop = true;
                }
            }];
            [objects addObject:jhWeakObject];
            [_objectsMap removeObjectForKey:type];
            [_objectsMap setObject:objects forKey:type];
        }
    }
}

- (void)updateObject:(NSString *)type {
    [self updateObject:type selString:nil object:nil];
}

- (void)updateObject:(NSString *)type
           selString:(NSString *)selString {
    [self updateObject:type selString:selString object:nil];
}

- (void)updateObject:(NSString *)type
           selString:(NSString * _Nullable)selString
              object:(id _Nullable)object {
    //类型不可以为空数据
    if (!type) {
        return;
    }
    @synchronized (self) {
        NSArray *mapObjects = [_objectsMap objectForKey:type];
        NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:mapObjects];
        [retainObjects enumerateObjectsUsingBlock:^(NHFWeakServiceObject *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.weakObject == nil) {
                [retainObjects removeObjectIdenticalTo:obj];
            } else if (!selString ||
                       [obj.selString isEqualToString:selString]) {
                //说明：如果没有传递方法，代表要执行此类别中所有注册过的方法，如果指定了方法\
                       那么需要验证指定的方法，意味着只执行指定的某一个方法，\
                       selString==nil表示要执行type类型下注册的所有的方法 \
                       selString!=nil表示只执行type类型下注册的指定方法
                NSObject *objc = obj.weakObject;
                SEL sel = NSSelectorFromString(obj.selString);
                if ([objc respondsToSelector:sel]) {
                    SEL selector = NSSelectorFromString(obj.selString);
                    IMP imp = [objc methodForSelector:selector];
                    
                    if (object) {//有参数的时候
                        void (*func)(id, SEL, id object) = (void *)imp;
                        func(objc, selector, object);
                    } else {//没有参数的时候
                        void (*func)(id, SEL) = (void *)imp;
                        func(objc, selector);
                    }
                }
            }
        }];
        [_objectsMap removeObjectForKey:type];
        [_objectsMap setObject:retainObjects forKey:type];
    }
}

@end
