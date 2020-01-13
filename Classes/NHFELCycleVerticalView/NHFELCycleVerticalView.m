//
//  ELCycleVerticalView.m
//  CycleVerticalView
//
//  Created by etouch on 16/11/1.
//  Copyright © 2016年 EL. All rights reserved.
//

#import "NHFELCycleVerticalView.h"
#import "Masonry.h"

@implementation NHFELCycleVerticalView {
    NSInteger       _indexNow;
    
    double          _showTime;
    double          _animationTime;
    ELCycleVerticalViewScrollDirection  _direction;
    
    UIButton        *_button;
    
    NSMutableArray  *_animationViewArray;
    NSTimer         *_timer;
    
    UILabel *_tmpAnimationView1;
    UILabel *_tmpAnimationView2;
    
    UILabel *_tmpTopView;
    UILabel *_tmpBtmView;
    UILabel *_tmpMiddleView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSys];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)initSys {
    _showTime = 3;
    _animationTime = 0.5;
    [self initUI];
}

- (void)setTopRectByView:(UIView *)view {
    [view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0).offset(0.f);
        make.bottom.equalTo(self.mas_top);
        make.width.mas_equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
    }];
}

- (void)setBtmRectByView:(UIView *)view {
    [view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0).offset(0.f);
        make.top.equalTo(self.mas_bottom);
        make.width.mas_equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
    }];
}

- (void)setMiddleRectByView:(UIView *)view {
    [view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)initUI {
    _tmpAnimationView1 = [UILabel new];
    _tmpAnimationView1.backgroundColor = [UIColor whiteColor];
    [self addSubview:_tmpAnimationView1];
    [self setMiddleRectByView:_tmpAnimationView1];
    
    _tmpAnimationView2 = [[UILabel alloc] init];
    _tmpAnimationView2.backgroundColor = [UIColor whiteColor];
    [self addSubview:_tmpAnimationView2];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.backgroundColor = [UIColor clearColor];
    [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
    [self setMiddleRectByView:_button];
    
    _animationViewArray = [NSMutableArray array];
    [_animationViewArray addObject:_tmpAnimationView1];
    [_animationViewArray addObject:_tmpAnimationView2];
    self.clipsToBounds = YES;
}

- (void)configureShowTime:(double)showTime
            animationTime:(double)animationTime
                direction:(ELCycleVerticalViewScrollDirection)direction
          backgroundColor:(UIColor *)backgroundColor
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment {
    _showTime = showTime;
    _animationTime = animationTime;
    _direction = direction;
    _tmpAnimationView1.backgroundColor = _tmpAnimationView2.backgroundColor = backgroundColor;
    if (textColor != nil) {
        _tmpAnimationView1.textColor = _tmpAnimationView2.textColor = textColor;
    }
    if (font != nil) {
        _tmpAnimationView1.font = _tmpAnimationView2.font = font;
    }
    _tmpAnimationView1.textAlignment = _tmpAnimationView2.textAlignment = textAlignment;
    if (_direction == ELCycleVerticalViewScrollDirectionDown) {
        [self setTopRectByView:_tmpAnimationView2];
    } else {
        [self setBtmRectByView:_tmpAnimationView2];
    }
}

- (void)setDirection:(ELCycleVerticalViewScrollDirection)direction{
    _direction = direction;
    if (_direction == ELCycleVerticalViewScrollDirectionDown) {
        [self setTopRectByView:_tmpAnimationView2];
    } else {
        [self setBtmRectByView:_tmpAnimationView2];
    }
}

- (void)setDataSource:(NSArray *)dataSource {
    [self stopAnimation];
    _dataSource = dataSource;
    _indexNow = 0;
    if (_dataSource.count == 0) {
        return;
    }
    [self startAnimation];
}

- (void)startAnimation {
    [self setViewInfo];
    if (_dataSource.count > 0) {
        [self stopTimer];
        _timer = [NSTimer scheduledTimerWithTimeInterval:_showTime target:self selector:@selector(executeAnimation) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)executeAnimation{
    [self setViewInfo];
    [UIView animateWithDuration:_animationTime delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (self->_direction == ELCycleVerticalViewScrollDirectionDown) {
            [self setBtmRectByView:self->_tmpMiddleView];
        } else {
            [self setTopRectByView:self->_tmpMiddleView];
        }
        
        if (self->_direction == ELCycleVerticalViewScrollDirectionDown) {
            [self setMiddleRectByView:self->_tmpTopView];
        } else {
            [self setMiddleRectByView:self->_tmpBtmView];
        }
        [self layoutIfNeeded];
    } completion:nil];
    
    [self performSelector:@selector(finished)
               withObject:nil
               afterDelay:_animationTime];
    
}

- (void)finished {
    if (_direction == ELCycleVerticalViewScrollDirectionDown) {
        [self setTopRectByView:_tmpMiddleView];
    } else {
        [self setBtmRectByView:_tmpMiddleView];
    }
    
    _indexNow ++;
}

- (void)setViewInfo{
    if (_direction == ELCycleVerticalViewScrollDirectionDown) {
        if (_tmpAnimationView1.frame.origin.y == 0) {
            _tmpMiddleView = _tmpAnimationView1;
            _tmpTopView = _tmpAnimationView2;
        } else {
            _tmpMiddleView = _tmpAnimationView2;
            _tmpTopView = _tmpAnimationView1;
        }
    } else {
        if (_tmpAnimationView1.frame.origin.y == 0) {
            _tmpMiddleView = _tmpAnimationView1;
            _tmpBtmView = _tmpAnimationView2;
        } else {
            _tmpMiddleView = _tmpAnimationView2;
            _tmpBtmView = _tmpAnimationView1;
        }
    }
    if(_dataSource.count > 0){
        [self setDataBy:_tmpMiddleView data:_dataSource[_indexNow%(_dataSource.count)]];
        
        if (_direction == ELCycleVerticalViewScrollDirectionDown) {
            [self setDataBy:_tmpTopView data:_dataSource[(_indexNow+1)%(_dataSource.count)]];
        } else {
            [self setDataBy:_tmpBtmView data:_dataSource[(_indexNow+1)%(_dataSource.count)]];
        }
    }
}

- (void)setDataBy:(UILabel *)label
             data:(id)dataObj {
    if ([dataObj isKindOfClass:[NSAttributedString class]]) {
        label.attributedText = (NSAttributedString *)dataObj;
    } else {
        label.text = (NSString *)dataObj;
    }
}

- (void)stopAnimation {
    [self stopTimer];
    [self.layer removeAllAnimations];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)stopTimer{
    if(_timer){
        if([_timer isValid]){
            [_timer invalidate];
        }
        _timer = nil;
    }
}

- (void)btnClick{
    if (_clickELCycleVerticalViewBlock != nil && _dataSource.count > 0) {
        _clickELCycleVerticalViewBlock(self, _indexNow%(_dataSource.count));
    }
}

- (void)dealloc{
    
}

@end
