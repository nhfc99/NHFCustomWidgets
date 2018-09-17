//
//  NHFRadioButton.m
//  jinhe
//
//  Created by 今合网技术部 on 16/6/29.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import "NHFRadioButton.h"

#define NHFRadioButtonBaseTag 200

@implementation NHFRadioButton

- (instancetype)initWithFrame:(CGRect)frame
           NHFRadioButtonType:(NHFRadioButtonType)nhfRadioButtonType
                everyLineBoth:(CGFloat)everyLineBoth
                    bothSides:(CGFloat)bothSides
      buttonWithRightViewBoth:(CGFloat)buttonWithRightViewBoth
         NHFRadioButtonAction:(NHFRadioButtonAction)nhfRadioButtonAction {
    self = [super initWithFrame:frame];
    if (self) {
        _nhfRadioButtonType = nhfRadioButtonType;
        _selectItem = 0;
        _everyLineBoth = everyLineBoth;
        _bothSides = bothSides;
        _buttonWithRightViewBoth = buttonWithRightViewBoth;
        _nhfRadioButtonAction = nhfRadioButtonAction;
        _leftImageSize = 20.f;
        _allButtons = [NSMutableArray new];
        _allLeftImageViews = [NSMutableArray new];
        _mutableSelectItems = [NSMutableArray new];
    }
    return self;
}

- (void)reloadView {
    for (UIButton *button in _allButtons) {
        [button removeFromSuperview];
    }
    [_allButtons removeAllObjects];
    _allButtons = nil;
    _allButtons = [NSMutableArray new];
    
    [_allLeftImageViews removeAllObjects];
    _allLeftImageViews = nil;
    _allLeftImageViews = [NSMutableArray new];
    
    [self updateView];
}

- (void)updateView {
    if (_rightViews.count != 0) {
        CGFloat everyHeight = (CGRectGetHeight(self.frame)-(_rightViews.count+1)*_everyLineBoth)/_rightViews.count;
        for (int i=0; i<_rightViews.count; i++) {
            UIView *view = _rightViews[i];
            CGFloat width = _bothSides*2+_leftImageSize+_buttonWithRightViewBoth+CGRectGetWidth(view.frame);
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:(NHFRadioButtonBaseTag+i)];
            [button setFrame:CGRectMake(0, _everyLineBoth+(_everyLineBoth+everyHeight)*i, width, everyHeight)];
            [button addTarget:self action:@selector(clickButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _leftImageSize, _leftImageSize)];
            [imageView setCenter:CGPointMake(_bothSides+_leftImageSize/2, everyHeight/2)];
            if (_selectItem == i) {
                [imageView setImage:_selectIco];
            } else {
                [imageView setImage:_unSelectIcos];
            }
            [_allLeftImageViews addObject:imageView];
            [button addSubview:imageView];
            
            [view setCenter:CGPointMake(CGRectGetMaxX(imageView.frame)+_buttonWithRightViewBoth+CGRectGetWidth(view.frame)/2, CGRectGetHeight(button.frame)/2)];
            [button addSubview:view];
            
            [self addSubview:button];
        }
    }
}

- (void)setSelectItem:(NSInteger)item {
    switch (_nhfRadioButtonType) {
        case NHFRadioButtonTypeOnlyOneSelect:{
            if (_selectItem != item) {
                //改变原来的
                UIImageView *imageView = _allLeftImageViews[_selectItem];
                [imageView setImage:_unSelectIcos];
                
                //更新现在的
                _selectItem = item;
                imageView = _allLeftImageViews[_selectItem];
                [imageView setImage:_selectIco];
            }
        }
            break;
            
        case NHFRadioButtonTypeMutableSelect:{
            if ([_mutableSelectItems indexOfObject:[NSNumber numberWithInteger:item]] == NSNotFound) {
                [_mutableSelectItems addObject:[NSNumber numberWithInteger:item]];
                
                //更新现在的
                UIImageView *imageView = _allLeftImageViews[item];
                [imageView setImage:_selectIco];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)clickButtonEvent:(UIButton *)sender {
    NSInteger item = sender.tag - NHFRadioButtonBaseTag;
    if (_nhfRadioButtonAction != nil) {
        _nhfRadioButtonAction(item);
    }
    
    switch (_nhfRadioButtonType) {
        case NHFRadioButtonTypeOnlyOneSelect:{
            if (_selectItem != item) {
                //改变原来的
                UIImageView *imageView = _allLeftImageViews[_selectItem];
                [imageView setImage:_unSelectIcos];
                
                //更新现在的
                _selectItem = item;
                imageView = _allLeftImageViews[_selectItem];
                [imageView setImage:_selectIco];
            }
        }
            break;
            
        case NHFRadioButtonTypeMutableSelect:{
            if ([_mutableSelectItems indexOfObject:[NSNumber numberWithInteger:item]] == NSNotFound) {
                [_mutableSelectItems addObject:[NSNumber numberWithInteger:item]];
                
                //更新现在的
                UIImageView *imageView = _allLeftImageViews[item];
                [imageView setImage:_selectIco];
            } else {
                [_mutableSelectItems removeObject:[NSNumber numberWithInteger:item]];
                
                //更新现在的
                UIImageView *imageView = _allLeftImageViews[item];
                [imageView setImage:_unSelectIcos];
            }
        }
            break;
            
        default:
            break;
    }
}

@end














