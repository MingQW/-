//
//  ScanView.h
//  谁买单
//
//  Created by WuQingMing on 2018/12/22.
//  Copyright © 2018年 WuQingMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanView : UIView

@property (nonatomic, assign) CGFloat radius;           //半径
@property (nonatomic, strong) UIColor *startColor;      //渐变开始颜色
@property (nonatomic, strong) UIColor *endColor;        //渐变结束颜色
@property (nonatomic, assign) CGFloat angle;            //渐变角度
@property (nonatomic, assign) BOOL clockwise;           //是否顺时针

@end
