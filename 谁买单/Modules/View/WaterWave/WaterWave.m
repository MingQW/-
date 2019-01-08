//
//  WaterWave.m
//  谁买单
//
//  Created by WuQingMing on 2018/12/22.
//  Copyright © 2018年 WuQingMing. All rights reserved.
//

#import "WaterWave.h"

@interface WaterWave()
//波纹圈数
@property (nonatomic, assign) NSInteger circleCount;
//波纹范围
@property (nonatomic, assign) NSInteger maxScale;
//波纹厚度
@property (nonatomic, assign) CGFloat circleWidth;
//中间标签
@property (nonatomic, strong) UILabel *buyLabel;

@end

@implementation WaterWave

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.circleCount = 5;
        self.maxScale = 2.5;
        self.circleWidth = 1;
        [self addSubview:self.buyLabel];
    }
    
    return self;
}

//高亮
- (void)setBHit:(BOOL)bHit {
    _bHit = bHit;
    
    self.circleCount = 5;
    self.maxScale = 5;
    self.circleWidth = 1.6;
    self.buyLabel.font = [UIFont boldSystemFontOfSize:18];
    self.buyLabel.textColor = self.color;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    _text = text;
    _buyLabel.textColor = self.color;
    _buyLabel.text = text;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [[UIColor clearColor] setFill];
    
    double animationDuration = 3;
    CALayer * animationLayer = [CALayer layer];
    
    for (int i = 0; i < _circleCount; i++) {
        CALayer * pulsingLayer = [CALayer layer];
        pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pulsingLayer.borderColor = self.color.CGColor;
        pulsingLayer.borderWidth = self.circleWidth;
        pulsingLayer.cornerRadius = rect.size.height / 2;
        
        CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @1.1;
        scaleAnimation.toValue = @(self.maxScale);
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.fillMode = kCAFillModeBackwards;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration / (double)_circleCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE;
        animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        
        [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];
        [animationLayer addSublayer:pulsingLayer];
    }
    
    [self.layer addSublayer:animationLayer];
}

- (NSArray *)colorArray {
    return @[[UIColor whiteColor], [UIColor orangeColor], [UIColor blueColor], [UIColor greenColor], [UIColor purpleColor], [UIColor brownColor], [UIColor redColor], [UIColor yellowColor]];
}

- (UILabel *)buyLabel {
    if (!_buyLabel) {
        _buyLabel = [[UILabel alloc] initWithFrame:CGRectMake(-10, 0, self.frame.size.width + 20, self.frame.size.height)];
        _buyLabel.textAlignment = NSTextAlignmentCenter;
        _buyLabel.font = [UIFont boldSystemFontOfSize:16];
        _buyLabel.textColor = self.color;
        _buyLabel.text = self.text;
    }
    
    return _buyLabel;
}

@end
