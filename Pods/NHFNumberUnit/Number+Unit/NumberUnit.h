//
//  Number+Unit.h
//  jinhe
//
//  Created by 今合网技术部 on 15/11/17.
//  Copyright © 2015年 rockontrol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberUnit : NSObject

/**
 *  默认保留2位小数
 *
 *  @param data
 *
 *  @return
 */
+ (NSString *)formatFloat:(CGFloat)data;

/**
 *  默认保留3为小数
 *
 *  @param data
 *
 *  @return
 */
+ (NSString *)formatFloatThree:(CGFloat)data;


/**
 处理精度的问题

 @param price
 @param roundingMode
 @param position
 @return
 */
+ (NSDecimalNumber *)notRounding:(CGFloat)price
                    roundingMode:(NSRoundingMode)roundingMode
                      afterPoint:(NSInteger)position;


/**
 加精度

 @param resourceDecimalNumber
 @param price
 @param roundingMode
 @param position
 @return 
 */
+ (NSDecimalNumber *)addNSDecimalNumberByNumber:(NSDecimalNumber *)resourceDecimalNumber
                                           data:(CGFloat)price
                                   roundingMode:(NSRoundingMode)roundingMode
                                     afterPoint:(NSInteger)position;

@end
