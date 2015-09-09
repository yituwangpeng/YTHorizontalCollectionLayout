//
//  PLDetailController.m
//  YTHorizontalCollectionLayout
//
//  Created by 王鹏 on 15/9/9.
//  Copyright (c) 2015年 王鹏. All rights reserved.
//

#import "PLDetailController.h"

@implementation PLDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(50, 50, 100, 100);
    backButton.backgroundColor = [UIColor greenColor];
    [backButton setTitle:@"BACK" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backParentVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - event response
- (void)backParentVC:(id)sender
{
    UIImageView *showView = (UIImageView *)[MAIN_WINDOW viewWithTag:ANIMATE_SHOW_VIEW_TAG];
    //移除展示动画的UIImageView
    [UIView animateWithDuration:ORIGIN_ANIMATION_TIME animations:^{
        
        showView.x = 0;
        
    } completion:^(BOOL finished) {
        if (finished){
            [self dismissViewControllerAnimated:NO completion:nil];
            [UIView animateWithDuration:FRAME_ANIMATION_TIME animations:^{
                showView.frame = _originRect;
            } completion:^(BOOL finished) {
                if (finished) {
                    [showView removeFromSuperview];
                    
                }
            }];
        }
    }];
}
@end
