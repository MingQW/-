//
//  WaterWave.m
//  谁买单
//
//  Created by WuQingMing on 2018/12/22.
//  Copyright © 2018年 WuQingMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadarScanView;

@protocol RadarViewDelegate;

@interface RadarView : UIView

@property (nonatomic, assign) CGFloat radius;                    //半径
@property (nonatomic, strong) UIColor *scanStartColor;      //渐变开始颜色
@property (nonatomic, strong) UIColor *scanEndColor;        //渐变结束颜色
@property (nonatomic, assign) CGFloat scanAngle;            //指针渐变角度
@property (nonatomic, assign) BOOL scanClockwise;           //是否顺时针
@property (nonatomic, strong) UIImage *backgroundImage; //背景图片
@property (nonatomic, strong) UIView *pointsView;       //目标点视图

@property (nonatomic, assign) id <RadarViewDelegate> delegate;        //委托

-(void)scan;    //扫描
-(void)stop;    //停止
-(void)show;    //显示目标
-(void)hide;    //隐藏目标

@end


@protocol RadarViewDelegate <NSObject>

@optional

@end
