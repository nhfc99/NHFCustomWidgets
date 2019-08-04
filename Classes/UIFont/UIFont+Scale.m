//
//  UIFont+Scale.m
//  Vehicle
//
//  Created by 可能科技 on 2018/8/11.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "UIFont+Scale.h"
#import <objc/runtime.h>

#define NHFBaseUIScreen 375

@implementation UIFont (Scale)

+ (void)load {
    Method newMethod = class_getClassMethod([self class], @selector(adjustSystemFontOfSize:));
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    method_exchangeImplementations(newMethod, method);
    
    newMethod = class_getClassMethod([self class], @selector(adjustFontWithName:size:));
    method = class_getClassMethod([self class], @selector(fontWithName:size:));
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustSystemFontOfSize:(CGFloat)fontSize {
    UIFont *newFont = [UIFont adjustSystemFontOfSize:fontSize * [UIScreen mainScreen].bounds.size.width/NHFBaseUIScreen];
    return newFont;
}

+ (UIFont *)adjustFontWithName:(NSString *)fontName size:(CGFloat)fontSize {
//    UIFont *newFont = [UIFont adjustFontWithName:fontName size:fontSize * [UIScreen mainScreen].bounds.size.width/NHFBaseUIScreen];
    UIFont *newFont = [UIFont adjustFontWithName:fontName size:fontSize];
    return newFont;
}


@end
