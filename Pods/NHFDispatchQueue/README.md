# NHFDispatchQueue
<h2>介绍</h2>
<p>IOS布局相关方面的</p>
<h2>安装</h2>
<ul>
<li>pod 'NHFDispatchQueue'</li>
<li>手动下载然后将文件夹拖至工程中即可</li>
</ul>

<h2>使用方法</h2>
#import "FirstViewController.h"

#import "NHFTaskGroupQueue.h"

#import "JinHeViewControllerRequest.h"

#import "NHFOperationQueue.h"

@interface FirstViewController () {
    NHFOperationQueue *operationQueue1;
    NHFOperationQueue *operationQueue2;
    NHFTaskGroupQueue *taskGroupQueue;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view.

kWeakSelf(self);
taskGroupQueue = [NHFTaskGroupQueue createByQueueNM:@"ccc"];
[taskGroupQueue addTaskGroupQueue:^(NHFTaskGroupQueueResult taskGroupQueueResult) {
[weakself create1:taskGroupQueueResult];
}];
[taskGroupQueue addTaskGroupQueue:^(NHFTaskGroupQueueResult taskGroupQueueResult) {
[weakself create2:taskGroupQueueResult];
}];

[taskGroupQueue notifyTaskGroupQueueBy:dispatch_get_main_queue() request:^{
NSLog(@"notifyTaskGroupQueueBy");
}];
}

- (void)requestGetRequest:(void(^)(BOOL success, NSString *errorMsg))request {
[JinHeViewControllerRequest requestGetAdvertFloatRequest:^(NSString *message, BOOL success, NSString *errorMsg, BOOL error) {
if (success && !error) {
if (request != nil) {
request(true, nil);
}
} else {
request(false, errorMsg);
}
}];
}

- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

- (void)create1:(NHFTaskGroupQueueResult)taskGroupQueueResult {
kWeakSelf(self);
operationQueue1 = [NHFOperationQueue createOperationQueue];
[operationQueue1 addOperation:^(NHFOperationQueueResult operationQueueResult) {
NSLog(@"One - Begin1");
[weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
NSLog(@"One - End1");
operationQueueResult();
}];
}];

[operationQueue1 addOperation:^(NHFOperationQueueResult operationQueueResult) {
NSLog(@"One - Begin2");
[weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
NSLog(@"One - End2");
operationQueueResult();
}];
}];

[operationQueue1 addOperation:^(NHFOperationQueueResult operationQueueResult) {
NSLog(@"One - Begin3");
[weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
NSLog(@"One - End3");
operationQueueResult();
taskGroupQueueResult();
}];
}];
[operationQueue1 beginOperationTask];
}

- (void)create2:(NHFTaskGroupQueueResult)taskGroupQueueResult {
kWeakSelf(self);
operationQueue2 = [NHFOperationQueue createOperationQueue];
[operationQueue2 addOperation:^(NHFOperationQueueResult operationQueueResult) {
NSLog(@"Two - Begin1");
[weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
NSLog(@"Two - End1");
operationQueueResult();
}];
}];

[operationQueue2 addOperation:^(NHFOperationQueueResult operationQueueResult) {
NSLog(@"Two - Begin2");
[weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
NSLog(@"Two - End2");
operationQueueResult();
}];
}];

[operationQueue2 addOperation:^(NHFOperationQueueResult operationQueueResult) {
NSLog(@"Two - Begin3");
[weakself requestGetRequest:^(BOOL success, NSString *errorMsg) {
NSLog(@"Two - End3");
operationQueueResult();
taskGroupQueueResult();
}];
}];
[operationQueue2 beginOperationTask];
}

@end

