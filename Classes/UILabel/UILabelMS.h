//
//  UILabelMS.h
//  Vehicle
//
//  Created by 牛宏飞 on 2019/6/13.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabelMS : UILabel

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat boardWidth;
@property (nonatomic, assign) IBInspectable UIColor *boardColor;

@end

NS_ASSUME_NONNULL_END
