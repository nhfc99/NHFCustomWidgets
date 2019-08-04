//
//  NSString+unit.h
//  zjproject
//
//  Created by rockontrol on 15/4/15.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface NSString(unit)

/**
 *  将汉字转成UTF8
 *
 *  @return --
 */
- (NSString*)hzToUTF8;

/**
 *  检查手机号码
 *
 *  @return --
 */
- (BOOL)checkPhoneNumInput;

//只检查手机号是否为纯数字
- (BOOL) checkPhoneNum;

/**
 *  去掉文本两边的空格
 *
 *  @return --
 */
- (NSString*)stringTrim;

/**
 *  获取随机码
 *
 *  @param from  --
 *  @param to  --
 *
 *  @return --
 */
+ (NSString*)getRandomNumber:(NSInteger)from to:(NSInteger)to;

/**
 *  整形判断
 *
 *  @param string --
 *
 *  @return --
 */
+ (BOOL)isPureInt:(NSString *)string;

/**
 *  浮点形判断
 *
 *  @param string --
 *
 *  @return --
 */
+ (BOOL)isPureFloat:(NSString *)string;

/**
 *  进行md5加密
 *
 *  @return --
 */
- (NSString *)md5;

/**
 *  将汉字转成拼音
 *
 *  @return --
 */
- (NSString *)pinYin;

/**
 *  根据定位的信息处理距离信息
 *
 *  @param instance --
 *
 *  @return --
 */
+ (NSString *)locationInstance:(CGFloat)instance;

/**
 *  转向UTF8编码
 *
 *  @param string --
 *
 *  @return --
 */
+ (NSString *)toUTF8:(NSString *)string;

/**
 *  测试字符串是否是空的数据
 *
 *  @param string --
 *
 *  @return --
 */
+ (BOOL)isEmpty:(NSString *)string;

/**
 去掉html标签

 @return --
 */
- (NSString *)removeHTMLString;

/**
 判断空

 @param string --
 @return --
 */
+ (NSString *)isNullToString:(id)string;

/**
 判断是否为空

 @param string --
 @return --
 */
+ (BOOL)isNullString:(id)string;

/**
 青风头像处理

 @return --
 */
- (NSString *)qfHeadPath;

+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)jsonStringWithArray:(NSArray *)array;

+ (NSString *)jsonStringWithString:(NSString *) string;

+ (NSString *)jsonStringWithObject:(id) object;

@property (nonatomic, strong, readonly) NSString *jhTimeToDay;
@property (nonatomic, strong, readonly) NSString *jhTimeToMin;

+ (NSString*)onlyText;

@end
