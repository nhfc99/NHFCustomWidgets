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

static const char *actionBlockKey = "actionBlockKey";

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(NHFActionBlock)action {
    objc_setAssociatedObject(self, actionBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvent];
}

- (void)callActionBlock:(id)sender {
    NHFActionBlock block = (NHFActionBlock)objc_getAssociatedObject(self, actionBlockKey);
    if (block) {
        block();
    }
}

@end
