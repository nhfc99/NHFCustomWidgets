//
//  BaseViewController.h
//  QFStudyWorkerTemplate
//
//  Created by 可能科技 on 2018/7/4.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//键盘控制
@property (nonatomic, assign) BOOL keyboardEnable;
//隐藏导航栏
@property (nonatomic, assign) BOOL hidBar;
//TintColor
@property (nonatomic, strong) UIColor *tintColor;
//BarTintColor
@property (nonatomic, strong, readonly) UIColor *barTintColor;
//TitleColor
@property (nonatomic, strong) UIColor *titleColor;
//控制滑动返回
@property (nonatomic, assign) BOOL popGestureEnable;
//是否隐藏导航栏底部的线条
@property (nonatomic, assign) CGFloat shadowImageAlpha;
//设置标题属性
@property (nonatomic, strong) NSDictionary *titleTextAttributes;
//设置状态栏
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
//导航栏背景透明度
@property (nonatomic, assign, readonly) CGFloat navBarAlpha;
//导航栏背景图片
@property (nonatomic, strong, readonly) UIImage *barBackgroundImage;
//导航栏透明度
@property (nonatomic, assign) BOOL useNavAllBarAlpha;
@property (nonatomic, assign) CGFloat navAllBarAlpha;

/**
 设置导航栏背景颜色（单一色调）以及透明度
 
 @param color --
 @param alpha --
 */
- (void)setBarTintColor:(UIColor *)color alpha:(CGFloat)alpha;
- (void)setBarTintColor:(UIColor *)color alpha:(CGFloat)alpha translucent:(BOOL)translucent;

/**
 设置导航栏背景图片以及透明度
 
 @param image --
 @param alpha --
 */
- (void)setBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha;
- (void)setBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha translucent:(BOOL)translucent;

//左边
/**
 自定义返回按钮
 
 @param image --
 @param action --
 */
- (void)setCurLeftItemImage:(UIImage *)image action:(SEL)action;


/**
 添加左边文字按钮
 
 @param title --
 @param action --
 @param color --
 @param font --
 */
- (void)addCurLeftItemTitle:(NSString*)title
                     action:(SEL)action
                      color:(UIColor *)color
                       font:(UIFont *)font;

/**
 添加左边图片按钮
 
 @param image --
 @param action --
 */
- (void)addCurLeftItemImage:(UIImage *)image action:(SEL)action;


//右边
/**
 添加右边的按钮添加文字
 
 @param title --
 @param action --
 @param color --
 @param font --
 */
- (void)addCurRightItemTitle:(NSString*)title
                      action:(SEL)action
                       color:(UIColor *)color
                        font:(UIFont *)font;

/**
 添加右边的按钮添加图片
 
 @param image --
 @param action --
 */
- (void)addCurRightItemImage:(UIImage *)image action:(SEL)action;

/**
 设置右边的按钮
 
 @param title --
 @param action --
 @param color --
 @param font --
 */
- (void)setCurRightItemTitle:(NSString *)title
                      action:(SEL)action
                       color:(UIColor *)color
                        font:(UIFont *)font;


/**
 设置右边的按钮

 @param image --
 @param action --
 */
- (void)setCurRightItemImage:(UIImage *)image action:(SEL)action;


/**
 返回
 */
- (void)backButtonNavItem;


/**
 清除缓存
 */
- (void)clearWebCache;


@end
