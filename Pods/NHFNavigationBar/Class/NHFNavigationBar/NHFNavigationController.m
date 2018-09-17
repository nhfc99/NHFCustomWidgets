//
//  NHFNavigationControllerViewController.m
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/20.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#define  NHFCoverAlpha 0.8

#import "NHFNavigationController.h"
#import "UINavigationBar+NHF.h"
#import "UIViewController+NHF.h"

@interface NHFNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSMutableArray *lastVCScreenShootArray;
@property (nonatomic, strong) UIImageView *lastVCScreenShootImageView;
@property (nonatomic, strong) UIView *lastVCScreenCoverView;

@end

@implementation NHFNavigationController

//截频资源
- (NSMutableArray *)lastVCScreenShootArray {
    if (!_lastVCScreenShootArray) {
        _lastVCScreenShootArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _lastVCScreenShootArray;
}

//进行截频
- (void)takeScreenShoot {
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size,NO,0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * newScreenSnapImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.lastVCScreenShootArray addObject:newScreenSnapImg];
}

//最后一张截频
- (UIImageView *)lastVCScreenShootImageView {
    if (!_lastVCScreenShootImageView) {
        UIImageView *shootImageView = [[UIImageView alloc] init];
        shootImageView.frame = self.view.bounds;
        
        [self.view.superview addSubview:shootImageView];
        [self.view.superview insertSubview:shootImageView atIndex:0];
        
        [self.view.superview insertSubview:self.lastVCScreenCoverView atIndex:1];
        _lastVCScreenShootImageView = shootImageView;
    }
    
    return _lastVCScreenShootImageView;
}

//图片上边的一张图片
- (UIView *)lastVCScreenCoverView {
    if (!_lastVCScreenCoverView) {
        UIView *converView = [[UIView alloc] init];
        converView.backgroundColor = [UIColor grayColor];
        converView.frame = self.view.bounds;
        converView.alpha = NHFCoverAlpha;
        [self.view.superview addSubview:converView];
        _lastVCScreenCoverView = converView;
    }
    
    return _lastVCScreenCoverView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    [self.navigationBar setTranslucent:YES];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    [self addPanGestureRecognizer];
}

//添加手势
- (void)addPanGestureRecognizer {
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(popViewController:)];
    panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)popViewController:(UIPanGestureRecognizer *)recognizer {
    CGPoint transition = [recognizer translationInView:self.view];
    if (transition.x > 0) {
        self.view.transform = CGAffineTransformMakeTranslation(transition.x, 0);
        self.lastVCScreenShootImageView.image = [self.lastVCScreenShootArray lastObject];
        
        self.lastVCScreenCoverView.alpha = NHFCoverAlpha * (1 - transition.x / self.view.frame.size.width);
        
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            if (transition.x > self.view.frame.size.width / 3) {
                [UIView animateWithDuration:0.25 animations:^{
                    self.lastVCScreenCoverView.alpha = 0;
                    self.view.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
                } completion:^(BOOL finished) {
                    self.view.transform = CGAffineTransformIdentity;
                    [super popViewControllerAnimated:NO];
                    
                    [self.lastVCScreenShootArray removeLastObject];
                }];
            } else {
                [UIView animateWithDuration:0.25 animations:^{
                    self.lastVCScreenCoverView.alpha = NHFCoverAlpha;
                    self.view.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    
                }];
            }
        }
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.popGestureRecognizerEnable) {
        return NO;
    }
    if (self.childViewControllers.count<=1) {
        return NO;
    }
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self takeScreenShoot];
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    [self.lastVCScreenShootArray removeLastObject];
    return [super popViewControllerAnimated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end










