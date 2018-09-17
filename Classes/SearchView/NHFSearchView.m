//
//  NHFSearchView.m
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/9/17.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFSearchView.h"

@interface NHFSearchView ()

@end

@implementation NHFSearchView

- (void)initParam {
    _marginY = 9.f;
    _marginLeft = 14.f;
    _searchImageViewTitleBoth = 6.f;
}

- (UIImageView *)searchImageView {
    if (_searchImageView == nil) {
        _searchImageView = [UIImageView new];
    }
    return _searchImageView;
}

- (UILabel *)searchTitleLabel {
    if (_searchTitleLabel == nil) {
        _searchTitleLabel = [UILabel new];
    }
    return _searchTitleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self initParam];
    }
    return self;
}

- (void)createUI:(CGRect)frame {
    CGFloat searchSize = CGRectGetHeight(frame)-2*_marginY;
    self.searchImageView.frame = CGRectMake(_marginLeft, _marginY, searchSize, searchSize);
    [self addSubview:self.searchImageView];

    self.searchTitleLabel.frame = CGRectMake(CGRectGetMaxX(self.searchImageView.frame)+_searchImageViewTitleBoth, CGRectGetMinY(self.searchImageView.frame), CGRectGetWidth(frame)-(CGRectGetMaxX(self.searchImageView.frame)+_searchImageViewTitleBoth)-_searchImageViewTitleBoth, CGRectGetHeight(self.searchImageView.frame));
    self.searchTitleLabel.text = @"输入您要搜索的商品";
    self.searchTitleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.searchTitleLabel];
}

@end















