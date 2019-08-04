//
//  JHImageTextTalbleViewCellTableViewCell.h
//  Vehicle
//
//  Created by 牛宏飞 on 2019/6/21.
//  Copyright © 2019 网络科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHImageTextTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *indexImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeight;

@end

NS_ASSUME_NONNULL_END
