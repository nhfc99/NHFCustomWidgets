//
//  UILabel+unit.m
//  zjproject
//
//  Created by rockontrol on 15/4/4.
//  Copyright (c) 2015年 rockontrol. All rights reserved.
//

#import "UILabel+unit.h"

@implementation UILabel(unit)

+ (CGSize)labelConstrainedToSize:(NSString*)content font:(UIFont*)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];//必须是这组值,这个frame是初设的
    [label setNumberOfLines:0];  //必须是这组值
    CGSize contentSize;
    if([[[UIDevice currentDevice]  systemVersion] floatValue]<= 7.0)
    {
        [label setNumberOfLines:0];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        CGSize size = CGSizeMake(320,2000);
        CGSize labelsize = [content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        label.frame = CGRectMake(0.0, 0.0, labelsize.width, labelsize.height );
        contentSize = [content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    else
    {
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        CGSize size = CGSizeMake(320,2000);
        NSDictionary * attributes = @{NSFontAttributeName : font,
                                      NSParagraphStyleAttributeName : paragraphStyle};
        contentSize = [content boundingRectWithSize:size
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                           attributes:attributes
                                              context:nil].size;
    }
    return contentSize;
}

+ (CGSize)labelConstrainedHeightByWidth:(CGFloat)width content:(NSString*)content font:(UIFont*)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];//必须是这组值,这个frame是初设的
    [label setNumberOfLines:0];  //必须是这组值
    CGSize contentSize;
    if([[[UIDevice currentDevice]  systemVersion] floatValue]<= 7.0)
    {
        [label setNumberOfLines:0];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        CGSize size = CGSizeMake(width,2000);
        CGSize labelsize = [content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        label.frame = CGRectMake(0.0, 0.0, labelsize.width, labelsize.height );
        contentSize = [content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    else
    {
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        CGSize size = CGSizeMake(width,2000);
        NSDictionary * attributes = @{NSFontAttributeName : font,
                                      NSParagraphStyleAttributeName : paragraphStyle};
        contentSize = [content boundingRectWithSize:size
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                         attributes:attributes
                                            context:nil].size;
        paragraphStyle = nil;
        attributes = nil;
    }
    return contentSize;
}

@end

















