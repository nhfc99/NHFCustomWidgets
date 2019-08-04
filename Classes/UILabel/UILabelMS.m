//
//  UILabelMS.m
//  Vehicle
//
//  Created by 牛宏飞 on 2019/6/13.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import "UILabelMS.h"

@implementation UILabelMS

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
