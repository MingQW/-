//
//  UIColor+Extend.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/6.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extend)

+ (UIColor *)colorWithHex:(NSUInteger)hex;
+ (UIColor *)colorWithHex:(NSUInteger)hex andAlpha:(CGFloat)alpha;

@end
