//
//  UIView+Frame.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/7/31.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat w;

@property (nonatomic, assign) CGFloat h;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign, readonly) CGFloat maxX;

@property (nonatomic, assign, readonly) CGFloat maxY;

@end
