//
//  BaseTableViewController.h
//  jinhe
//
//  Created by 可能科技 on 2018/7/17.
//  Copyright © 2018年 rockontrol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UITableView *mainTableView;

//添加头和脚
@property (nonatomic, assign) BOOL addHeader;
@property (nonatomic, assign) BOOL addFooter;
@property (nonatomic, assign) BOOL headerBeginRefreshing;

- (void)headerRequest:(void(^)(NSInteger pageSize, NSInteger count))request;
- (void)footerRequest:(void(^)(NSInteger pageSize, NSInteger count))request;

//初始化
- (void)initEmptyData;
//隐藏行
- (void)setExtraCellLineHidden:(UITableView *)tableView;

@end
