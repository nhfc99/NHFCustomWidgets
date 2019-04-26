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

@end

typedef void(^kNHFPage)(NSInteger page);

@interface NHFCycleView : UIView

@property (nonatomic, copy) kNHFPage curPage;
@property (nonatomic, copy) kNHFPage tapIndex;

@property (nonatomic, retain) NHFCycleParam *cycleParam;

//开启
- (void)start;

@end

NS_ASSUME_NONNULL_END
