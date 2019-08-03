//
//  JsonDeal.m
//  jinhe
//
//  Created by rockontrol on 15/6/26.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import "JsonDeal.h"

@implementation JsonDeal

+ (id)dealJson:(NSString*)resultString{
    if (resultString == nil) {
        return nil;
    }
    if ([resultString isKindOfClass:[NSNull class]]) {
        return nil;
    }
    NSData *da= [resultString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:da options:NSJSONReadingAllowFragments error:&error];
    da = nil;
    return object;
}

@end











