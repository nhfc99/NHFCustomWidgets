//
//  NHFCycleView.m
//  JHHealthShop
//
//  Created by 牛宏飞 on 2019/4/26.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import "NHFCycleView.h"
#import "Masonry.h"
#import "NHFTimer.h"

@implementation NHFCycleParam

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.animateDuration = 1.5;
        self.interval = 3.f;
    }
    return self;
}

@end

@interface NHFCycleView () <UIScrollViewDelegate> {
    CGFloat width;
}

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) UIView *view0;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
//页码
@property (nonatomic, assign) NSInteger currentIndex;
//定时器
@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, assign) CGFloat animateDuration;
@property (nonatomic, assign) NSTimeInterval interval;
@property (nonatomic, retain) NSArray *viewObjects;

@end

@implementation NHFCycleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //基础参数
        _cycleParam = [NHFCycleParam new];
        
        _mainScrollView = [UIScrollView new];
        _mainScrollView.bounces = false;
        _mainScrollView.delegate = self;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.pagingEnabled = YES;
        [self addSubview:_mainScrollView];
        
        self.view0 = [UIView new];
        [self.mainScrollView addSubview:self.view0];
        
        self.view1 = [UIView new];
        [self.mainScrollView addSubview:self.view1];
        
        self.view2 = [UIView new];
        [self.mainScrollView addSubview:self.view2];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    width = CGRectGetWidth(self.frame);
    _mainScrollView.frame = CGRectMake(0, 0, width, CGRectGetHeight(self.frame));
    _mainScrollView.contentSize = CGSizeMake(width * 3, CGRectGetHeight(self.frame));
    self.view0.frame = CGRectMake(0, 0, width, CGRectGetHeight(self.frame));
    self.view1.frame = CGRectMake(width, 0, width, CGRectGetHeight(self.frame));
    self.view2.frame = CGRectMake(width * 2, 0, width, CGRectGetHeight(self.frame));
}

- (void)start {
    NSMutableArray *list = [[NSMutableArray alloc] initWithArray:self.cycleParam.viewObjects];
    if (self.cycleParam.viewObjects.count == 0) {
        return;
    }
    
    if (self.cycleParam.viewObjects.count == 1) {
        [list addObject:self.cycleParam.viewObjects.firstObject];
        [list addObject:self.cycleParam.viewObjects.firstObject];
    }
    
    if (self.cycleParam.viewObjects.count == 2) {
        [list addObject:self.cycleParam.viewObjects.firstObject];
    }
    
    self.currentIndex = 0;
    self.animateDuration = self.cycleParam.animateDuration;
    self.interval = self.cycleParam.interval;
    self.viewObjects = self.cycleParam.viewObjects;
    
    [self loopTimer];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self resetView:scrollView.contentOffset.x];
    _mainScrollView.contentOffset = CGPointMake(width, 0);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startAutoScroll:self.interval];
}

- (void)startAutoScroll:(NSTimeInterval)interval {
    _timer = [NHFTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(loopTimer) userInfo:nil repeats:YES];
}

- (void)loopTimer {
    CGPoint offset = CGPointMake(width * 2, 0);
    
    [UIView animateWithDuration:self.animateDuration animations:^{
        self->_mainScrollView.contentOffset = offset;
    } completion:^(BOOL finished) {
        [self resetView:offset.x];
        self->_mainScrollView.contentOffset = CGPointMake(self->width, 0);
    }];
}

- (void)resetView:(CGFloat)offsetX {
    if (offsetX == 2 * width) {
        if (_currentIndex == (_viewObjects.count - 1)) {
            _currentIndex = 0;
        } else {
            _currentIndex += 1;
        }
    } else if (offsetX == 0) {
        if (_currentIndex == 0) {
            _currentIndex = _viewObjects.count - 1;
        } else {
            _currentIndex -= 1;
        }
    }
    
    if (_curPage) {
        _curPage(_currentIndex);
    }
    
    //移除所有的对象
    for (UIView *view in self.viewObjects) {
        [view removeFromSuperview];
    }
    
    //中间
    UIView *view = self.viewObjects[_currentIndex];
    [self.view1 addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view1);
    }];
    
    //左边
    if (_currentIndex - 1 == -1) {
        view = self.viewObjects[self.viewObjects.count - 1];
    } else {
        view = self.viewObjects[_currentIndex - 1];
    }
    [self.view0 addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view0);
    }];
    
    //右边
    if (_currentIndex + 1 == self.viewObjects.count) {
        view = self.viewObjects[0];
    } else {
        view = self.viewObjects[_currentIndex + 1];
    }
    [self.view2 addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view2);
    }];
}

- (void)setInterval:(NSTimeInterval)interval {
    _interval = interval;
    if (self.timer != nil) {
        [self.timer invalidate];
    }
    
    [self startAutoScroll:interval];
}

- (void)dealloc
{
    
}

@end

