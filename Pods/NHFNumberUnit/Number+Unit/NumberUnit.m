//
//  Number+Unit.m
//  jinhe
//
//  Created by 今合网技术部 on 15/11/17.
//  Copyright © 2015年 rockontrol. All rights reserved.
//

#import "NumberUnit.h"

@implementation NumberUnit

+ (NSString *)formatFloat:(CGFloat)data {
    return [NumberUnit formatFloatByData:data afterPoint:2];
}

+ (NSString *)formatFloatThree:(CGFloat)data {
    return [NumberUnit formatFloatByData:data afterPoint:3];
}

+ (NSString *)formatFloatByData:(CGFloat)data afterPoint:(NSInteger)position {
    NSString *string = [[NumberUnit notRounding:data roundingMode:NSRoundPlain afterPoint:position] stringValue];
    NSArray *array = [string componentsSeparatedByString:@"."];
    if (array.count > 1) {
        NSString *lastString = array.lastObject;
        NSString *endString = [NumberUnit zeroStringByNumber:(position-lastString.length)];
        return [NSString stringWithFormat:@"%@%@", string, endString];
    } else {
        NSString *endString = [NumberUnit zeroStringByNumber:position];
        return [NSString stringWithFormat:@"%@.%@", string, endString];
    }
}

+ (NSDecimalNumber *)notRounding:(CGFloat)price
                    roundingMode:(NSRoundingMode)roundingMode
                      afterPoint:(NSInteger)position {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%lf", price]];
    NSDecimalNumber *resultRoundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return resultRoundedOunces;
}

+ (NSDecimalNumber *)addNSDecimalNumberByNumber:(NSDecimalNumber *)resourceDecimalNumber
                                           data:(CGFloat)price
                                   roundingMode:(NSRoundingMode)roundingMode
                                     afterPoint:(NSInteger)position {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%lf", price]];
    NSDecimalNumber *allResourceDecimalNumber = [resourceDecimalNumber decimalNumberByAdding:ouncesDecimal withBehavior:roundingBehavior];
    return allResourceDecimalNumber;
}

+ (NSString *)numberFormatterByString:(CGFloat )data
                           afterPoint:(NSInteger)position {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:[NSString stringWithFormat:@"#####0.%@;", [NumberUnit zeroStringByNumber:position]]];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:data]];
    return formattedNumberString;
}

+ (NSString *)zeroStringByNumber:(NSInteger)number {
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for (int i=0; i<number; i++) {
        [mutableString appendString:@"0"];
    }
    return mutableString;
}

@end










