//
//  NHFNavigationControllerViewController.h
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/20.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NHFNavigationControllerDelegate

@optional
- (void)setNHFNavigationBarAlpha:(CGFloat)alpha;

@end

@interface NHFNavigationController : UINavigationController

@property (nonatomic, weak) id<NHFNavigationControllerDelegate> nhfDelegate;

@property (nonatomic, retain) UIScreenEdgePanGestureRecognizer *panGestureRecognizer;

//进行截屏
- (void)takeScreenShoot;

//移除截屏
- (void)removeScreenShoot;

/**
 解决手势冲突问题

 @param scrollView --
 */
- (void)requireGestureRecognizerToFailByScrollView:(UIScrollView *)scrollView;

@end
