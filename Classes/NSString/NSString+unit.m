//
//  NSString+unit.m
//  zjproject
//
//  Created by rockontrol on 15/4/15.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import "NSString+unit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(unit)

- (NSString*)hzToUTF8 {
    NSString* filePath = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return filePath;
}

- (BOOL)checkPhoneNumInput {
    NSString * MOBILE = @"^1([38][0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    BOOL res3 = [regextestcu evaluateWithObject:self];
    BOOL res4 = [regextestct evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL) checkPhoneNum {
    NSScanner* scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return[scan scanInteger:&val] && [scan isAtEnd];
}

- (NSString*)stringTrim {
    if(self == nil)
    {
        return nil;
    }
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+ (NSString*)getRandomNumber:(NSInteger)from to:(NSInteger)to {
    return [NSString stringWithFormat:@"%ld", (from + (arc4random() % (to-from + 1)))];
}

// 整形判断
+ (BOOL)isPureInt:(NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//浮点形判断
+ (BOOL)isPureFloat:(NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}


- (NSString *)md5 {
    if(self == nil)
    {
        return nil;
    }
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            
            result[0], result[1], result[2], result[3],
            
            result[4], result[5], result[6], result[7],
            
            result[8], result[9], result[10], result[11],
            
            result[12], result[13], result[14], result[15]
            
            ];
}

- (NSString *)pinYin {//先转换为带声调的拼音
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    
    return str;
}

+ (NSString *)locationInstance:(CGFloat)instance {
    if (instance < 0) {
        return @"";
    }
    
    if (instance < 1000) {
        return [NSString stringWithFormat:@"%.1lfm", instance];
    }
    return [NSString stringWithFormat:@"%.1lfkm", instance/1000];
}

+ (NSString *)toUTF8:(NSString *)string {
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (BOOL)isEmpty:(NSString *)string {
    if (string == nil ||
        string.length == 0 ||
        [string isEqualToString:@"null"] ||
        [string isEqualToString:@"(null)"]) {
        return true;
    } else {
        return false;
    }
}

- (NSString *)removeHTMLString {
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0 error:nil];
    NSString *string = [regularExpretion stringByReplacingMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length) withTemplate:@""];
    return string;
}

+ (NSString *)isNullToString:(id)string {
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        return @"";
    } else {
        return (NSString *)string;
    }
}

+ (BOOL)isNullString:(id)string {
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        return true;
    } else {
        return false;
    }
}

- (NSString *)qfHeadPath {
    // 准备对象
    NSString * searchStr = self;
    NSString * regExpStr = @"<[.[^>]]*>";
    NSString * replacement = @"";
    // 创建 NSRegularExpression 对象,匹配 正则表达式
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:regExpStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *resultStr = searchStr;
    // 替换匹配的字符串为 searchStr
    resultStr = [regExp stringByReplacingMatchesInString:searchStr
                                                 options:NSMatchingReportProgress
                                                   range:NSMakeRange(0, searchStr.length)
                                            withTemplate:replacement];
    return [resultStr stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
}

+ (NSString *)jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}
+ (NSString *)jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}
+ (NSString *)jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        if ([self isEmpty:object]) {
            value = @"";
        } else {
            value = [NSString jsonStringWithString:object];
        }
    }else if([object isKindOfClass:[NSNumber class]]){
        value = [(NSNumber*)object stringValue];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
}

- (NSString *)jhTimeToDay {
    NSArray *times = [self componentsSeparatedByString:@"T"];
    return times.firstObject;
}

- (NSString *)jhTimeToMin {
    NSArray *times = [self componentsSeparatedByString:@"T"];
    NSArray *hours = [times.lastObject componentsSeparatedByString:@":"];
    return [NSString stringWithFormat:@"%@ %@:%@", times.firstObject,hours.firstObject,hours.count>1?hours[1]:@"00"];
}

+ (NSString*)onlyText {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    NSString *uniqueId = (__bridge NSString *)(uuidStringRef);
    return uniqueId;
}

@end
