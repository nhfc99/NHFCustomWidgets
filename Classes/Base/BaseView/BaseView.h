//
//  BaseView.h
//  jinheLV
//
//  Created by 今合网技术部 on 2016/11/24.
//  Copyright © 2016年 今合网技术部. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

- (UIViewController *)viewController;

- (UIViewController *)getPresentedViewController;

- (void)setExtraCellLineHidden: (UITableView *)tableView;

@end
