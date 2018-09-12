//
//  ViewController.m
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2018/9/12.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "ViewController.h"
#import "NHFCustomWidgetsSetting.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(0, 0, 200.f, 200.f);
    button.center = self.view.center;
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"%s", __FUNCTION__);
    }];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
