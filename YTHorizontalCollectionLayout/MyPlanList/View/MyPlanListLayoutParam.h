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



#endif
