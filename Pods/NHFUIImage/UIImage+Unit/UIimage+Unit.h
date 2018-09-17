//
//  UIimage+Unit.h
//  rockqywx
//
//  Created by rockontrol on 15/2/28.
//  Copyright (c) 2015年 XMPPFramework. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Unit)

+(CGFloat)calculateHeightWithWidth:(CGFloat)width resourceSize:(CGSize)size;
+(CGFloat)calculateWidthWithHeight:(CGFloat)height resourceSize:(CGSize)size;

/**
 *  缩放图片
 *
 *  @param image
 *  @param size
 *
 *  @return
 */
+ (UIImage*)OriginImage:(UIImage *)image
            scaleToSize:(CGSize)size;

/**
 *  压缩图片
 *
 *  @param image
 *  @param thumbSize
 *  @param percent
 *
 *  @return
 */
+ (UIImage*)createThumbImage:(UIImage *)image
                        size:(CGSize )thumbSize
                     percent:(float)percent;


/**
 *  截取图片中间部分
 *
 *  @param image
 *  @param thumbSize
 *  @param percent
 *
 *  @return
 */
+(UIImage*)createCentreImage:(UIImage *)image
                        size:(CGSize )size
                     percent:(float)percent;



/**
 *  进行按比例进行缩比例图片的大小
 *
 *  @param resourceImageSize
 *  @param toBigSize
 *
 *  @return 
 */
+ (CGSize)calculateImageSizeWithResourceImageSize:(CGSize)resourceImageSize
                                        toBigSize:(CGSize)toBigSize;

/**
 *  用于配置SearchBar的背景色
 *
 *  @param color
 *  @param size
 *
 *  @return 
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  压缩图片
 *
 *  @param image
 *  @param maxFileSize
 *
 *  @return 
 */
+ (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;

/**
 *  通过颜色来得到图片
 *
 *  @param color
 *
 *  @return
 */
+(UIImage*) imageWithColor:(UIColor*)color;


@end









