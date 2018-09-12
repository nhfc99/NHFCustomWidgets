//
//  UIButton+Block.h
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/9/12.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NHFActionBlock)(void);

@interface UIButton (NHFBlock)

@property (readonly) NSMutableDictionary *event;

- (void)handleControlEvent:(UIControlEvents)event
                 withBlock:(NHFActionBlock)action;

@end
