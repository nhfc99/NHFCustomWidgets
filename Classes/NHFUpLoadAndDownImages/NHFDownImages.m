//
//  NHFDownImages.m
//  jinhe
//
//  Created by 今合网技术部 on 16/4/14.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import "NHFDownImages.h"
#import <AFNetworking/AFNetworking.h>

@implementation NHFDownImages
static NHFDownImages *DefaultManager = nil;

+ (NHFDownImages *)defaultManager {
    if (!DefaultManager) DefaultManager = [[self allocWithZone:NULL] init];
    return DefaultManager;
}

- (void)downImageByUrlString:(NSString *)urlString
                      params:(NSDictionary *)params
                     process:(void(^)(CGFloat))process
                     request:(DownLoadRequest)request {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *rulRequest = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task =
    [manager downloadTaskWithRequest:rulRequest
                            progress:^(NSProgress * _Nonnull downloadProgress) {
                                if (process != nil) {
                                    NSInteger fractionCompleted = downloadProgress.fractionCompleted * 100;
                                    CGFloat number = fractionCompleted/100.f;
                                    process(number);
                                }
                            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                NSString *path = [[NSHomeDirectory()stringByAppendingPathComponent:@"tmp"]stringByAppendingPathComponent:response.suggestedFilename];
                                return [NSURL fileURLWithPath:path];
                            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                if (error == nil) {
                                    NSData *data = [NSData dataWithContentsOfURL:filePath];
                                    if (data != nil) {
                                        request(data, true, nil, false);
                                    } else {
                                        request(nil, false, @"error", true);
                                    }
                                } else {
                                    NSDictionary *dic = [error userInfo];
                                    request(nil, false, dic[@"NSLocalizedDescription"], true);
                                }
                            }];
    [task resume];
}

@end
