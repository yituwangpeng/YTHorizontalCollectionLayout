//
//  MyPlanListLayoutParam.h
//  PlanHelper
//
//  Created by 王鹏 on 15/8/3.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#ifndef PlanHelper_MyPlanListLayoutParam_h
#define PlanHelper_MyPlanListLayoutParam_h
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.04
/**
 *  Cell屏幕左侧的距离
 */
static CGFloat const MyPlanListCellLeft = 40.0f;

/**
 *  Cell之间的距离
 */
static CGFloat const MyPlanListCellSpace = 20.0;

/**
 *  图片左边距
 */
static CGFloat const MyPlanListImageLeft = 0.0;

/**
 *  图片上边距
 */
static CGFloat const MyPlanListImageTop = 0.0;



#define MyPlanListCellWidth ((UIWidth - MyPlanListCellLeft * 2))
#define MyPlanListCellHeight (UIHeight - topViewHeight - 149)
/**
 *  图片宽度
 */
#define MyPlanListCellImageWidth (MyPlanListCellWidth - MyPlanListImageLeft * 2)

/**
 *  图片高度
 */
//#define SurroundingCellImageHeight (SurroundingCellImageWidth / 140 * 90)
#define MyPlanListCellImageHeight MyPlanListCellHeight



#define UIHeight [[UIScreen mainScreen] bounds].size.height
#define UIWidth [[UIScreen mainScreen] bounds].size.width
#define UIWidthRate (UIWidth/320.0)
#define MAIN_WINDOW [[[UIApplication sharedApplication] windows] objectAtIndex:0]


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8. ? YES :NO)

#define IS_IPHONE4 (([[UIScreen mainScreen] bounds].size.height - 480 == 0.) ? YES:NO)
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height - 568 >= 0.) ? YES:NO)
#define IS_IPHONE6 (([[UIScreen mainScreen] bounds].size.height - 667 >= 0.) ? YES:NO)

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7. ? YES :NO)
#define RGB(x,y,z) [UIColor colorWithRed:x/255. green:y/255. blue:z/255. alpha:1.]
#define RGBA(x,y,z,a) [UIColor colorWithRed:x/255. green:y/255. blue:z/255. alpha:a/100.]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define LINE_COLOR RGB(230,230,230)
#define screenSize [NSString stringWithFormat:@"%.f",[[[UIScreen mainScreen] currentMode] size].width]

#define topView_origin_y    (IS_IOS7 ? (20) : 0)
#define topView_height      (IS_IOS7 ? (44+20) : 44)
#define topViewHeight       64
#define kDockHeight 50
#endif
