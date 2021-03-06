//
//  NHFWindowView.h
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/30.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    NHFWindowLevel1 = 1,
    NHFWindowLevel2 = 2,
    NHFWindowLevel3 = 3,
    NHFWindowLevel4 = 4,
    NHFWindowLevel5 = 5,
} NHFWindowLevel;

typedef void(^TouchObject)(void);
typedef void(^NHFWindowViewClose)(void);

@interface NHFWindowView : UIView

@property (nonatomic, copy) TouchObject touch;
@property (nonatomic, copy) NHFWindowViewClose nhfWindowViewClose;

//基础视图
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, weak) id theView;
@property (nonatomic, strong) UIWindow *window;

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



/**
 关闭上边的高级提醒框

 @param animated --
 */
- (void)closeWindowAlertWithanimated:(BOOL)animated;

/**
 模态视图自由显示视图
 
 @param view 视图
 @param touchClose 点击关闭
 @param touch 触摸回调
 @param color 背景色 可以为空
 @param animated 是否有动画
 @param nhfWindowViewClose 关闭回调
 @param nhfWindowLevel 等级
 */
- (void)modalView:(nullable id)view
       touchClose:(BOOL)touchClose
            touch:(nullable TouchObject)touch
            color:(nullable UIColor *)color
         animated:(BOOL)animated
            close:(nullable NHFWindowViewClose)nhfWindowViewClose
   nhfWindowLevel:(NHFWindowLevel)nhfWindowLevel;

@end

NS_ASSUME_NONNULL_END
