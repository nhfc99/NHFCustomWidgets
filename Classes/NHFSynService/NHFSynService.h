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

@class NHFSynService;

//缓存操作对象
@interface NHFSynServiceCache : NSObject

+ (instancetype)getInstancetype;

//添加指定的对象
- (void)addObject:(NHFSynService *)object keyString:(NSString *)keyString;

//移除指定的键名
- (void)removeKeyString:(NSString *)keyString;

//获取对象
- (NHFSynService *)objectForKeyString:(NSString *)keyString;

@end

//存储操作数据对象
@interface NHFWeakServiceObject : NSObject

@property (nonatomic, weak) id weakObject;
@property (nonatomic, copy) NSString *selString;

@end

@interface NHFSynService : NSObject

/**
 添加对象和方法

 @param object 不可为空
 @param aSelesctor  不可为空
 */
- (void)addObject:(id)object aSelector:(SEL)aSelesctor;


/**
 删除

 @param object 不可为空
 @param aSelector 可以为空
 */
- (void)removeObject:(id)object aSelector:(SEL)aSelector;


/**
 执行更新操作
 */
- (void)updateObject;


/**
 执行更新操作 - 指定的方法

 @param selString 不可以为空
 */
- (void)updateObjectBySel:(NSString *)selString;


/**
 保存该对象

 @param key --
 */
- (void)saveServiceKey:(NSString *)key;


/**
 获取指定对象

 @param key --
 @return --
 */
+ (NHFSynService *)serviceKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
