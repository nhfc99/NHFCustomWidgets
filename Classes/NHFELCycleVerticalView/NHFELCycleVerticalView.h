//
//  NHFELCycleVerticalView.h
//  NHFELCycleVerticalView
//
//  Created by etouch on 16/11/1.
//  Copyright © 2016年 EL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NHFELCycleVerticalView;
typedef NS_ENUM(NSInteger, ELCycleVerticalViewScrollDirection) {
    ELCycleVerticalViewScrollDirectionUp = 0,
    ELCycleVerticalViewScrollDirectionDown
};

typedef void(^ClickELCycleVerticalView)(NHFELCycleVerticalView *elCycleVerticalView, NSInteger didClickItemIndex);

@interface NHFELCycleVerticalView : UIView

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) ClickELCycleVerticalView clickELCycleVerticalViewBlock;


/**
 初始化
 */
- (void)initSys;

/**
 设置DataSource之前调用
 
 @param showTime 展示时间
 @param animationTime 动画时间
 @param direction 方向
 @param backgroundColor 背景颜色
 @param textColor 字体颜色
 @param font 字体
 @param textAlignment 对齐
 */
- (void)configureShowTime:(double)showTime
            animationTime:(double)animationTime
                direction:(ELCycleVerticalViewScrollDirection)direction
          backgroundColor:(UIColor *)backgroundColor
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment;

// 开启动画 (主要用于进入其他页面返回时开启)
- (void)startAnimation;

// 关闭动画 (进入其他页面时调用)
- (void)stopAnimation;

@end
