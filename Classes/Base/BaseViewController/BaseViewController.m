//
//  BaseViewController.m
//  QFStudyWorkerTemplate
//
//  Created by 可能科技 on 2018/7/4.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+NHF.h"
#import "NHFNavigationController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface BaseViewController () <NHFNavigationControllerDelegate> {
    UIColor *navigationBarBackgroundColor;
    UIImageView *shadowImageView;
}

//默认设置
@property (nonatomic, assign) UIStatusBarStyle defaultStatusBarStyle;
@property (nonatomic, assign) BOOL recognizerEnabled;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)resetValues {
    //键盘控制
    self.keyboardEnable = true;
    //隐藏导航栏
    self.hidBar = false;
    //TintColor
    self.tintColor = [UIColor blackColor];
    //TitleColor
    self.titleColor = [UIColor blackColor];
    //控制滑动返回
    self.popGestureEnable = true;
    //设置状态栏
    self.statusBarStyle = UIStatusBarStyleDefault;
    //导航栏背景透明度
    [self setBarTintColor:[UIColor whiteColor] alpha:1.f];
    //默认背景不透明
    [self.navigationController.navigationBar setTranslucent:false];
    //默认导航栏的透明度为1
    self.navAllBarAlpha = 1;
    //默认添加的是一个返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        [self setLeftItemImage:[UIImage imageNamed:@"Back_icon"] action:@selector(backButtonNavItem)];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    ((NHFNavigationController *)self.navigationController).nhfDelegate = self;
    [self resetValues];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    ((NHFNavigationController *)self.navigationController).nhfDelegate = nil;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - 设置导航栏透明度 BEGIN
- (void)setNavAllBarAlpha:(CGFloat)navAllBarAlpha {
    _navAllBarAlpha = round(navAllBarAlpha * 100) / 100;
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setAlpha:)]) {
        self.navigationController.navigationBar.alpha = _navAllBarAlpha;
    }
}

- (void)setNHFNavigationBarAlpha:(CGFloat)alpha {
    if (_useNavAllBarAlpha &&
        self.navAllBarAlpha != alpha) {
        self.navigationController.navigationBar.alpha = self.navAllBarAlpha;
    }
}

#pragma mark - 设置导航栏透明度 END

- (void)clearWebCache {
    //清除cookies
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    //清除webView的缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

#pragma mark - 设置Bar
- (void)setBarTintColor:(UIColor *)color alpha:(CGFloat)alpha {
    [self setNhfBarTintColor:color alpha:alpha];
}

- (void)setBarTintColor:(UIColor *)color alpha:(CGFloat)alpha translucent:(BOOL)translucent {
    [self setNhfBarTintColor:color alpha:alpha translucent:translucent];
}

- (void)setBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha {
    [self setNhfBarBackgroundImage:image alpha:alpha];
}

- (void)setBarBackgroundImage:(UIImage *)image alpha:(CGFloat)alpha translucent:(BOOL)translucent {
    [self setNhfBarBackgroundImage:image alpha:alpha translucent:translucent];
}

- (void)setHidBar:(BOOL)hidBar {
    self.nhfHidBar = hidBar;
}

- (BOOL)hidBar {
    return self.nhfHidBar;
}

- (void)setTintColor:(UIColor *)tintColor {
    self.nhfTintColor = tintColor;
}

- (UIColor *)tintColor {
    return self.tintColor;
}

- (UIColor *)barTintColor {
    return self.nhfBarTintColor;
}

- (void)setTitleColor:(UIColor *)titleColor {
    self.nhfTitleColor = titleColor;
}

- (UIColor *)titleColor {
    return self.nhfTitleColor;
}

- (void)setPopGestureEnable:(BOOL)popGestureEnable {
    self.popGestureRecognizerEnabled = popGestureEnable;
}

- (BOOL)popGestureEnable {
    return self.popGestureRecognizerEnabled;
}

- (void)setShadowImageAlpha:(CGFloat)shadowImageAlpha {
    self.nhfShadowImageAlpha = shadowImageAlpha;
}

- (CGFloat)shadowImageAlpha {
    return self.nhfShadowImageAlpha;
}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes {
    self.nhfTitleTextAttributes = titleTextAttributes;
}

- (NSDictionary *)titleTextAttributes {
    return self.nhfTitleTextAttributes;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    self.nhfStatusBarStyle = statusBarStyle;
}

- (UIStatusBarStyle)statusBarStyle {
    return self.nhfStatusBarStyle;
}

- (CGFloat)navBarAlpha {
    return self.nhfNavBarAlpha;
}

- (UIImage *)barBackgroundImage {
    return self.nhfBarBackgroundImage;
}

- (void)setKeyboardEnable:(BOOL)keyboardEnable {
    _keyboardEnable = keyboardEnable;
    [IQKeyboardManager sharedManager].enable = _keyboardEnable;
}

- (void)backButtonNavItem {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setCurLeftItemImage:(UIImage *)image action:(SEL)action {
    [self setLeftItemImage:image action:action];
}

- (void)addCurLeftItemTitle:(NSString*)title
                     action:(SEL)action
                      color:(UIColor *)color
                       font:(UIFont *)font {
    [self addLeftItemTitle:title action:action color:color font:font];
}

- (void)addCurLeftItemImage:(UIImage *)image action:(SEL)action {
    [self addLeftItemImage:image action:action];
}

- (void)addCurRightItemTitle:(NSString*)title
                      action:(SEL)action
                       color:(UIColor *)color
                        font:(UIFont *)font {
    [self addRightItemTitle:title action:action color:color font:font];
}

- (void)addCurRightItemImage:(UIImage *)image action:(SEL)action {
    [self addRightItemImage:image action:action];
}

- (void)setCurRightItemTitle:(NSString *)title
                      action:(SEL)action
                       color:(UIColor *)color
                        font:(UIFont *)font {
    [self setRightItemTitle:title action:action color:color font:font];
}

- (void)setCurRightItemImage:(UIImage *)image action:(SEL)action {
    [self setRightItemImage:image action:action];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"释放控制器：%@\n\n\n\n", NSStringFromClass([self class]));
}

@end
