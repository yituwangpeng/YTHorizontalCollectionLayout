//
//  PLCollectionView.m
//  PlanHelper
//
//  Created by 王鹏 on 15/5/22.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLCollectionView.h"

@implementation PLCollectionView
- (id)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame collectionViewScrollDirection:(PLCollectionViewScrollDirection)scrollDirection
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    if(scrollDirection == PLScrollDirectionVertical){
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }else{
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
