//
//  JHUserInfoUpdate.h
//  JHHealthShop
//
//  Created by 牛宏飞 on 2018/9/27.
//  Copyright © 2018年 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
