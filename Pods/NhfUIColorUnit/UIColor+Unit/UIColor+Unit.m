//
//  UIColor+Unit.m
//  zjproject
//
//  Created by rockontrol on 15/3/28.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import "UIColor+Unit.h"
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIColor (Unit)

+ (UIColor*)colorWithNumber:(int)colorCode
{
    return kUIColorFromRGB(colorCode);
}

@end
