//
//  CustomDispatchQueue.h
//  jinheLV
//
//  Created by niuhongfei on 2017/3/27.
//  Copyright © 2017年 今合网技术部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHFCustomDispatchQueue : NSObject

#pragma mark - 组合
+ (void)dispatchByGlobal_queue:(void(^)(void))globalObject
                    main_queue:(void(^)(void))mainObject;

+ (void)dispatchByGlobal_queue:(void(^)(void))globalObject;

+ (void)dispatchByGlobal_mainqueue:(void(^)(void))mainObject;

+ (void)dispatchQueueSerialByQueueName:(const char *)queueName
                          globalObject:(void(^)(void))globalObject;

@end
















