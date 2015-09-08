//
//  PLCollectionViewCell.m
//  PlanHelper
//
//  Created by 王鹏 on 15/5/22.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLCollectionViewCell.h"
#import "MyPlanListLayoutParam.h"

@implementation PLCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.exclusiveTouch = YES;
        
        self.backgroundColor = [UIColor clearColor];
        
        _highlightBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _highlightBackgroundView.backgroundColor = RGBA(0, 0, 0, 10);
        _highlightBackgroundView.alpha = 0;
        [self.contentView addSubview:_highlightBackgroundView];
        
        //背景
        _contentBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _contentBackgroundView.backgroundColor = [UIColor clearColor];
        _contentBackgroundView.layer.borderWidth = 0.5;
        _contentBackgroundView.layer.borderColor = [[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor];
        _contentBackgroundView.exclusiveTouch = YES;
        [self.contentView addSubview:_contentBackgroundView];

    }
    return self;
}

- (void)configDataWithModel:(id)model
{
    //subclass overwrite
}

@end
