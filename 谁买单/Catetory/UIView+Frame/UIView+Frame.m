//
//  UIView+Frame.m
//  GeneralApp
//
//  Created by 吴庆明 on 2018/7/31.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setW:(CGFloat)w {
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}

- (CGFloat)w {
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h {
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}

- (CGFloat)h {
    return self.frame.size.height;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

-(CGSize)size {
   return self.frame.size;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

@end
