
//
//  PLMyPlanListVC.m
//  PlanHelper
//
//  Created by 王鹏 on 15/7/29.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLMyPlanListVC.h"
#import "PLCollectionView.h"
#import "MyPlanListLayoutParam.h"
#import "PLMyPlanListCollectionCell.h"
#import "PLMyPlanListLineLayout.h"
#import "AppDelegate.h"


#define kDeletePlanAlertTag 100
#define ANONYMOUS_PLAN_ALERT_TAG 29
#define TEACH_VIEW_TAG 101

static NSString *const kMyPlanListCollectionCell = @"myPlanListCollectionCell";

@interface PLMyPlanListVC ()<UICollectionViewDelegate,
UICollectionViewDataSource>
@property (nonatomic, strong) PLCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation PLMyPlanListVC
#pragma mark - life cycle
- (void)dealloc{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"PLMyPlanListVC viewWillAppear");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, UIWidth, UIHeight);
    [self configCollectionView];
    
    for (int i = 1; i < 9; i ++) {
        [self.dataArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpeg",i]]];
    }
}


- (void)configCollectionView
{
    PLMyPlanListLineLayout *lineLayout = [[PLMyPlanListLineLayout alloc] init];
    
    self.collectionView = [[PLCollectionView alloc] initWithFrame:CGRectMake(0, 0, UIWidth, UIHeight) collectionViewLayout:lineLayout];
    _collectionView.backgroundColor = RGB(250, 250, 250);
    _collectionView.alwaysBounceHorizontal = YES;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerClass:[PLMyPlanListCollectionCell class] forCellWithReuseIdentifier:kMyPlanListCollectionCell];

}
#pragma mark - UICollectionViewDataSource

/**
 *  每个CollectionView有多少个Section
 *
 *  @param collectionView
 *
 *  @return
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    [collectionView.collectionViewLayout invalidateLayout];
    return 1;
}

/**
 *  每个Section里面有多少个Cell
 *
 *  @param collectionView
 *  @param section
 *
 *  @return
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

/**
 *  每个Cell具体显示的内容
 *
 *  @param collectionView
 *  @param indexPath
 *
 *  @return
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PLCollectionViewCell *cell = nil;
    UIImage *image = nil;
    image = self.dataArray[indexPath.row];
    NSLog(@"indexPath ======== %ld",indexPath.row);
    cell = (PLMyPlanListCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kMyPlanListCollectionCell forIndexPath:indexPath];
    [cell configDataWithModel:image];
    
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
    float pageWidth = MyPlanListCellWidth + MyPlanListCellSpace; // width + space
    
    float currentOffset = scrollView.contentOffset.x;
    float targetOffset = targetContentOffset->x;
    float newTargetOffset = 0;
    
    if (targetOffset > currentOffset){
       newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth;
    }else{
        newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth;
    }
    if (newTargetOffset < 0){
        newTargetOffset = 0;
    }
    else if (newTargetOffset > scrollView.contentSize.width)
    {
        newTargetOffset = scrollView.contentSize.width;
    }
    
    targetContentOffset->x = currentOffset;
    [scrollView setContentOffset:CGPointMake(newTargetOffset, 0) animated:YES];
}

#pragma mark - getters and setters
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
