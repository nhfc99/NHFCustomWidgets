//
//  UIButtonMS.m
//  QFStudyWorkerTemplate
//
//  Created by 可能科技 on 2018/7/5.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "UIButtonMS.h"

@implementation UIButtonMS

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBoardWidth:(CGFloat)boardWidth {
    self.layer.borderWidth = boardWidth;
    self.layer.masksToBounds = YES;
}

- (void)setBoardColor:(UIColor *)boardColor {
    self.layer.borderColor = boardColor.CGColor;
    self.layer.masksToBounds = YES;
}

@end
