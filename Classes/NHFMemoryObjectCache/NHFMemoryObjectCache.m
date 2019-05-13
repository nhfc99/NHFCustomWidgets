//
//  NHFMemoryObjectCache.m
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2019/5/11.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import "NHFMemoryObjectCache.h"

@implementation NHFMemoryObjectCacheObject

@end

@interface NHFMemoryObjectCache ()

@property (nonatomic, retain) NSMutableDictionary *objectsMap;

@end

@implementation NHFMemoryObjectCache

static NHFMemoryObjectCache *memoryObjectCache = nil;
+ (instancetype)getInstancetype {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        memoryObjectCache = [NHFMemoryObjectCache new];
    });
    return memoryObjectCache;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _objectsMap = [NSMutableDictionary new];
    }
    return self;
}

- (void)save:(id)object
  objectName:(NSString *)objectName
        type:(NHFReferenceType)nhfReferenceType {
    if (object == nil ||
        objectName == nil) {
        return;
    }
    
    @synchronized (self) {
        //数据源
        NHFMemoryObjectCacheObject *jhObject = [NHFMemoryObjectCacheObject new];
        if (nhfReferenceType == NHFReferenceTypeWeak) {
            jhObject.weakObject = object;
        } else {
            jhObject.strongObject = object;
        }
        jhObject.objectName = objectName;
        
        NHFMemoryObjectCacheObject *mapObject = [_objectsMap objectForKey:objectName];
        if (mapObject == nil) {
            [_objectsMap setObject:jhObject forKey:objectName];
        } else {
            mapObject.weakObject = jhObject.weakObject;
            mapObject.strongObject = jhObject.strongObject;
        }
    }
}

- (id)get:(NSString *)objectName {
    if (objectName == nil) {
        return nil;
    }
    @synchronized (self) {
        NHFMemoryObjectCacheObject *mapObject = [_objectsMap objectForKey:objectName];
        if (mapObject == nil) {
            return nil;
        } else {
            if (mapObject.weakObject) {
                return mapObject.weakObject;
            } else if (mapObject.strongObject) {
                return mapObject.strongObject;
            } else {
                [_objectsMap removeObjectForKey:objectName];
                return nil;
            }
        }
    }
}

- (void)delete:(NSString *)objectName {
    if (objectName == nil) {
        return;
    }
    @synchronized (self) {
        NHFMemoryObjectCacheObject *mapObject = [_objectsMap objectForKey:objectName];
        if (mapObject != nil) {
            mapObject.weakObject = nil;
            mapObject.strongObject = nil;
            [_objectsMap removeObjectForKey:objectName];
        }
    }
}

- (BOOL)isHave:(NSString *)objectName {
    if (objectName == nil) {
        return false;
    }
    @synchronized (self) {
        NHFMemoryObjectCacheObject *mapObject = [_objectsMap objectForKey:objectName];
        if (mapObject != nil ||
            mapObject.weakObject != nil ||
            mapObject.strongObject != nil) {
            return true;
        } else {
            [self delete:objectName];
            return false;
        }
    }
}

@end
