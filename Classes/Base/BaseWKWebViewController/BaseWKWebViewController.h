//
//  BaseWKWebViewController.h
//  QFStudyWorkerTemplate
//
//  Created by 牛宏飞 on 2018/8/11.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

typedef void(^ScriptMessageBlock)(WKScriptMessage *message);

@interface BaseWKWebViewController : BaseViewController <WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

//URL地址
@property (nonatomic, copy) NSString *webUrlString;
//web
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, retain) NSMutableArray *scriptMessages;
//Js回调
@property (nonatomic, copy) ScriptMessageBlock scriptMessageBlock;
//加载进度颜色
@property (nonatomic, strong) UIColor *progressBGColor;
//加载进度是否隐藏
@property (nonatomic, assign) BOOL progressHid;

@end












