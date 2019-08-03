//
//  UIButton+ZFBadge.m
//  ZFUikitBadgeNumber
//
//  Created by 张锋 on 16/9/8.
//  Copyright © 2016年 张锋. All rights reserved.
//

#import "UIButton+ZFBadge.h"
#import <objc/runtime.h>

static const void *kBadgeValueTag = @"kBadgeValueTag";
static const void *kBadgeLabelTag = @"kBadgeLabelTag";
static const void *kBadgeMinSizeTag = @"kBadgeMinSizeTag";
static const void *kBadgePaddingTag = @"kBadgePaddingTag";
static const void *kBadgeTextColorTag = @"kBadgeTextColorTag";
static const void *kBadgeBackgroundColorTag = @"kBadgeBackgroundColorTag";
static const void *kBadgeFontTag = @"kBadgeFontTag";
static const void *kBadgeAnimatedTag = @"kBadgeAnimatedTag";
static const void *kbadgePointPaddingTag = @"kbadgePointPaddingTag";

@interface UIButton ()
//-- 显示角标的控件
@property (nonatomic, weak) UILabel *badgeLabel;
//-- 此参数是为了当角标设置为红点时，红点显示位置不正确而设置的偏移量
@property (nonatomic) CGFloat badgePointPadding;

@end

@implementation UIButton (ZFBadge)

- (void)commonInit
{
    self.clipsToBounds = NO;
    self.badgeMinSize = 8.f;
    self.badgePadding = 6.f;
    self.badgeAnimated = YES;
    self.badgeTextColor = [UIColor whiteColor];
    self.badgeBackgroundColor = [UIColor redColor];
    self.badgeFont = self.badgeFont? self.badgeFont : ([UIFont systemFontOfSize:13.f]);
    self.badgePointPadding = self.badgePointPadding? self.badgePointPadding : 0;
    
    UILabel *badgeLabel = [[UILabel alloc] init];
    badgeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:badgeLabel];
    self.badgeLabel = badgeLabel;
    
    [self updateBadgeLabel];
}

- (void)updateBadgeLabel
{
    UILabel *badgeLabel = self.badgeLabel;
    badgeLabel.text = self.badgeValue;
    badgeLabel.textColor = self.badgeTextColor;
    badgeLabel.backgroundColor = self.badgeBackgroundColor;
    badgeLabel.font = self.badgeFont;
    
    [badgeLabel sizeToFit];
    CGSize expectedSize = badgeLabel.frame.size;
    
    CGFloat minWidth = expectedSize.width;
    CGFloat minHeight = expectedSize.height;
    // 根据设置的最小值，重新设置角标高度，并且如果宽度<高度，那么让角标宽度=高度，防止切圆角的时候切错
    minHeight = (minHeight < self.badgeMinSize)? self.badgeMinSize : minHeight;
    minWidth = (minWidth < minHeight)? minHeight : minWidth;
    
    CGFloat badgePointPadding = self.badgePointPadding;
    CGFloat originX = self.frame.size.width - minWidth/2 - badgePointPadding;
    CGFloat originY = - (minHeight/2) - badgePointPadding;
    
    badgeLabel.frame = CGRectMake(originX, originY, minWidth+self.badgePadding, minHeight+self.badgePadding);
    badgeLabel.layer.cornerRadius = (minHeight+self.badgePadding)/2;
    badgeLabel.layer.masksToBounds = YES;
}

- (void)updateBadgeValueAnimated:(BOOL)animated
{
    if (!self.badgeValue) return;
    
    [self updateBadgeLabel];
    
    if (animated) {
        // 放大
        CABasicAnimation *largeAni = [CABasicAnimation animation];
        largeAni.keyPath = @"transform.scale";
        largeAni.fromValue = [NSNumber numberWithFloat:1.f];
        largeAni.toValue = [NSNumber numberWithFloat:1.3f];
        largeAni.duration = 0.15f;
        // 缩小
        CABasicAnimation *smallAni = [CABasicAnimation animation];
        smallAni.keyPath = @"transform.scale";
        smallAni.fromValue = [NSNumber numberWithFloat:1.3f];
        smallAni.toValue = [NSNumber numberWithFloat:1.f];
        smallAni.duration = 0.15f;
        // 添加到动画数组
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = @[largeAni, smallAni];
        [self.badgeLabel.layer addAnimation:group forKey:nil];
    }
}

- (void)removeBadgeValue
{
    if (!self.badgeLabel) return;
    
    [self.badgeLabel removeFromSuperview];
    self.badgeLabel = nil;
}

#pragma mark - setter&getter

- (NSString *)badgeValue
{
    return objc_getAssociatedObject(self, &kBadgeValueTag);
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &kBadgeValueTag, badgeValue, OBJC_ASSOCIATION_COPY);
    
    if (!badgeValue && self.badgeLabel) {
        [self removeBadgeValue];
        return;
    };
    
    if ([badgeValue isEqualToString:@""]) {
        self.badgePointPadding = 2.f;
        self.badgeFont = [UIFont systemFontOfSize:10.f];
    }
    
    if (!self.badgeLabel) {
        [self commonInit];
        [self updateBadgeValueAnimated:NO];
    }
    else {
        [self updateBadgeValueAnimated:self.badgeAnimated];
    }
}

- (UILabel *)badgeLabel
{
    return objc_getAssociatedObject(self, &kBadgeLabelTag);
}

- (void)setBadgeLabel:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &kBadgeLabelTag, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)badgeAnimated
{
    return [objc_getAssociatedObject(self, &kBadgeAnimatedTag) boolValue];
}

- (void)setBadgeAnimated:(BOOL)badgeAnimated
{
    objc_setAssociatedObject(self, &kBadgeAnimatedTag, [NSNumber numberWithBool:badgeAnimated], OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)badgeMinSize
{
    return [objc_getAssociatedObject(self, &kBadgeMinSizeTag) floatValue];
}

- (void)setBadgeMinSize:(CGFloat)badgeMinSize
{
    objc_setAssociatedObject(self, &kBadgeMinSizeTag, [NSNumber numberWithFloat:badgeMinSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)badgePadding
{
    return [objc_getAssociatedObject(self, &kBadgePaddingTag) floatValue];
}

- (void)setBadgePadding:(CGFloat)badgePadding
{
    objc_setAssociatedObject(self, &kBadgePaddingTag, [NSNumber numberWithFloat:badgePadding], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)badgeTextColor
{
    return objc_getAssociatedObject(self, &kBadgeTextColorTag);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &kBadgeTextColorTag, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (badgeTextColor) {
        [self updateBadgeLabel];
    }
}

- (UIColor *)badgeBackgroundColor
{
    return objc_getAssociatedObject(self, &kBadgeBackgroundColorTag);
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor
{
    objc_setAssociatedObject(self, &kBadgeBackgroundColorTag, badgeBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (badgeBackgroundColor) {
        [self updateBadgeLabel];
    }
}

- (UIFont *)badgeFont
{
    return objc_getAssociatedObject(self, &kBadgeFontTag);
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &kBadgeFontTag, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (badgeFont) {
        [self updateBadgeLabel];
    }
}

- (CGFloat)badgePointPadding
{
    return [objc_getAssociatedObject(self, &kbadgePointPaddingTag) floatValue];
}

- (void)setBadgePointPadding:(CGFloat)badgePointPadding
{
    objc_setAssociatedObject(self, &kbadgePointPaddingTag, [NSNumber numberWithFloat:badgePointPadding], OBJC_ASSOCIATION_ASSIGN);
}

@end
