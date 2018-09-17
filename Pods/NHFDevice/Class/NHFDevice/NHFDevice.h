//
//  NHFDevice.h
//  NHFDevice
//
//  Created by 牛宏飞 on 2018/8/11.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

//判断是否是iPhoneX
#define  NH_iPhoneX (NH_ScreenWidth == 375.f && NH_ScreenHeight == 812.f ? YES : NO)

@interface NHFDevice : NSObject


/**
 如果使用了UIScrollViewContentInsetAdjustmentNever/automaticallyAdjustsScrollViewInsets = NO之后
 适配iPhoneX顶部的问题

 @return -
 */
+ (CGFloat)ScrollViewInsets;


/**
 获取设备大小
 
 @return -
 */
+ (CGSize)ScreenSize;


/**
 状态栏的高度
 
 @return -
 */
+ (CGFloat)StatusBarHeight;


/**
 导航栏高度
 
 @return -
 */
+ (CGFloat)ScreenNavgationBarHeight;


/**
 导航栏和状态栏之和
 
 @return -
 */
+ (CGFloat)ScreenTTop;


/**
 TabBar的高度
 
 @return -
 */
+ (CGFloat)ScreenTabbarHeight;


/**
 底部偏移量
 
 @return -
 */
+ (CGFloat)BottomOffset;


/**
 资源路径
 
 @param filename -
 @return -
 */
+ (NSString*)AppBaseResourcePath:(NSString*)filename;


/**
 文档路径
 
 @param filename -
 @return -
 */
+ (NSString*)AppBaseDocumentPath:(NSString*)filename;


/**
 缓存路径
 
 @param filename -
 @return -
 */
+ (NSString*)AppBaseCachePath:(NSString*)filename;

/**
 *  根据给定的宽度算出等比例的高度
 *
 *  @param width -
 *  @param size -
 *
 *  @return -
 */
+ (CGFloat)scalHeightByWidth:(CGFloat)width
                      BySize:(CGSize)size;

+ (CGFloat)scalWidthByHeight:(CGFloat)height
                      BySize:(CGSize)size;

@end















