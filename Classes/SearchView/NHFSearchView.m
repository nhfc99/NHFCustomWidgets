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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _searchImageView = [UIImageView new];
        [self addSubview:_searchImageView];
        
        _textLabel = [UILabel new];
        [self addSubview:_textLabel];
    }
    return self;
}

@end















