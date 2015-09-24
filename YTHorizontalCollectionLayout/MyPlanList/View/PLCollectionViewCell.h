//
//  PLCollectionViewCell.h
//  PlanHelper
//
//  Created by 王鹏 on 15/5/22.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLCollectionViewCell : UICollectionViewCell<UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGFloat initialTouchPositionY;

/**
 *  点击高亮效果的视图
 */
@property (nonatomic, strong) UIView *highlightBackgroundView;
@property (nonatomic, strong) UIView *contentBackgroundView;

/**
 *  根据Model，配置显示数据
 *
 *  @param model
 */
- (void)configDataWithModel:(id)model;
/**
 *  根据Model，计算高度
 *
 *  @param model model
 *
 *  @return 高度
 */
+ (CGFloat)cellHeightWithData:(id)model;

/**
 *  重新设置cell UI 状态
 */
- (void)reset;
@end
