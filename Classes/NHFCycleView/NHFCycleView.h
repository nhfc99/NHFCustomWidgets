//
//  NHFCycleView.h
//  JHHealthShop
//
//  Created by 牛宏飞 on 2019/4/26.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NHFCycleParam : NSObject

@property (nonatomic, assign) CGFloat animateDuration;
@property (nonatomic, assign) CGFloat interval;
@property (nonatomic, retain) NSArray *viewObjects;
@property (nonatomic, readonly, retain) NSArray *modelObjects;


/**
 整理Model的可用性，用于符合轮询的原则。
 返回为nil的时候说明不可用，非nil的时候将会将整理完毕后的model列表返回
 用户必须使用返回来的model列表进行构建视图，然后传递至该容器中，否则可能会出现轮询不合理的地方
 当用户点击的时候将会将model和page返回来

 @param resource --
 @return --
 */
- (NSArray *)checkModels:(NSArray *)resource;

@end

typedef void(^kNHFPage)(NSInteger page, id model);

@interface NHFCycleView : UIView

@property (nonatomic, copy) kNHFPage curPage;
@property (nonatomic, copy) kNHFPage tapIndex;

@property (nonatomic, retain) NHFCycleParam *cycleParam;

//开启
- (void)start;

@end

NS_ASSUME_NONNULL_END
