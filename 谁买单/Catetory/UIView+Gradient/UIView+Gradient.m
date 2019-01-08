//
//  UIView+Gradient.m
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/14.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (void) setGradientColor:(NSArray<UIColor *>*)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    [((CAGradientLayer *)self.layer) setColors:colors];
    [((CAGradientLayer *)self.layer) setStartPoint:startPoint];
    [((CAGradientLayer *)self.layer) setEndPoint:endPoint];
}

@end
