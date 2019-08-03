//
//  UIButton+ZFBadge.h
//  ZFUikitBadgeNumber
//
//  Created by 张锋 on 16/9/8.
//  Copyright © 2016年 张锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZFBadge)

//-- 角标显示的信息，可以为数字和文字 (在设置其他属性之前，请务必先设置此属性!!!)
//-- 1、如果要设置为小圆点，请设置此参数为`@""`
//-- 2、如果要移除角标，请设置此参数为`nil`
@property (nonatomic) NSString *badgeValue;

//-- 角标数字改变时是否使用动画（默认YES）
@property (nonatomic, assign) BOOL badgeAnimated;

//-- 角标宽/高最小值（默认8）
@property (nonatomic, assign) CGFloat badgeMinSize;

//-- 角标内容距离其角标控件左右边距距离（默认6）
@property (nonatomic, assign) CGFloat badgePadding;

//-- 角标文字颜色
@property (nonatomic, strong) UIColor *badgeTextColor;

//-- 角标背景色
@property (nonatomic, strong) UIColor *badgeBackgroundColor;

//-- 角标字体
@property (nonatomic, strong) UIFont *badgeFont;

@end
