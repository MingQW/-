//
//  UIView+Gradient.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/14.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)

- (void) setGradientColor:(NSArray<UIColor *>*)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
