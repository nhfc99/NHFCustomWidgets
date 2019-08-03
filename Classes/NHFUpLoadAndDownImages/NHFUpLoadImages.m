//
//  NHFUpLoadImages.m
//  jinhe
//
//  Created by 今合网技术部 on 16/1/15.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import "NHFUpLoadImages.h"

@implementation NHFUpLoadImages

static NHFUpLoadImages *DefaultManager = nil;

+ (NHFUpLoadImages *)defaultManager {
    if (!DefaultManager) DefaultManager = [[self allocWithZone:NULL] init];
    return DefaultManager;
}

- (void)uploadMutableImageByUrlString:(NSString *)urlString
                               params:(NSDictionary *)params
                           headParams:(NSDictionary *)headParams
                               images:(NSArray*)images
                           imageNames:(NSArray *)imageNames
                              process:(void(^)(CGFloat process))process
                              request:(void(^)(NSString *message,
                                               BOOL success,
                                               NSString *errorMsg,
                                               BOOL error))request {
    NSMutableDictionary *theDic = [[NSMutableDictionary alloc] initWithDictionary:params];
    upLoadRequest = request;
    if (images.count > 0) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //请求头
        if (headParams) {
            for (NSString *key in headParams.allKeys) {
                [manager.requestSerializer setValue:headParams[key] forHTTPHeaderField:key];
            }
        }
        [manager POST:urlString parameters:theDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            for (int i = 0;  i < images.count; i++) {
                UIImage *imageObj = images[i];
                NSString *photoName = [imageNames objectAtIndex:i];
                NSData *imageData = UIImageJPEGRepresentation(imageObj, 0.5);
                [formData appendPartWithFileData:imageData name:photoName fileName:[NSString stringWithFormat:@"%@.png", photoName] mimeType:@"image/png"];
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            if (process != nil) {
                if (images.count > 1) {
                    process(1.0 * uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
                } else {
                    NSInteger fractionCompleted = uploadProgress.fractionCompleted * 100;
                    CGFloat number = fractionCompleted/100.f;
                    process(number);
                }
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString *data = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            self->upLoadRequest(data, true, nil, false);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSDictionary *dic = [error userInfo];
            self->upLoadRequest(nil, false, dic[@"NSLocalizedDescription"], true);
        }];
    }
}

@end
