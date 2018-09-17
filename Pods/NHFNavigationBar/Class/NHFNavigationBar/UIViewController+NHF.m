//
//  UIViewController+NHF.m
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/20.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "UIViewController+NHF.h"
#import "UINavigationBar+NHF.h"
#import "NHFNavigationController.h"
#import "UIImage+NHF.h"
#import <objc/runtime.h>

static const char *kBarBackgroundImage = "kBarBackgroundImage";
static const char *kHidBar = "kHidBar";
static const char *kNhfTintColor = "kNhfTintColor";
static const char *kNhfBarTintColor = "kNhfBarTintColor";
static const char *kPopGestureRecognizerEnable = "kPopGestureRecognizerEnable";
static const char *kShadowImageAlpha = "kShadowImageAlpha";
static const char *kNhfTitleTextAttributes = "kNhfTitleTextAttributes";
static const char *kStatusBarStyle = "kStatusBarStyle";
static const char *kTitleColor = "kTitleColor";
static const char *kNavBarAlpha = "kNavBarAlpha";
static const NSInteger fontSize = 17;

@interface UIViewController ()

@end

@implementation UIViewController (NHF)

- (void)setNhfBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha {
    UIImage *curImage = image;
    if (alpha != 1 &&
        alpha != 0) {
        curImage = [UIImage nhfImageByAlpha:alpha image:image];
    }
    
    if (alpha == 0) {
        curImage = [UIImage new];
    }
    //记录透明度
    self.nhfNavBarAlpha = alpha;
    //设置当前的图片
    self.nhfBarBackgroundImage = image;
    //设置
    [self.navigationController.navigationBar setBackgroundImage:curImage forBarMetrics:UIBarMetricsDefault];
}

- (void)setNhfBarTintColor:(UIColor *)color alpha:(CGFloat)alpha {
    UIImage *curImage = [UIImage nhfImageWithColor:color];
    if (alpha != 1 &&
        alpha != 0) {
        curImage = [UIImage nhfImageWithAlpha:alpha color:color];
    }
    
    if (alpha == 0) {
        curImage = [UIImage new];
    }
    //记录透明度
    self.nhfNavBarAlpha = alpha;
    //设置当前的背景色
    self.nhfBarTintColor = color;
    //设置
    [self.navigationController.navigationBar setBackgroundImage:curImage forBarMetrics:UIBarMetricsDefault];
}

