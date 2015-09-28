//
//  PLCollectionViewCell.m
//  PlanHelper
//
//  Created by 王鹏 on 15/5/22.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLCollectionViewCell.h"
#import "MyPlanListLayoutParam.h"

#define CELL_ANIATION_DURATION 0.2f
#define CELL_PAN_LIMIT_VELOCITY (-1000) //-1000可以自己决定，值越小，表明滑动的越快
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

        UIPanGestureRecognizer *swipeGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        swipeGestureRecognizer.delegate = self;
        [self addGestureRecognizer:swipeGestureRecognizer];
        
        self.initialTouchPositionY = self.frame.origin.y;
    }
    return self;
}
#pragma mark - event response
- (void)handleSwipes:(UIPanGestureRecognizer *)recognizer
{
    
    CGPoint velocity = [recognizer velocityInView:self.contentView];
    if ([recognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        
        if (recognizer.state == UIGestureRecognizerStateBegan) {
            
        }
        
        if (recognizer.state == UIGestureRecognizerStateChanged) {
            CGPoint translation = [recognizer translationInView:self.contentView];
            self.centerY  = recognizer.view.center.y + translation.y;
            [recognizer setTranslation:CGPointZero inView:self.contentView];
            self.convertWindowY = [self.superview convertRect:self.frame toView:MAIN_WINDOW].origin.y;
        }
        
        if(recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
            //根据拖动速率和拖动结束后卡片的位置判断是否移除cell
            if(velocity.y < CELL_PAN_LIMIT_VELOCITY){
                [UIView animateWithDuration:CELL_ANIATION_DURATION animations:^{
                    self.centerY  = -self.height;
                } completion:^(BOOL finished) {
                    if (_panCellToDeleteBlock) {
                        _panCellToDeleteBlock(_cellIndexPath);
                    }
                }];
                
            }else{
                if (self.convertWindowY < -self.height/2) {
                    [UIView animateWithDuration:CELL_ANIATION_DURATION animations:^{
                        self.centerY  = -self.height;
                    } completion:^(BOOL finished) {
                        if (_panCellToDeleteBlock) {
                            _panCellToDeleteBlock(_cellIndexPath);
                        }
                    }];
                    
                }else{
                    [UIView animateWithDuration:CELL_ANIATION_DURATION animations:^{
                        self.centerY  = _initialTouchPositionY + self.height/2;
                    } completion:^(BOOL finished) {
                        
                    }];
                    
                }
                
            }
        }
        
    }
}
#pragma mark - UIPanGestureRecognizer delegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self];
        return fabs(translation.y) > fabs(translation.x);
    }
    
    return NO;
}
#pragma mark - superclass methods subclass overwrite
- (void)configDataWithModel:(id)model
{
    //subclass overwrite
}
/**
 *  根据Model，计算高度
 *
 *  @param model model
 *
 *  @return 高度
 */
+ (CGFloat)cellHeightWithData:(id)model
{
    return 44;
}

/**
 *  重新设置cell UI 状态
 */
- (void)reset
{
     self.centerY  = _initialTouchPositionY + self.height/2;
}
@end
