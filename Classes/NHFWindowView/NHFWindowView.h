//
//  NHFWindowView.h
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/30.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TouchObject)(void);
typedef void(^NHFWindowViewClose)(void);

@interface NHFWindowView : UIView {
    //全局弹出提示框
    UIView *_bgView;
    __weak id _theView;
}

@property (nonatomic, copy) TouchObject touch;
@property (nonatomic, copy) NHFWindowViewClose nhfWindowViewClose;

+ (instancetype)getInstancetype;

/**
 模态视图自由显示视图

 @param view 视图
 @param touchClose 点击关闭
 @param touch 触摸回调
 @param color 背景色 可以为空
 @param animated 是否有动画
 @param nhfWindowViewClose 关闭回调
 */
- (void)modalView:(nullable id)view
       touchClose:(BOOL)touchClose
            touch:(nullable TouchObject)touch
            color:(nullable UIColor *)color
         animated:(BOOL)animated
            close:(nullable NHFWindowViewClose)nhfWindowViewClose;

//关闭上边的高级提醒框
- (void)closeWindowAlertWithanimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
