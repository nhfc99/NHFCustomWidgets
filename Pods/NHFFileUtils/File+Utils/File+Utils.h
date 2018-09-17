//
//  File+Utils.h
//  jinhe
//
//  Created by 今合网技术部 on 15/8/6.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File_Utils : NSObject

+(NSString*)AppBasePath:(NSString*)pathtype;

/**
 *  获取app中document路径
 *
 *  @param filename
 *
 *  @return
 */
+(NSString*)AppBaseDocumentPath:(NSString*)filename;

/**
 *  获取app中resource路径
 *
 *  @param filename
 *
 *  @return
 */
+(NSString*)AppBaseResourcePath:(NSString*)filename;

/**
 *  测试某个目录是否存在
 *
 *  @return
 */
+ (BOOL)testDicExist:(NSString*)dicPath;

/**
 *  创建一个目录
 *
 *  @param dicPath 
 */
+ (void)createDic:(NSString*)dicPath;

/**
 *  删除文件夹及文件级内的文件
 *
 *  @param dicPath
 */
+ (void)deleteDicsAndFiles:(NSString*)dicPath;

/**
 *  拷贝一个目录到另外的一个地方
 *
 *  @param filePath
 *  @param toFilePath 
 */
+ (void)copyFile:(NSString*)filePath toFilePath:(NSString*)toFilePath;

/**
 *  获取文件名的扩展名
 *
 *  @param fileName
 *
 *  @return
 */
+ (NSString *)fileExtString:(NSString *)fileName;

@end












