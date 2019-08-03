//
//  NHFNavigationControllerViewController.m
//  ProjectTemp
//
//  Created by 牛宏飞 on 2018/8/20.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#define  NHFCoverAlpha 0.8
#define  NHFNaDuration 0.2f

#import "NHFNavigationController.h"
#import "UINavigationBar+NHF.h"
#import "UIViewController+NHF.h"

@interface NHFNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) NSMutableArray *lastVCScreenShootArray;
@property (nonatomic, strong) UIView *lastVCScreenCoverView;

//@property (strong, nonatomic) UIImageView *backImageView;
@property (strong, nonatomic) UIView *backView;
@property (assign) CGPoint panBeginPoint;
@property (assign) CGPoint panEndPoint;

@end

@implementation NHFNavigationController

//截频资源
- (NSMutableArray *)lastVCScreenShootArray {
    if (!_lastVCScreenShootArray) {
        _lastVCScreenShootArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _lastVCScreenShootArray;
}

//进行截屏
- (void)takeScreenShoot {
    if ([self shootItem] != NSNotFound) {
        return;
    }
    UIView *view = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    [self.lastVCScreenShootArray addObject:@{[NSString stringWithFormat:@"%p", self.topViewController]:view}];
}

- (void)removeScreenShoot {
    NSInteger item = [self shootItem];
    if (item == NSNotFound) {
        return;
    }
    [self.lastVCScreenShootArray removeObjectAtIndex:item];
}

- (NSInteger)shootItem {
    NSString *memAddress = [NSString stringWithFormat:@"%p", self.topViewController];
    for (int i=0; i<self.lastVCScreenShootArray.count; i++) {
        NSDictionary *dic = self.lastVCScreenShootArray[i];
        if ([dic.allKeys[0] isEqualToString:memAddress]) {
            return i;
        }
    }
    return NSNotFound;
}

//图片上边的一个视图
- (UIView *)lastVCScreenCoverView {
    if (!_lastVCScreenCoverView) {
        UIView *converView = [[UIView alloc] init];
        converView.backgroundColor = [UIColor grayColor];
        converView.frame = self.view.bounds;
        converView.alpha = NHFCoverAlpha;
        [self.view.superview addSubview:converView];
        _lastVCScreenCoverView = converView;
    }
    
    return _lastVCScreenCoverView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
    [self addPanGestureRecognizer];
    
    [self.navigationBar addObserver:self forKeyPath:@"alpha" options:NSKeyValueObservingOptionNew context:@"BaseViewController"];
}

//添加手势
- (void)addPanGestureRecognizer {
    _panGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(popViewController:)];
    _panGestureRecognizer.edges = UIRectEdgeLeft;
    _panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:_panGestureRecognizer];
}

//滑动返回操作
- (void)popViewController:(UIPanGestureRecognizer *)recognizer {
    if ([self.viewControllers count] == 1) {
        return ;
    }
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        //存放滑动开始的位置
        self.panBeginPoint = [recognizer locationInView:[UIApplication sharedApplication].keyWindow];
        //插入图片
        [self insertLastViewFromSuperView:self.view.superview];
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
        //存放数据
        self.panEndPoint = [recognizer locationInView:[UIApplication sharedApplication].keyWindow];
        if ((_panEndPoint.x - _panBeginPoint.x) > CGRectGetWidth(self.view.frame) / 3) {
            [UIView animateWithDuration:NHFNaDuration animations:^{
                [self moveNavigationViewWithLenght:CGRectGetWidth([UIScreen mainScreen].bounds)];
            } completion:^(BOOL finished) {
                [self removeLastViewFromSuperView];
                [self moveNavigationViewWithLenght:0];
                [self popViewControllerAnimated:NO];
            }];
        }else{
            [UIView animateWithDuration:NHFNaDuration animations:^{
                [self moveNavigationViewWithLenght:0];
            } completion:^(BOOL finished) {
                [self removeLastViewFromSuperView];
            }];
        }
    }else{
        //添加移动效果
        CGFloat panLength = ([recognizer locationInView:[UIApplication sharedApplication].keyWindow].x - _panBeginPoint.x);
        if (panLength > 0) {
            [self moveNavigationViewWithLenght:panLength];
        }
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.popGestureRecognizerEnabled) {
        return NO;
    }
    if (self.childViewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

- (void)requireGestureRecognizerToFailByScrollView:(UIScrollView *)scrollView {
    [scrollView.panGestureRecognizer requireGestureRecognizerToFail:_panGestureRecognizer];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //截频
    [self takeScreenShoot];
    //跳转
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    NSInteger item = NSNotFound;
    if (self.viewControllers.count > (self.viewControllers.count - 2)) {
        NSString *keyString = [NSString stringWithFormat:@"%p", self.viewControllers[self.viewControllers.count - 2]];
        for (int i=0; i<_lastVCScreenShootArray.count; i++) {
            NSDictionary *dic = _lastVCScreenShootArray[i];
            if ([dic.allKeys.firstObject isEqualToString:keyString]) {
                item = i;
            }
        }
    }
    if (item != NSNotFound) {
        NSInteger number = (_lastVCScreenShootArray.count-item);
        number = number<0?0:number;
        [_lastVCScreenShootArray removeObjectsInRange:NSMakeRange(item, number)];
    }
    return [super popViewControllerAnimated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"alpha"]) {
        CGFloat alpha = [change[@"new"] floatValue];
        alpha = round(alpha * 100) / 100;
        if (_nhfDelegate) {
            [_nhfDelegate setNHFNavigationBarAlpha:alpha];
        }
    }
}

/**
 *  移动视图界面
 *
 *  @param lenght 移动的长度
 */
- (void)moveNavigationViewWithLenght:(CGFloat)lenght {
    //图片位置设置
    self.view.frame = CGRectMake(lenght, CGRectGetMinY(self.view.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    //图片动态阴影
    _backView.alpha = (lenght/CGRectGetWidth([UIScreen mainScreen].bounds))*2/3 + 0.33;
}

/**
 *  插图上一级图片
 *
 *  @param superView 图片的superView
 */
- (void)insertLastViewFromSuperView:(UIView *)superView{
    //插入上一级视图背景
    if (_backView == nil) {
        if (self.viewControllers.count > (self.viewControllers.count - 2)) {
            NSString *keyString = [NSString stringWithFormat:@"%p", self.viewControllers[self.viewControllers.count - 2]];
            for (NSDictionary *dic in _lastVCScreenShootArray) {
                if ([dic.allKeys.firstObject isEqualToString:keyString]) {
                    _backView = dic.allValues.firstObject;
                }
            }
        }
        if (_backView == nil) {
            _backView = ((NSDictionary *)_lastVCScreenShootArray.lastObject).allValues.firstObject;
        }
        
        _backView.frame = [UIScreen mainScreen].bounds;
        [self.view.superview insertSubview:_backView belowSubview:self.view];
    }
}

/**
 *  移除上一级图片
 */
- (void)removeLastViewFromSuperView {
    [_backView removeFromSuperview];
    _backView = nil;
}

- (void)dealloc
{
    [self.navigationController.navigationBar removeObserver:self forKeyPath:@"alpha" context:@"BaseViewController"];
}

@end
