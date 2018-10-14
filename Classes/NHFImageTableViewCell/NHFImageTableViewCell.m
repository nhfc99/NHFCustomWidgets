//
//  HZDongJiaZXImageViewTableViewCell.m
//  Hzhl
//
//  Created by 牛宏飞 on 2018/10/13.
//  Copyright © 2018年 chengfeng. All rights reserved.
//

#import "NHFImageTableViewCell.h"

@implementation NHFImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    CGFloat width = CGRectGetWidth(self.goodImageView.frame);
    CGFloat height = width * self.scalsize.height/self.scalsize.width;
    self.goodImageView.frame = CGRectMake(0, 0, width, height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
