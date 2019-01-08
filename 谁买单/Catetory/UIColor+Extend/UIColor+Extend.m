//
//  UIColor+Extend.m
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/6.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import "UIColor+Extend.h"

@implementation UIColor (Extend)

+ (UIColor *)colorWithHex:(NSUInteger)hex {
    return [UIColor colorWithHex:hex andAlpha:1];
}

+ (UIColor *)colorWithHex:(NSUInteger)hex andAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}

@end
