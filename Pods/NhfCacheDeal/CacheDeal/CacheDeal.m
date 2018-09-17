//
//  CacheDeal.m
//  rockqywx
//
//  Created by rockontrol on 14-6-16.
//  Copyright (c) 2014年 rockontrol. All rights reserved.
//

#import "CacheDeal.h"

@implementation CacheDeal

static CacheDeal* cachedeal = nil;

+(instancetype)getInstancetype
{
    if (!cachedeal) cachedeal = [[self allocWithZone:NULL] init];
    return cachedeal;
}

-(id)init
{
    self = [super init];
    
    if(self)
    {
        ud = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

-(BOOL)isRegisterKey:(NSString*)key
{
    NSString* save = [ud objectForKey:key];
    if(save == nil)
    {
        return false;
    }
    else if([save intValue] == 0)
    {
        return false;
    }
    else
    {
        return true;
    }
}

-(void)saveStringValue:(NSString *)stringdata key:(NSString *)key
{
    if ([self getObject:key] != nil) {
        [self removeDataKey:key];
    }
    [ud setObject:stringdata forKey:key];
    [ud synchronize];
}

-(void)saveObject:(id)object key:(NSString *)key
{
    if (object == nil || key == nil) {
        return;
    }
    if ([self getObject:key] != nil) {
        [self removeDataKey:key];
    }
    [ud setObject:object forKey:key];
    [ud synchronize];
}

-(id)getStringKey:(NSString *)key
{
    return [ud objectForKey:key];
}

-(id)getObject:(NSString *)key
{
    return [ud objectForKey:key];
}

-(void)removeDataKey:(NSString *)key
{
    [ud removeObjectForKey:key];
}

+ (NSArray *)getArrayByCacheKey:(NSString *)cacheKey
                             sp:(NSString *)sp {
    if (cacheKey == nil || sp == nil) {
        return nil;
    }
    NSString *string = [[CacheDeal getInstancetype] getObject:cacheKey];
    NSMutableArray *array = [NSMutableArray new];
    if (string != nil) {
        array = [[NSMutableArray alloc] initWithArray:[string componentsSeparatedByString:sp]];
    }
    return array;
}

+ (void)saveArrayByCacheKey:(NSString *)cacheKey
                    objects:(NSArray *)objects
                         sp:(NSString *)sp {
    if (cacheKey == nil || sp == nil) {
        return;
    }
    [[CacheDeal getInstancetype] saveObject:[objects componentsJoinedByString:sp] key:cacheKey];
}

@end














