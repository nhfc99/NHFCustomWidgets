//
//  BaseTableView.m
//  Vehicle
//
//  Created by 牛宏飞 on 2019/7/3.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headerBeginRefreshing = true;
    }
    return self;
}

- (UITableView *)getCurTable {
    return self.tableView == nil?self.mainTableView:self.tableView;
}

//添加下拉
- (void)setAddHeader:(BOOL)addHeader {
    UITableView *tb = self.tableView == nil?self.mainTableView:self.tableView;
    if (addHeader) {
        __weak typeof(self) weakself = self;
        [tb.mj_footer endRefreshing];
        tb.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself toHeaderRequest];
        }];
        [tb.mj_header setHidden:false];
        _headerBeginRefreshing?[tb.mj_header beginRefreshing]:true;
        ((MJRefreshNormalHeader *)(tb.mj_header)).lastUpdatedTimeLabel.hidden = YES;
        ((MJRefreshNormalHeader *)(tb.mj_header)).stateLabel.hidden = YES;
    } else {
        [tb.mj_header setHidden:true];
    }
}

- (void)toHeaderRequest {
    __weak typeof(self) weakSelf = self;
    [[self getCurTable].mj_footer setHidden:true];
    [self headerRequest:^(NSInteger pageSize, NSInteger count) {
        [[weakSelf getCurTable].mj_footer endRefreshing];
        [[weakSelf getCurTable].mj_header endRefreshing];
        if (count >= pageSize) {
            [[weakSelf getCurTable].mj_footer setHidden:false];
            [[weakSelf getCurTable].mj_footer resetNoMoreData];
        } else {
            [[weakSelf getCurTable].mj_footer setHidden:true];
        }
    }];
}

- (void)headerRequest:(void (^)(NSInteger pageSize, NSInteger count))request {
    
}

//添加上拉
- (void)setAddFooter:(BOOL)addFooter {
    UITableView *tb = [self getCurTable];
    if (addFooter) {
        __weak typeof(self) weakSelf = self;
        tb.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf toFooterRequest];
        }];
    }
    [tb.mj_footer setHidden:true];
}

- (void)toFooterRequest {
    __weak typeof(self) weakSelf = self;
    [[self getCurTable].mj_header endRefreshing];
    [self footerRequest:^(NSInteger pageSize, NSInteger count) {
        [[weakSelf getCurTable].mj_footer endRefreshing];
        if (count < pageSize) {
            [[weakSelf getCurTable].mj_footer endRefreshingWithNoMoreData];
        } else {
            [[weakSelf getCurTable].mj_footer resetNoMoreData];
        }
    }];
}

- (void)footerRequest:(void (^)(NSInteger pageSize, NSInteger count))request {
    
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -1, [NHFDevice ScreenSize].width, 1)];
    view.backgroundColor = [UIColor colorWithNumber:0xf6f6f8];
    [tableView setTableFooterView:view];
}

@end
