//
//  NHFMacroDefinition.h
//  jinhe
//
//  Created by niuhongfei on 2018/5/25.
//  Copyright © 2018年 rockontrol. All rights reserved.
//

#ifndef NHFMacroDefinition_h
#define NHFMacroDefinition_h

//获取AppDelegate
#define GetAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define GetCurrentVC [GetAppDelegate getCurrentVC]

//打印日志
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define NSLog(...)
#endif

//指定长度和速度来获取时间
#define OPTIONTIMEBYLENGTHANDSPEED(length, speed) ((length+[DeviceInfo ScreenSize].width)/speed)

//TableView适配
#define adjustsScrollViewInsets_NO(scrollView,vc)\
if (@available(iOS 11.0, *)) {\
scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}

//默认UITableViewCell
#define UITableViewCellNone [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""]

//控制器基本跳转
#define JUMPViewController(navigationController, controller) \
UIViewController *viewController = [NSClassFromString(controller) new];\
[viewController setHidesBottomBarWhenPushed:true];\
[navigationController pushViewController:viewController animated:true];

//获取系统对象
#define kApplication [UIApplication sharedApplication]
#define kAppWindow [UIApplication sharedApplication].delegate.window
#define kAppDelegate [AppDelegate shareAppDelegate].delegate
#define kCurrentVC [GetAppDelegate getCurrentVC]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//获取屏幕宽高
#define KScreenWidth ([[UIScreen mainScreen]bounds].size.width)
#define KScreenHeight ([[UIScreen mainScreen]bounds].size.height)
#define kScreen_Bounds ([UIScreen mainScreen].bounds)

//强弱引用
#define kWeakSelf(type) __weak typeof(type) weak##type = type
#define kStrongSelf(type) __strong typeof(type) strong##type = type
#define kBlock(type) __block typeof(type) block##type = type

//View圆角和加边框
#define kViewBorderRadius(View,Radius,Width,Color) \
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View圆角
#define kViewRadius(View,Radius) \
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//property属性快速声明
#define kPropertyStrong @property(nonatomic, strong)
#define kPropertyCopy   @property(nonatomic, copy)
#define kPropertyRetain @property(nonatomic, retain)
#define kPropertyAssign @property(nonatomic, assign)
#define kPropertyWeak @property(nonatomic, weak)

#define kPropertyString(s) @property(nonatomic, copy) NSString *s
#define kPropertyNSInteger(s) @property(nonatomic, assign) NSInteger s
#define kPropertyBOOL(s) @property(nonatomic, assign) BOOL s
#define kPropertyNSEnum(enum, s) @property(nonatomic, assign) enum s
#define kPropertyFloat(s) @property(nonatomic, assign) float s
#define kPropertyLongLong(s) @property(nonatomic, assign) long long s
#define kPropertyNSDictionary(s) @property(nonatomic, strong) NSDictionary *s
#define kPropertyNSMutableDictionary(s) @property(nonatomic, strong) NSMutableDictionary *s
#define kPropertyNSArray(s) @property(nonatomic, strong) NSArray *s
#define kPropertyNSMutableArray(s) @property(nonatomic, strong) NSMutableArray *s
#define kPropertyBlock(block, s) @property(nonatomic, copy) block s

///IOS版本判断
#define IOSAVAILABLEVERSION(version) ([[UIDevice currentDevice]availableVersion:version] < 0)

//当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]

//当前语言
#define CurrentLanguage ([NSLocale preferredLanguages]objectAtIndex:0])

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//颜色
#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]
#define kRGBA(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define kColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//定义UIImage对象
#define IMAGE_NAMED(name)[UIImage imageNamed:name]

//数据验证
#define StrValid(f)(f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f)(StrValid(f)?f:@"")
#define ValidStr(f)StrValid(f)
#define ValidDict(f)(f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f)(f!=nil && [f isKindOfClass:[NSArray class]]&&[f count]>0)
#define ValidNum(f)(f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls)(f!=nil &&[f isKindOfClass:[cls class]])
#define ValidData(f)(f!=nil && [f isKindOfClass:[NSData class]])

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTimeNSLog (@"Time: %f",CFAbsoluteTimeGetCurrent()- start)

//单例化一个类
#define SINGLETON_FOR_HEADER(className)\
+(className *)shared##className;

#define SINGLETON_FOR_CLASS(className)\
+(className *)shared##className { \
static className *shared##className = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{ \
shared##className = [[self alloc]init];\
});\
return shared##className;\
}

//等比例获取宽度
#define kUIBaseWidth 375
#define kScaleWidth(width) ((KScreenWidth)/(kUIBaseWidth)*(width))

//底部适配
#define kDeviceBottom(offset) ([NHFDevice BottomOffset]+kScaleWidth(offset))

//字号大小
#define kBaseFontSize 14
#define kFontSize(extendNumber) (kBaseFontSize + extendNumber)

//判断对象
#define kCheckRObject(object) (self.object != nil && object == self.object)

//装换数据为字符串
#define ToStringBy(headString, data) ([NSString stringWithFormat:headString, data])

/*=================我是分割线，上边是系统配置，下边是自定义配置================*/

//App主调色
#define MainAppColor kRGBA(16.f, 142.f, 233.f, 1)
//常用色值
#define kGray1 kRGBA(217.f, 217.f, 217.f, 1)


#endif /* NHFMacroDefinition_h */
