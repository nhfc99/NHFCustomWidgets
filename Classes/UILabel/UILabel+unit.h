//
//  UILabel+unit.h
//  zjproject
//
//  Created by rockontrol on 15/4/4.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(unit)

/**
 *  获取自适应大小，默认的宽度为320
 *
 *  @param content
 *  @param font
 *
 *  @return
 */
+ (CGSize)labelConstrainedToSize:(NSString*)content font:(UIFont*)font;

/**
 *  根据宽度来进行实现默认的大小
 *
 *  @param width
 *  @param content
 *  @param font
 *
 *  @return 
 */
+ (CGSize)labelConstrainedHeightByWidth:(CGFloat)width content:(NSString*)content font:(UIFont*)font;

@end
