//
//  NHFSearchView.h
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/9/17.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHFSearchView : UIView

@property (nonatomic, strong) UIImageView *searchImageView;
@property (nonatomic, strong) UILabel *searchTitleLabel;

@property (nonatomic, assign) CGFloat marginY;
@property (nonatomic, assign) CGFloat marginLeft;
@property (nonatomic, assign) CGFloat searchImageViewTitleBoth;

@property (nonatomic, strong) UILabel *textLabel;

- (void)initParam;

- (void)createUI:(CGRect)frame;

@end
