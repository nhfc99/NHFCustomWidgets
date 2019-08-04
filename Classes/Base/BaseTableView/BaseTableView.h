//
//  BaseTableView.h
//  Vehicle
//
//  Created by 牛宏飞 on 2019/7/3.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableView : BaseView

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UITableView *mainTableView;

//添加头和脚
@property (nonatomic, assign) BOOL addHeader;
@property (nonatomic, assign) BOOL addFooter;
@property (nonatomic, assign) BOOL headerBeginRefreshing;

- (void)headerRequest:(void(^)(NSInteger pageSize, NSInteger count))request;
- (void)footerRequest:(void(^)(NSInteger pageSize, NSInteger count))request;

//隐藏行
- (void)setExtraCellLineHidden:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
