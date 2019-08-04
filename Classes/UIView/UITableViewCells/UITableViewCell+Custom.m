//
//  UITableViewCell+Custom.m
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/10/15.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "UITableViewCell+Custom.h"

@implementation UITableViewCell (Custom)

+ (id)getTableViewCellTableView:(UITableView *)tableView
         tableViewCellClassName:(NSString *)tableViewCellClassName {
    Class class = NSClassFromString(tableViewCellClassName);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellClassName];
    if (!cell) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellClassName];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (id)getTableViewCellTableView:(UITableView *)tableView
         tableViewCellClassName:(NSString *)tableViewCellClassName
                reuseIdentifier:(NSString *)reuseIdentifier {
    Class class = NSClassFromString(tableViewCellClassName);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellClassName];
    if (!cell) {
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
