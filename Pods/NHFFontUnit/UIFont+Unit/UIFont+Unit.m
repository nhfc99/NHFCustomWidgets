//
//  UIFont+Unit.m
//  jinhe
//
//  Created by Keneng on 16/3/20.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import "UIFont+Unit.h"

@implementation UIFont (Unit)

+ (UIFont *)fontByName:(NSString *)fontName
              fontSize:(CGFloat)fontSize{
    if (fontName == nil) {
        fontName = @"PingFang SC";
    }
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    if (font == nil) {
        fontName = @"Heiti SC";
        font = [UIFont fontWithName:fontName size:fontSize];
    }
    return font;
}

@end
