//
//  PLCollectionView.h
//  PlanHelper
//
//  Created by 王鹏 on 15/5/22.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    PLScrollDirectionVertical = 0,
    PLScrollDirectionHorizontal = 1
}PLCollectionViewScrollDirection;

@interface PLCollectionView : UICollectionView
/**
 *  自定义初始化方法
 *
 *  @param frame           frame
 *  @param scrollDirection 滑动方向
 *
 *  @return self
 */
- (id)initWithFrame:(CGRect)frame collectionViewScrollDirection:(PLCollectionViewScrollDirection)scrollDirection;
@end
