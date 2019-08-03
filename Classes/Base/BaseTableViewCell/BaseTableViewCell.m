//
//  BaseTableViewCell.m
//  jinhe
//
//  Created by 今合网技术部 on 16/8/25.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
                initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    NSLog(@"释放cell视图：%@\n\n\n\n", NSStringFromClass([self class]));
}

@end
