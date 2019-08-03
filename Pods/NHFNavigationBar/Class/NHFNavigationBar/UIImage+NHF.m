//
//  UIImage+NHF.m
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/21.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "UIImage+NHF.h"

@implementation UIImage (NHF)

+ (UIImage *)nhfImageByAlpha:(CGFloat)alpha image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)nhfImageWithAlpha:(CGFloat)alpha color:(UIColor *)color {
    UIColor *curcolor = [UIImage nhfGetNewColorWith:color alpha:alpha];
    CGSize colorSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContext(colorSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, curcolor.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIColor *)nhfGetNewColorWith:(UIColor *)color
                          alpha:(CGFloat)alpha {
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat oalpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&oalpha];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return newColor;
}

+ (UIImage*)nhfImageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
