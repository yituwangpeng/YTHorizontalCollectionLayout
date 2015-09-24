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

        UIPanGestureRecognizer *swipeGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        swipeGestureRecognizer.delegate = self;
//        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
//        [swipeGestureRecognizer requireGestureRecognizerToFail:]
        [self addGestureRecognizer:swipeGestureRecognizer];
    }
    return self;
}
- (void)handleSwipes:(UIPanGestureRecognizer *)recognizer
{
    CGRect originFrame = self.frame;
    
    CGPoint currentTouchPoint = [recognizer locationInView:self.contentView];
    CGFloat currentTouchPositionY = currentTouchPoint.y;
    
    CGPoint translationPoint = [recognizer translationInView:self.contentView];
     CGPoint velocity = [recognizer velocityInView:self.contentView];
    NSLog(@"111111111UIGestureRecognizerStateChanged  %@",NSStringFromCGPoint(translationPoint));
    NSLog(@"移动    %@",NSStringFromCGPoint(velocity));
    if ([recognizer isKindOfClass:[UIPanGestureRecognizer class]] && velocity.y > 0)
    {
        CGPoint location = [recognizer locationInView:self];
        
        if (recognizer.state == UIGestureRecognizerStateBegan) {
             self.initialTouchPositionY = currentTouchPositionY;
            
        }
        
        if (recognizer.state == UIGestureRecognizerStateChanged) {
            NSLog(@"UIGestureRecognizerStateChanged  %@",NSStringFromCGPoint(location));
            
            CGPoint translation = [recognizer translationInView:self.contentView];
            self.center = CGPointMake(recognizer.view.center.x + translation.x,
                                                 recognizer.view.center.y + translation.y);
            [recognizer setTranslation:CGPointZero inView:self.contentView];

            
        }
        
        if(recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
            
        }

    }
    

}
#pragma mark * UIPanGestureRecognizer delegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
        if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
            CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self];
            return fabs(translation.y) > fabs(translation.x);
        }

    return NO;
}

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
    
}
@end
