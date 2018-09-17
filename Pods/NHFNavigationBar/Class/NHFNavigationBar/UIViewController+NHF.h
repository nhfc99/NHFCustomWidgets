//
//  UIViewController+NHF.h
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/20.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NHF)

//隐藏导航栏
@property (nonatomic, assign) BOOL nhfHidBar;
//TintColor
@property (nonatomic, strong) UIColor *nhfTintColor;
//BarTintColor
@property (nonatomic, strong, readonly) UIColor *nhfBarTintColor;
//TitleColor
@property (nonatomic, strong) UIColor *nhfTitleColor;
//控制滑动返回
@property (nonatomic, assign) BOOL popGestureRecognizerEnable;
//是否隐藏导航栏底部的线条
@property (nonatomic, assign) CGFloat nhfShadowImageAlpha;
//设置标题属性
@property (nonatomic, strong) NSDictionary *nhfTitleTextAttributes;
//设置状态栏
@property (nonatomic, assign) UIStatusBarStyle nhfStatusBarStyle;
//获取导航栏背景透明度
@property (nonatomic, assign, readonly) CGFloat nhfNavBarAlpha;
//导航栏背景图片
@property (nonatomic, strong, readonly) UIImage *nhfBarBackgroundImage;


/**
 设置导航栏背景颜色（单一色调）以及透明度

 @param color --
 @param alpha --
 */
- (void)setNhfBarTintColor:(UIColor *)color alpha:(CGFloat)alpha;


/**
 设置导航栏背景图片以及透明度

 @param image --
 @param alpha --
 */
- (void)setNhfBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha;

//左边
/**
 自定义返回按钮

 @param image --
 @param action --
 */
- (void)setLeftItemImage:(UIImage *)image action:(SEL)action;


/**
 添加左边文字按钮

 @param title --
 @param action --
 @param color --
 @param font --
 */
- (void)addLeftItemTitle:(NSString*)title
                  action:(SEL)action
                   color:(UIColor *)color
                    font:(UIFont *)font;

/**
 添加左边图片按钮

 @param image --
 @param action --
 */
- (void)addLeftItemImage:(UIImage *)image action:(SEL)action;


//右边
/**
 添加右边的按钮添加文字

 @param title --
 @param action --
 @param color --
 @param font --
 */
- (void)addRightItemTitle:(NSString*)title
                   action:(SEL)action
                    color:(UIColor *)color
                     font:(UIFont *)font;

/**
 添加右边的按钮添加图片

 @param image --
 @param action --
 */
- (void)addRightItemImage:(UIImage *)image action:(SEL)action;

/**
 设置右边的按钮

 @param title --
 @param action --
 @param color --
 @param font --
 */
- (void)setRightItemTitle:(NSString *)title
                   action:(SEL)action
                    color:(UIColor *)color
                     font:(UIFont *)font;


/**
 设置右边的图片按钮

 @param image --
 @param action --
 */
- (void)setRightItemImage:(UIImage *)image action:(SEL)action;

@end














