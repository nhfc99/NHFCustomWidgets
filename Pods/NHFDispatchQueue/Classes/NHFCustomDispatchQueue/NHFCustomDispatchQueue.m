//
//  CustomDispatchQueue.m
//  jinheLV
//
//  Created by niuhongfei on 2017/3/27.
//  Copyright © 2017年 今合网技术部. All rights reserved.
//

#import "NHFCustomDispatchQueue.h"

@implementation NHFCustomDispatchQueue

+ (void)dispatchByGlobal_queue:(void(^)(void))globalObject
                    main_queue:(void(^)(void))mainObject {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (globalObject != nil) {
            globalObject();
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (mainObject != nil) {
                mainObject();
            }
        });
    });
}

+ (void)dispatchByGlobal_mainqueue:(void(^)(void))mainObject {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (mainObject != nil) {
            mainObject();
        }
    });
}

+ (void)dispatchByGlobal_queue:(void(^)(void))globalObject {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (globalObject != nil) {
            globalObject();
        }
    });
}

+ (void)dispatchQueueSerialByQueueName:(const char *)queueName
                          globalObject:(void(^)(void))globalObject {
    dispatch_sync(dispatch_queue_create(queueName, DISPATCH_QUEUE_SERIAL), ^{
        if (globalObject != nil) {
            globalObject();
        }
    });
}



@end














