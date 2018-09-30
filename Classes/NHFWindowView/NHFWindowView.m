//
//  NHFWindowView.m
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/30.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFWindowView.h"

@implementation NHFWindowView

static NHFWindowView *object = nil;
+ (instancetype)getInstancetype {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        object = [[NHFWindowView alloc] init];
    });
    return object;
}

- (void)modalView:(nullable id)view
       touchClose:(BOOL)touchClose
            touch:(nullable TouchObject)touch
            color:(nullable UIColor *)color
         animated:(BOOL)animated
            close:(nullable NHFWindowViewClose)nhfWindowViewClose {
    //显关闭之前的视图
    [self closeWindowAlertWithanimated:false];
    
    //绑定回调
    _touch = touch;
    _nhfWindowViewClose = nhfWindowViewClose;
    
    //视图
    if (view == nil) {
        return;
    }
    _theView = view;
    _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:_bgView];
    [window addSubview:view];
    
    //颜色
    if (color == nil) {
        color = [UIColor colorWithWhite:0 alpha:0.5];
    }
    [_bgView setBackgroundColor:color];
    
    //触摸
    if (touchClose) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchWindow)];
        [_bgView addGestureRecognizer:tapGesture];
    }
    
    //渐显动画
    if (animated) {
        [_bgView setAlpha:0];
        [UIView animateWithDuration:0.2 animations:^{
            [self->_bgView setAlpha:1];
        } completion:nil];
    }
}

- (void)touchWindow {
    if (_touch == nil) {
        [self closeWindowAlertWithanimated:true];
    } else {
        _touch();
    }
}

- (void)closeWindowAlertWithanimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            [((UIView*)self->_theView) setAlpha:0];
            [self->_bgView setAlpha:0];
        } completion:^(BOOL finished) {
            [self removeView:self->_theView];
            [self removeView:self->_bgView];
            
            if (self->_nhfWindowViewClose != nil) {
                self->_nhfWindowViewClose();
            }
        }];
    } else {
        [self removeView:_theView];
        [self removeView:_bgView];
        
        if (_nhfWindowViewClose != nil) {
            _nhfWindowViewClose();
        }
    }
}

- (void)removeView:(UIView *)view {
    [view removeFromSuperview];
    view = nil;
}

@end
