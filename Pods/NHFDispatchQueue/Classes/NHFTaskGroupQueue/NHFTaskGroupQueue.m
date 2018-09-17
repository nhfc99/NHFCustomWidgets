//
//  NHFTaskGroupQueue.m
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/9/10.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFTaskGroupQueue.h"

@interface NHFTaskGroupQueue () {
    dispatch_queue_t _dispatchQueue;
    dispatch_group_t _dispatchGroup;
}

@end

@implementation NHFTaskGroupQueue

+ (NHFTaskGroupQueue *)createByQueueNM:(NSString *)queueNM {
    NHFTaskGroupQueue *taskGroupQueue = [NHFTaskGroupQueue new];
    taskGroupQueue->_dispatchQueue = dispatch_queue_create([queueNM UTF8String], DISPATCH_QUEUE_CONCURRENT);
    taskGroupQueue->_dispatchGroup = dispatch_group_create();
    return taskGroupQueue;
}

- (void)addTaskGroupQueue:(void(^)(NHFTaskGroupQueueResult taskGroupQueueResult))taskRequest {
    dispatch_group_enter(_dispatchGroup);
    if (taskRequest != nil) {
        taskRequest(^{
            dispatch_group_leave(self->_dispatchGroup);
        });
    }
}

- (void)notifyTaskGroupQueueBy:(dispatch_queue_t)queue
                       request:(void(^)(void))request {
    dispatch_group_notify(_dispatchGroup, queue, ^(){
        if (request != nil) {
            request();
        }
    });
}

- (void)dealloc
{
    _dispatchQueue = NULL;
    _dispatchGroup = NULL;
    NSLog(@"NHFTaskGroupQueue %s", __FUNCTION__);
}

@end












