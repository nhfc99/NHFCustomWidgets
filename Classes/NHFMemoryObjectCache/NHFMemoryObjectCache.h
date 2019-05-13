//
//  NHFMemoryObjectCache.h
//  NHFCustomWidgets
//
//  Created by 牛宏飞 on 2019/5/11.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import <Foundation/Foundation.h>

//弱引用保存
#define nfMOWeakSave(object, name) ([[NHFMemoryObjectCache getInstancetype] save:object objectName:name type:NHFReferenceTypeWeak]);
//强引用保存
#define nfMOStrongSave(object, name) ([[NHFMemoryObjectCache getInstancetype] save:object objectName:name type:NHFReferenceTypeStrong]);
//获取对象
#define nfMOGet(name) ([[NHFMemoryObjectCache getInstancetype] get:name])
//删除对象
#define nfMODelete(name) ([[NHFMemoryObjectCache getInstancetype] delete:name])
//是否存在某个对象
#define nfMOIsHave(name) ([[NHFMemoryObjectCache getInstancetype] isHave:name])

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    NHFReferenceTypeWeak,
    NHFReferenceTypeStrong
} NHFReferenceType;

//存储操作数据对象
@interface NHFMemoryObjectCacheObject : NSObject

@property (nonatomic, weak) id _Nullable weakObject;
@property (nonatomic, retain) id _Nullable strongObject;
@property (nonatomic, copy) NSString *objectName;

@end

@interface NHFMemoryObjectCache : NSObject

+ (instancetype)getInstancetype;


/**
 保存数据

 @param object 存储对象
 @param objectName 对象名称
 @param nhfReferenceType 存储类型
 */
- (void)save:(id)object
  objectName:(NSString *)objectName
        type:(NHFReferenceType)nhfReferenceType;


/**
 获取对象

 @param objectName --
 @return --
 */
- (id)get:(NSString *)objectName;


/**
 删除对象

 @param objectName --
 */
- (void)delete:(NSString *)objectName;


/**
 测试对象

 @param objectName --
 @return --
 */
- (BOOL)isHave:(NSString *)objectName;

@end

NS_ASSUME_NONNULL_END
