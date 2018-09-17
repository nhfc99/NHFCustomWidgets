//
//  NHFOperationQueue.h
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/9/10.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NHFOperationQueueResult)(void);

@interface NHFOperationQueue : NSObject


/**
 创建

 @return --
 */
+ (NHFOperationQueue *)createOperationQueue;


/**
 添加业务

 @param request --
 */
- (void)addOperation:(void(^)(NHFOperationQueueResult operationQueueResult))request;


/**
 开始作业
 */
- (void)beginOperationTask;


/**
 取消所有的任务
 */
- (void)cancelAllOperations;

@end



//operationQueue = [NHFOperationQueue createOperationQueue];
//[operationQueue addOperation:^(NHFOperationQueueResult operationQueueResult) {
//    NSLog(@"Begin1");
//    [weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
//        NSLog(@"End1");
//        operationQueueResult();
//    }];
//}];
//
//[operationQueue addOperation:^(NHFOperationQueueResult operationQueueResult) {
//    NSLog(@"Begin2");
//    [weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
//        NSLog(@"End2");
//        operationQueueResult();
//    }];
//}];
//
//[operationQueue addOperation:^(NHFOperationQueueResult operationQueueResult) {
//    NSLog(@"Begin3");
//    [weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
//        NSLog(@"End3");
//        operationQueueResult();
//    }];
//}];
//[operationQueue beginOperationTask];
//}
//
//- (void)requestGetRequest:(void(^)(BOOL success, NSString *errorMsg))request {
//    [JinHeViewControllerRequest requestGetAdvertFloatRequest:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
//        if (success && !error) {
//            if (request != nil) {
//                request(true, nil);
//            }
//        } else {
//            request(false, errorMsg);
//        }
//    }];
//}














