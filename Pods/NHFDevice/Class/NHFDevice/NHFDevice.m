//
//  NHFDevice.m
//  NHFDevice
//
//  Created by 牛宏飞 on 2018/8/11.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import "NHFDevice.h"

#define  NH_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define  NH_ScreenHeight [UIScreen mainScreen].bounds.size.height
#define  NH_StatusBarHeight (NH_iPhoneX ? 44.f : 20.f)
#define  NH_NavigationBarHeight 44.f
#define  NH_TabbarHeight (NH_iPhoneX ? (49.f+34.f) : 49.f)
#define  NH_TabbarSafeBottomMargin (NH_iPhoneX ? 34.f : 0.f)
#define  NH_StatusBarAndNavigationBarHeight (NH_StatusBarHeight+NH_NavigationBarHeight)

#define NH_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

@implementation NHFDevice

+ (CGFloat)ScrollViewInsets {
    if (NH_iPhoneX) {
        return [NHFDevice StatusBarHeight];
    } else {
        return 0.f;
    }
}

+ (CGSize)ScreenSize {
    CGSize size_screen = [[UIScreen mainScreen] bounds].size;
    return size_screen;
}

+ (CGFloat)StatusBarHeight {
    return NH_StatusBarHeight;
}

+ (CGFloat)ScreenNavgationBarHeight {
    return NH_NavigationBarHeight;
}

+ (CGFloat)ScreenTTop {
    return NH_StatusBarAndNavigationBarHeight;
}

+ (CGFloat)ScreenTabbarHeight {
    return NH_TabbarHeight;
}

+ (CGFloat)BottomOffset {
    return NH_TabbarSafeBottomMargin;
}

+ (NSString*)AppBasePath:(NSString*)pathtype {
    if([pathtype isEqualToString:@"resource"])
    {
        NSString *resPath = [[NSBundle mainBundle] resourcePath];
        return resPath;
    }
    else if ([pathtype isEqualToString:@"document"])
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *docDir = [paths objectAtIndex:0];
        return docDir;
    }
    else
    {
        return nil;
    }
}

+ (NSString*)AppBaseResourcePath:(NSString*)filename {
    return [NSString stringWithFormat:@"%@/%@", [NHFDevice AppBasePath:@"resource"], filename];
}

+ (NSString*)AppBaseDocumentPath:(NSString*)filename {
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return [NSString stringWithFormat:@"%@/%@", DocumentsPath, filename];
}

+ (NSString*)AppBaseCachePath:(NSString*)filename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    return [NSString stringWithFormat:@"%@/%@", path, filename];
}

+ (CGFloat)scalHeightByWidth:(CGFloat)width
                      BySize:(CGSize)size {
    return size.height*width/size.width;
}

+ (CGFloat)scalWidthByHeight:(CGFloat)height
                      BySize:(CGSize)size {
    return height*size.width/size.height;
}

@end
