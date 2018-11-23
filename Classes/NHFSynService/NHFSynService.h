//
//  JHUserInfoUpdate.h
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/27.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

/***********
 **说明：NHFSynService为核心，用于实现分发操作机制，如果要实现分发机制需要自己在外层进行编写一个单例，如果实现多对一的功能可以直接使用该类，对外出口全部是NHFSynService
 **
 **
 */

NS_ASSUME_NONNULL_BEGIN

//存储操作数据对象
@interface NHFWeakServiceObject : NSObject

@property (nonatomic, weak) id weakObject;
@property (nonatomic, copy) NSString *selString;

@end

@interface NHFSynService : NSObject

+ (instancetype)getInstancetype;

/**
 添加

 @param object --
 @param aSelector --
 @param type --
 */
- (void)addObject:(id)object
        aSelector:(SEL)aSelector
             type:(NSString *)type;

/**
 更新

 @param type --
 */
- (void)updateObject:(NSString *)type;

/**
 更新

 @param type --
 @param selString --
 */
- (void)updateObject:(NSString *)type
           selString:(NSString *)selString;

@end

NS_ASSUME_NONNULL_END
