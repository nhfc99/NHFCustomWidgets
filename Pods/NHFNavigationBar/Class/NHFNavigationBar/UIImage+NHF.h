//
//  UIImage+NHF.h
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/21.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NHF)

/**
 设置图片透明度

 @param alpha --
 @param image --
 @return --
 */
+ (UIImage *)nhfImageByAlpha:(CGFloat)alpha image:(UIImage*)image;


/**
 设置颜色透明度拿到图片

 @param alpha --
 @param color --
 @return --
 */
+ (UIImage *)nhfImageWithAlpha:(CGFloat)alpha color:(UIColor *)color;


/**
 通过颜色拿到图片

 @param color
 @return 
 */
+ (UIImage*)nhfImageWithColor:(UIColor*)color;

@end











