//
//  NHFUpLoadImages.h
//  jinhe
//
//  Created by 今合网技术部 on 16/1/15.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^UpLoadRequest)(NSString *message,BOOL success,NSString *errorMsg,BOOL error);
@interface NHFUpLoadImages : NSObject

{
    UpLoadRequest upLoadRequest;
}

/**
 *  获取单例
 *
 *  @return --
 */
+ (NHFUpLoadImages *)defaultManager;


/**
 多张图片上传功能

 @param urlString --
 @param params --
 @param headParams --
 @param images --
 @param imageNames --
 @param process --
 @param request --
 */
- (void)uploadMutableImageByUrlString:(NSString *)urlString
                               params:(NSDictionary *)params
                           headParams:(NSDictionary *)headParams
                               images:(NSArray*)images
                           imageNames:(NSArray *)imageNames
                              process:(void(^)(CGFloat process))process
                              request:(void(^)(NSString *message,
                                               BOOL success,
                                               NSString *errorMsg,
                                               BOOL error))request;

@end