- (void)setNhfBarBackgroundImage:(UIImage *)nhfBarBackgroundImage {
    [self.navigationController.navigationBar setBackgroundImage:nhfBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    
    objc_setAssociatedObject(self, kBarBackgroundImage, nhfBarBackgroundImage,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)nhfBarBackgroundImage {
    return objc_getAssociatedObject(self, kBarBackgroundImage);
}

- (void)setNhfHidBar:(BOOL)nhfHidBar {
    [self.navigationController setNavigationBarHidden:nhfHidBar animated:true];
    
    objc_setAssociatedObject(self, kHidBar, [NSNumber numberWithBool:nhfHidBar],OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)nhfHidBar {
    return [objc_getAssociatedObject(self, kHidBar) boolValue];
}

- (void)setNhfTintColor:(UIColor *)nhfTintColor {
    self.navigationController.navigationBar.tintColor = nhfTintColor;
    
    objc_setAssociatedObject(self, kNhfTintColor, nhfTintColor,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nhfTintColor {
    return objc_getAssociatedObject(self, kNhfTintColor);
}

- (void)setNhfBarTintColor:(UIColor *)nhfBarTintColor {
    self.navigationController.navigationBar.barTintColor = nhfBarTintColor;
    
    objc_setAssociatedObject(self, kNhfBarTintColor, nhfBarTintColor,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nhfBarTintColor {
    return objc_getAssociatedObject(self, kNhfBarTintColor);
}

- (void)setPopGestureRecognizerEnable:(BOOL)popGestureRecognizerEnable {
    ((NHFNavigationController *)self.navigationController).popGestureRecognizerEnable = popGestureRecognizerEnable;
    objc_setAssociatedObject(self, kPopGestureRecognizerEnable, [NSNumber numberWithBool:popGestureRecognizerEnable],OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)popGestureRecognizerEnable {
    NSNumber *number = objc_getAssociatedObject(self, kPopGestureRecognizerEnable);
    return [number boolValue];
}

- (void)setNhfShadowImageAlpha:(CGFloat)nhfShadowImageAlpha {
    UIColor *color = [UIColor colorWithRed:207.f/255.0f green:207.f/255.0f blue:207.f/255.0f alpha:nhfShadowImageAlpha];
    [self.navigationController.navigationBar setShadowImage:[UIImage nhfImageWithColor:color]];
    
    objc_setAssociatedObject(self, kShadowImageAlpha, [NSNumber numberWithFloat:nhfShadowImageAlpha],OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)nhfShadowImageAlpha {
    NSNumber *number = objc_getAssociatedObject(self, kShadowImageAlpha);
    return [number floatValue];
}

- (void)setNhfTitleTextAttributes:(NSDictionary *)nhfTitleTextAttributes {
    [self.navigationController.navigationBar setTitleTextAttributes:nhfTitleTextAttributes];
    
    objc_setAssociatedObject(self, kNhfTitleTextAttributes, nhfTitleTextAttributes,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)nhfTitleTextAttributes {
    return objc_getAssociatedObject(self, kNhfTitleTextAttributes);
}

- (void)setNhfStatusBarStyle:(UIStatusBarStyle)nhfStatusBarStyle {
    [UIApplication sharedApplication].statusBarStyle = nhfStatusBarStyle;
    
    objc_setAssociatedObject(self, kStatusBarStyle, [NSNumber numberWithInteger:nhfStatusBarStyle], OBJC_ASSOCIATION_ASSIGN);
}

- (UIStatusBarStyle)nhfStatusBarStyle {
    return [objc_getAssociatedObject(self, kStatusBarStyle) integerValue];
}

- (void)setNhfTitleColor:(UIColor *)nhfTitleColor {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:nhfTitleColor}];
    
    objc_setAssociatedObject(self, kTitleColor, nhfTitleColor,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nhfTitleColor {
    return objc_getAssociatedObject(self, kTitleColor);
}

- (void)setNhfNavBarAlpha:(CGFloat)nhfNavBarAlpha {
    self.nhfShadowImageAlpha = nhfNavBarAlpha;
    objc_setAssociatedObject(self, kNavBarAlpha, [NSNumber numberWithFloat:nhfNavBarAlpha],OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)nhfNavBarAlpha {
    return [objc_getAssociatedObject(self, kNavBarAlpha) floatValue];
}

- (UIImageView *)curShadowImageView {
    UIImageView *shadowImageView = nil;
    NSArray *subViews = allSubviews(self.navigationController.navigationBar);
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height<1){
            //实践后发现系统的横线高度为0.333
            shadowImageView = (UIImageView *)view;
        }
    }
    return shadowImageView;
}

NSArray *allSubviews(UIView *aView) {
    NSArray *results = [aView subviews];
    for (UIView *eachView in aView.subviews)
    {
        NSArray *subviews = allSubviews(eachView);
        if (subviews)
            results = [results arrayByAddingObjectsFromArray:subviews];
    }
    return results;
}

- (void)setLeftItemImage:(UIImage *)image action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]  style:UIBarButtonItemStylePlain target:self action:action];
    NSMutableArray *items = [NSMutableArray new];
    [items addObject:item];
    self.navigationItem.leftBarButtonItems = items;
}

- (void)addLeftItemTitle:(NSString*)title
                  action:(SEL)action
                   color:(UIColor *)color
                    font:(UIFont *)font {
    UIFont *curFont = font==nil?[UIFont systemFontOfSize:fontSize]:font;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:curFont,
                                   NSForegroundColorAttributeName:color==nil?self.nhfTintColor:color}
                        forState:UIControlStateNormal];
    NSMutableArray *items = [NSMutableArray new];
    [items addObjectsFromArray:self.navigationItem.leftBarButtonItems];
    [items addObject:item];
    self.navigationItem.leftBarButtonItems = items;
}

- (void)addLeftItemImage:(UIImage *)image action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]  style:UIBarButtonItemStylePlain target:self action:action];
    NSMutableArray *items = [NSMutableArray new];
    [items addObjectsFromArray:self.navigationItem.leftBarButtonItems];
    [items addObject:item];
    self.navigationItem.leftBarButtonItems = items;
}

- (void)addRightItemTitle:(NSString*)title
                   action:(SEL)action
                    color:(UIColor *)color
                     font:(UIFont *)font {
    UIFont *curFont = font==nil?[UIFont systemFontOfSize:fontSize]:font;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:curFont,
                                   NSForegroundColorAttributeName:color==nil?self.nhfTintColor:color}
                        forState:UIControlStateNormal];
    NSMutableArray *items = [NSMutableArray new];
    [items addObjectsFromArray:self.navigationItem.rightBarButtonItems];
    [items addObject:item];
    self.navigationItem.rightBarButtonItems = items;
}

- (void)addRightItemImage:(UIImage *)image action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]  style:UIBarButtonItemStylePlain target:self action:action];
    NSMutableArray *items = [NSMutableArray new];
    [items addObjectsFromArray:self.navigationItem.rightBarButtonItems];
    [items addObject:item];
    self.navigationItem.rightBarButtonItems = items;
}

- (void)setRightItemTitle:(NSString *)title
                   action:(SEL)action
                    color:(UIColor *)color
                     font:(UIFont *)font {
    UIFont *curFont = font==nil?[UIFont systemFontOfSize:fontSize]:font;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:curFont,NSForegroundColorAttributeName:color==nil?self.nhfTintColor:color}
                        forState:UIControlStateNormal];
    NSMutableArray *items = [NSMutableArray new];
    [items addObject:item];
    self.navigationItem.rightBarButtonItems = items;
}

- (void)setRightItemImage:(UIImage *)image action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]  style:UIBarButtonItemStylePlain target:self action:action];
    NSMutableArray *items = [NSMutableArray new];
    [items addObject:item];
    self.navigationItem.rightBarButtonItems = items;
}

@end













