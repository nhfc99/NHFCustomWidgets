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

- (void)addObject:(id)object {
    NHFWeakServiceObject *jhWeakObject = [NHFWeakServiceObject new];
    jhWeakObject.weakObject = object;
    [_objects addObject:jhWeakObject];
}

- (void)updateObject {
    NSMutableArray *retainObjects = [[NSMutableArray alloc] initWithArray:_objects];
    for (NHFWeakServiceObject *jhWeakObject in retainObjects) {
        if (jhWeakObject.weakObject == nil) {
            [_objects removeObject:jhWeakObject];
            continue;
        }
        NSObject *objc = jhWeakObject.weakObject;
        if ([objc respondsToSelector:@selector(nhfUpdateInfo)]) {
            [objc performSelector:@selector(nhfUpdateInfo)];
        }
    }
}

- (void)nhfUpdateInfo {
    
}

@end
