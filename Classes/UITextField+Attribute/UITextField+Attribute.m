//
//  UITextField+Attribute.m
//  Vehicle
//
//  Created by 牛宏飞 on 2019/6/3.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import "UITextField+Attribute.h"

@implementation UITextField (Attribute)

- (void)setAttributedPlaceText:(NSString *)text
                         color:(UIColor *)color {
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:self.font}];
    self.attributedPlaceholder = attrString;
}

@end
