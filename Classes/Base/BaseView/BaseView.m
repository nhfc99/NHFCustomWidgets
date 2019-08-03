//
//  BaseView.m
//  jinheLV
//
//  Created by 今合网技术部 on 2016/11/24.
//  Copyright © 2016年 今合网技术部. All rights reserved.
//

#import "BaseView.h"
#import <NHFDevice/NHFDevice.h>
#import <NhfUIColorUnit/UIColor+Unit.h>

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}

- (void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -1, [NHFDevice ScreenSize].width, 1)];
    view.backgroundColor = [UIColor colorWithNumber:0xf6f6f8];
    [tableView setTableFooterView:view];
}

- (void)dealloc
{
    NSLog(@"释放视图：%@\n\n\n\n", NSStringFromClass([self class]));
}

@end
