//
//  WaterWave.h
//  谁买单
//
//  Created by WuQingMing on 2018/12/22.
//  Copyright © 2018年 WuQingMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterWave : UIView

//颜色
@property (nonatomic, strong) UIColor *color;
//中间文字
@property (nonatomic, copy) NSString *text;
//选中
@property (nonatomic, assign) BOOL bHit;

@end
