//
//  File+Utils.m
//  jinhe
//
//  Created by 今合网技术部 on 15/8/6.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import "File+Utils.h"

@implementation File_Utils

+(NSString*)AppBasePath:(NSString*)pathtype
{
    if([pathtype isEqualToString:@"resource"])
    {
        NSString *resPath = [[NSBundle mainBundle] resourcePath];
        return resPath;
    }
    else if ([pathtype isEqualToString:@"document"])
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *docDir = [paths objectAtIndex:0];
        return docDir;
    }
    else
    {
        return nil;
    }
}

+(NSString*)AppBaseResourcePath:(NSString*)filename
{
    return [NSString stringWithFormat:@"%@/%@", [File_Utils AppBasePath:@"resource"], filename];
}

+(NSString*)AppBaseDocumentPath:(NSString*)filename
{
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return [NSString stringWithFormat:@"%@/%@", DocumentsPath, filename];
}

+ (BOOL)testDicExist:(NSString *)dicPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dicPath] == YES) {
        return true;
    }else{
        return false;
    }
}

+ (void)createDic:(NSString *)dicPath{
    if ([File_Utils testDicExist:dicPath]) {
        return;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:dicPath withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (void)deleteDicsAndFiles:(NSString*)dicPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:dicPath error:nil];
}

+ (void)copyFile:(NSString*)filePath toFilePath:(NSString*)toFilePath{
    if ([File_Utils testDicExist:toFilePath]) {
        return;
    }
    
    NSFileManager* fileManager =[NSFileManager defaultManager];
    NSError* error;
    [fileManager copyItemAtPath:filePath toPath:toFilePath error:&error];
}

+ (NSString *)fileExtString:(NSString *)fileName{
    NSArray *array = [fileName componentsSeparatedByString:@"."];
    if ([array count] == 0) {
        return nil;
    }else{
        return [array lastObject];
    }
}

@end









