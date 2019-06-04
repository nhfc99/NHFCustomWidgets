//
//  UITextField+Attribute.h
//  Vehicle
//
//  Created by 牛宏飞 on 2019/6/3.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Attribute)

- (void)setAttributedPlaceText:(NSString *)text
                         color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
