//
//  NHFTaskGroupQueue.h
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/9/10.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NHFTaskGroupQueueResult)(void);

@interface NHFTaskGroupQueue : NSObject


/**
 创建

 @param queueNM --
 */
+ (NHFTaskGroupQueue *)createByQueueNM:(NSString *)queueNM;


/**
 添加前边的队列

 @param taskRequest --
 */
- (void)addTaskGroupQueue:(void(^)(NHFTaskGroupQueueResult taskGroupQueueResult))taskRequest;


/**
 最后一步运行

 @param queue --
 @param request --
 */
- (void)notifyTaskGroupQueueBy:(dispatch_queue_t)queue
                       request:(void(^)(void))request;

@end


//EG:
//_taskGroupQueue = [NHFTaskGroupQueue createByQueueNM:@"ddd"];
//[_taskGroupQueue addTaskGroupQueue:^(NHFTaskGroupQueueResult taskGroupQueueResult) {
//    NSLog(@"Begin1");
//    [weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
//        NSLog(@"End1");
//        taskGroupQueueResult();
//    }];
//}];
//
//[_taskGroupQueue addTaskGroupQueue:^(NHFTaskGroupQueueResult taskGroupQueueResult) {
//    NSLog(@"Begin2");
//    [weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
//        NSLog(@"End2");
//        taskGroupQueueResult();
//    }];
//}];
//
//[_taskGroupQueue addTaskGroupQueue:^(NHFTaskGroupQueueResult taskGroupQueueResult) {
//    NSLog(@"Begin3");
//    [weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
//        NSLog(@"End3");
//        taskGroupQueueResult();
//    }];
//}];
//
//[_taskGroupQueue notifyTaskGroupQueueBy:dispatch_get_main_queue() request:^{
//    NSLog(@"End");
//
//}];












