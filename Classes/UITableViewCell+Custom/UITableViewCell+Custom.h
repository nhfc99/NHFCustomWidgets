//
//  UITableViewCell+Custom.h
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/10/15.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Custom)

+ (id)getTableViewCellTableView:(UITableView *)tableView
         tableViewCellClassName:(NSString *)tableViewCellClassName;

@end

NS_ASSUME_NONNULL_END
