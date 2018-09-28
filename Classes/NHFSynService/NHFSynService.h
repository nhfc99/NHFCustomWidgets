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

@end

@interface NHFSynService : NSObject

- (void)addObject:(id)object;

- (void)updateObject;

@end

NS_ASSUME_NONNULL_END
