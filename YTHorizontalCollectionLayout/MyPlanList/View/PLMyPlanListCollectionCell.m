//
//  PLMyPlanListCollectionCell.m
//  PlanHelper
//
//  Created by 王鹏 on 15/7/29.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLMyPlanListCollectionCell.h"
#import "MyPlanListLayoutParam.h"
#define SHARED_MEMBER_ICON_TAG 100
@interface PLMyPlanListCollectionCell ()

@end

@implementation PLMyPlanListCollectionCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubviews];
    }
    return self;
}

- (void)configSubviews
{
    self.contentBackgroundView.clipsToBounds = YES;
    self.contentBackgroundView.layer.cornerRadius = 4.0f;
    self.highlightBackgroundView.clipsToBounds = YES;
    self.highlightBackgroundView.layer.cornerRadius = 4.0f;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = MyPlanListCellWidth;
    CGFloat imageHeight = MyPlanListCellImageHeight;
    CGFloat height = self.frame.size.height;
    
    x = MyPlanListImageLeft;
    y = MyPlanListImageTop;
    width -= 2*MyPlanListImageLeft;
    height = imageHeight;
    //图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"create_bg_6p"];
    [self.contentBackgroundView addSubview:imageView];
    _imageView = imageView;

}
- (void)configDataWithModel:(id)model
{
    UIImage *image = (UIImage *)model;
    [_imageView setImage:image];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
