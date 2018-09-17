//
//  UIimage+Unit.m
//  rockqywx
//
//  Created by rockontrol on 15/2/28.
//  Copyright (c) 2015年 XMPPFramework. All rights reserved.
//

#import "UIimage+Unit.h"

@implementation UIImage (Unit)

//通过原来的图片的大小和一个已知的宽度来计算高度
+(CGFloat)calculateHeightWithWidth:(CGFloat)width resourceSize:(CGSize)size
{
    return size.height*width/size.width;
}

//通过原来的图片的大小和一个已知的高度来计算宽度
+(CGFloat)calculateWidthWithHeight:(CGFloat)height resourceSize:(CGSize)size
{
    return height*size.width/size.height;
}

+ (UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIImage *newImage = nil;
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
            
        }
        else{
            
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [image drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(UIImage*)createCentreImage:(UIImage *)image size:(CGSize )size percent:(float)percent{

    float newSize = size.width;
//    －－缩放比例
    CGAffineTransform scaleTransform;
    CGPoint origin;
//    图片大小大于图片高度的情况
    if (image.size.width > image.size.height)
    {
        //image原始高度为200，缩放image的高度为400pixels，所以缩放比率为2
        
//        计算缩放比例
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
//        计算画笔的X轴
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else
    {
//        图片的高度大于宽度的情况
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
//        计算画笔的Y轴
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize nsize = CGSizeMake(newSize, newSize);
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(nsize, YES, 0);
    } else
    {
        UIGraphicsBeginImageContext(nsize);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将image原始图片(400x200)pixels缩放为(800x400)pixels
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [image drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    image = UIGraphicsGetImageFromCurrentImageContext();
//    结束画板绘制
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*)createThumbImage:(UIImage *)image size:(CGSize )thumbSize percent:(float)percent
{
    CGSize imageSize = image.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat scaleFactor = 0.0;
    CGPoint thumbPoint = CGPointMake(0.0,0.0);
    CGFloat widthFactor = thumbSize.width / width;
    CGFloat heightFactor = thumbSize.height / height;
    if (widthFactor > heightFactor)  {
        scaleFactor = widthFactor;
    }
    else {
        scaleFactor = heightFactor;
    }
    CGFloat scaledWidth  = width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    if (widthFactor > heightFactor)
    {
        thumbPoint.y = (thumbSize.height - scaledHeight) * 0.5;
    }
    else if (widthFactor < heightFactor)
    {
        thumbPoint.x = (thumbSize.width - scaledWidth) * 0.5;
    }
    UIGraphicsBeginImageContext(thumbSize);
    CGRect thumbRect = CGRectZero;
    thumbRect.origin = thumbPoint;
    thumbRect.size.width  = scaledWidth;
    thumbRect.size.height = scaledHeight;
    [image drawInRect:thumbRect];
    
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *thumbImageData = UIImageJPEGRepresentation(thumbImage, percent);
    return [UIImage imageWithData:thumbImageData];
}

+ (CGSize)calculateImageSizeWithResourceImageSize:(CGSize)resourceImageSize
                                        toBigSize:(CGSize)toBigSize{
    CGSize resourceSize = resourceImageSize;
    resourceSize = CGSizeMake(resourceSize.width/2, resourceSize.height/2);
    
    //相等的情况下
    if (CGSizeEqualToSize(resourceSize, toBigSize)) {
        return resourceSize;
    }
    
    //图片的高度和宽度都小的时候
    if (resourceSize.width < toBigSize.width && resourceSize.height < toBigSize.height) {
        return resourceSize;
    }
    
    //按照美观的角度来看，先进行检测高度满足
    
    //1.当高度相同的情况下
    CGFloat width = [UIImage calculateWidthWithHeight:toBigSize.height resourceSize:resourceImageSize];
    if (width < toBigSize.width) {
        return CGSizeMake(width, toBigSize.height);
    }
    
    //2.如果高度相同的情况下宽度不小于目标宽度，那么肯定是宽度相同的情况下可以放下高度，toBigSize为大小相同的条件
    CGFloat height = [UIImage calculateHeightWithWidth:toBigSize.width resourceSize:resourceImageSize];
    return CGSizeMake(toBigSize.width, height);
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  压缩图片
 *
 *  @param image
 *  @param maxFileSize
 *
 *  @return
 */
+ (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

+(UIImage*) imageWithColor:(UIColor*)color
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














