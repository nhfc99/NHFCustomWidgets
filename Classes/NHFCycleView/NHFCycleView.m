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

#define kNHFCycleViewBaseTag 1000

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

- (NSArray *)checkModels:(NSArray *)resource {
    NSMutableArray *list = [[NSMutableArray alloc] initWithArray:resource];
    if (resource.count == 0) {
        return nil;
    }
    
    if (resource.count == 1) {
        [list addObject:resource.firstObject];
        [list addObject:resource.firstObject];
    }
    
    if (resource.count == 2) {
        [list addObject:resource.firstObject];
        [list addObject:resource.lastObject];
    }
    _modelObjects = list;
    return list;
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
    if (self.cycleParam.viewObjects.count == 0) {
        return;
    }
    self.currentIndex = 0;
    self.animateDuration = self.cycleParam.animateDuration;
    self.interval = self.cycleParam.interval;
    self.viewObjects = self.cycleParam.viewObjects;
    
    [self loopTimer];
}

- (void)pageAction {
    if (_curPage) {
        _curPage(_currentIndex, self.cycleParam.modelObjects[_currentIndex]);
    }
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
    
    [self pageAction];
    
    //移除所有的对象
    for (UIView *view in self.viewObjects) {
        [view removeFromSuperview];
    }
    
    //中间
    NSInteger index = _currentIndex;
    UIView *view = self.viewObjects[_currentIndex];
    view.userInteractionEnabled = true;
    view.tag = (kNHFCycleViewBaseTag + index);
    [self.view1 addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view1);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [view addGestureRecognizer:tap];
    
    //左边
    if (_currentIndex - 1 == -1) {
        index = (self.viewObjects.count - 1);
    } else {
        index = (_currentIndex - 1);
    }
    view = self.viewObjects[index];
    view.userInteractionEnabled = true;
    view.tag = (kNHFCycleViewBaseTag + index);
    [self.view0 addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view0);
    }];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [view addGestureRecognizer:tap];
    
    //右边
    if (_currentIndex + 1 == self.viewObjects.count) {
        index = 0;
    } else {
        index = (_currentIndex + 1);
    }
    view = self.viewObjects[index];
    view.userInteractionEnabled = true;
    view.tag = (kNHFCycleViewBaseTag + index);
    [self.view2 addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view2);
    }];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [view addGestureRecognizer:tap];
}

- (void)setInterval:(NSTimeInterval)interval {
    _interval = interval;
    if (self.timer != nil) {
        [self.timer invalidate];
    }
    
    [self startAutoScroll:interval];
}

- (void)tapGesture:(UITapGestureRecognizer *)tap {
    if (_tapIndex) {
        NSInteger item = tap.view.tag - kNHFCycleViewBaseTag;
        _tapIndex(item, self.cycleParam.modelObjects[item]);
    }
}

- (void)dealloc
{
    
}

@end

