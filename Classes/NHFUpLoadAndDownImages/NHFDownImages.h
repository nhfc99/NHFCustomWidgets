//
//  NHFDownImages.h
//  jinhe
//
//  Created by 今合网技术部 on 16/4/14.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DownLoadRequest)(NSData *message,BOOL success,NSString *errorMsg,BOOL error);
@interface NHFDownImages : NSObject

/**
 *  获取单例
 *
 *  @return --
 */
+ (NHFDownImages *)defaultManager;

/**
 *  图片下载
 *
 *  @param urlString --
 *  @param params --
 *  @param process --
 *  @param request --
 */
- (void)downImageByUrlString:(NSString *)urlString
                      params:(NSDictionary *)params
                     process:(void(^)(CGFloat))process
                     request:(DownLoadRequest)request;

@end













