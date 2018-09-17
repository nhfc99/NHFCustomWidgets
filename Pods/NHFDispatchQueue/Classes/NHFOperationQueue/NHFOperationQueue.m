//
//  NHFOperationQueue.m
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/9/10.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFOperationQueue.h"

@interface NHFOperationQueue () {
    NSOperationQueue *_operationQueue;
    dispatch_semaphore_t _semaphore;
}

@property (nonatomic, retain) NSMutableArray *operations;

@end

@implementation NHFOperationQueue

+ (NHFOperationQueue *)createOperationQueue {
    NHFOperationQueue *operationQueue = [NHFOperationQueue new];
    return operationQueue;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _operationQueue = [[NSOperationQueue alloc] init];
        _semaphore = dispatch_semaphore_create(0);
    }
    return self;
}

- (NSMutableArray *)operations {
    if (_operations == nil) {
        _operations = [NSMutableArray new];
    }
    return _operations;
}

- (void)addOperation:(void(^)(NHFOperationQueueResult operationQueueResult))request {
    __weak typeof(self) weakself = self;
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        if (request != nil) {
            __strong typeof(weakself) strongweakself = weakself;
            
            //开始执行业务
            dispatch_semaphore_wait(strongweakself->_semaphore, DISPATCH_TIME_FOREVER);
            
            //业务回调
            request(^{
                dispatch_semaphore_signal(strongweakself->_semaphore);
            });
        }
    }];
    if (self.operations.count > 0) {
        [blockOperation addDependency:self.operations.lastObject];
    }
    [self.operations addObject:blockOperation];
}

- (void)beginOperationTask {
    [_operationQueue addOperations:self.operations waitUntilFinished:NO];
    dispatch_semaphore_signal(_semaphore);
}

- (void)cancelAllOperations {
    [_operationQueue cancelAllOperations];
    [_operations removeAllObjects];
    _operations = nil;
}

- (void)dealloc
{
    NSLog(@"NHFOperationQueue %s", __FUNCTION__);
}

@end














