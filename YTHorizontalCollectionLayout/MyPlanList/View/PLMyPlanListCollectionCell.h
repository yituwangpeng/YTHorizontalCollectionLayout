//
//  PLMyPlanListCollectionCell.h
//  PlanHelper
//
//  Created by 王鹏 on 15/7/29.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLCollectionViewCell.h"

typedef void (^PLMyPlanListCollectionCellShareBlock)(NSIndexPath *aIndexPath);
typedef void (^PLMyPlanListCollectionCellDeleteBlock)(NSIndexPath *aIndexPath);
@interface PLMyPlanListCollectionCell : PLCollectionViewCell
@property (nonatomic, copy) PLMyPlanListCollectionCellShareBlock sharePlanBlock;
@property (nonatomic, copy) PLMyPlanListCollectionCellDeleteBlock deletePlanBlock;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIImageView *imageView;

@end
