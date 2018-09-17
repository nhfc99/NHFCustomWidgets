//
//  NHFSearchView.m
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/9/17.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFSearchView.h"
#import <Masonry/Masonry.h>

@interface NHFSearchView ()

@end

@implementation NHFSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        __weak typeof(self) weakself = self;
        _searchImageView = [UIImageView new];
        [self addSubview:_searchImageView];
        [_searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0).offset(14.f);
            make.top.equalTo(@0).offset(9.f);
            make.bottom.equalTo(@0).offset(- 9.f);
            make.width.equalTo(weakself.mas_height);
        }];
        
        _textLabel = [UILabel new];
        [self addSubview:_textLabel];
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakself.searchImageView.mas_right).offset(6.f);
            make.centerY.equalTo(weakself.searchImageView);
        }];
    }
    return self;
}

@end















