//
//  NHFRadioButton.h
//  jinhe
//
//  Created by 今合网技术部 on 16/6/29.
//  Copyright © 2016年 rockontrol. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NHFRadioButtonTypeOnlyOneSelect,    //单选按钮
    NHFRadioButtonTypeMutableSelect     //多选按钮
} NHFRadioButtonType;

typedef void(^NHFRadioButtonAction)(NSInteger item);

@interface NHFRadioButton : UIView

{
    NHFRadioButtonType _nhfRadioButtonType;
    NSInteger _selectItem;
    CGFloat _everyLineBoth;
    CGFloat _bothSides;
    CGFloat _buttonWithRightViewBoth;
    NHFRadioButtonAction _nhfRadioButtonAction;
}

//一般不要动这里的东西
@property (nonatomic, retain) NSMutableArray *allButtons;
@property (nonatomic, retain) NSMutableArray *allLeftImageViews;
@property (nonatomic, retain) NSMutableArray *mutableSelectItems;
@property (nonatomic, assign) CGFloat leftImageSize;

//必须添加的内容
@property (nonatomic, strong) UIImage *selectIco;
@property (nonatomic, strong) UIImage *unSelectIcos;
@property (nonatomic, retain) NSMutableArray *rightViews;

- (instancetype)initWithFrame:(CGRect)frame
           NHFRadioButtonType:(NHFRadioButtonType)nhfRadioButtonType
                everyLineBoth:(CGFloat)everyLineBoth
                    bothSides:(CGFloat)bothSides
      buttonWithRightViewBoth:(CGFloat)buttonWithRightViewBoth
         NHFRadioButtonAction:(NHFRadioButtonAction)nhfRadioButtonAction;

/**
 *  加载新的数据
 */
- (void)reloadView;

/**
 *  更新数据
 */
- (void)updateView;

/**
 *  选择某个选项
 *
 *  @param item 
 */
- (void)setSelectItem:(NSInteger)item;

@end













