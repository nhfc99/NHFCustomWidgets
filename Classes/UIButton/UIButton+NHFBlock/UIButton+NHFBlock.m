//
//  UIButton+Block.m
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/9/12.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "UIButton+NHFBlock.h"
#import <objc/runtime.h>

@implementation UIButton (NHFBlock)

char const *actionBlockKey = "actionBlockKey";

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)event
                 withBlock:(NHFActionBlock)action {
    objc_setAssociatedObject(self, actionBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionBlock:) forControlEvents:event];
}

- (void)actionBlock:(id)sender {
    NHFActionBlock block = (NHFActionBlock)objc_getAssociatedObject(self, actionBlockKey);
    if (block) {
        block();
    }
}

@end
