//
//  UIColor+Unit.h
//  zjproject
//
//  Created by rockontrol on 15/3/28.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Unit)

/**
 *  将颜色值转成UIColor
 *
 *  @param colorCode
 *
 *  @return 
 */
+ (UIColor*)colorWithNumber:(int)colorCode;

@end
