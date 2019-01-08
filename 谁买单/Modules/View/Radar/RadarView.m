//
//  WaterWave.m
//  谁买单
//
//  Created by WuQingMing on 2018/12/22.
//  Copyright © 2018年 WuQingMing. All rights reserved.
//

#import "RadarView.h"
#import "ScanView.h"

#import <QuartzCore/QuartzCore.h>
#define RADAR_DEFAULT_RADIUS 100.f
#define RADAR_ROTATE_SPEED 180.0f
#define SCANNER_START_COLOR [UIColor colorWithRed:20.0/255.0 green:120.0/255.0 blue:40.0/255.0 alpha:1]
#define SCANNER_END_COLOR [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:0]
#define SCANNER_ANGLE 60.0
#define SCANNER_CLOCKWISE YES

@interface RadarView()
@property (nonatomic, strong) ScanView *scanView;
@end

@implementation RadarView

#pragma mark - life cycle

- (id)init {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    if (!self.scanView) {
        ScanView *scanView = [[ScanView alloc] initWithFrame:self.bounds];
        [self addSubview:scanView];
        _scanView = scanView;
    }
    
    if (!self.pointsView) {
        UIView *pointsView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:pointsView];
        _pointsView = pointsView;
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    /*背景图片*/
    if (self.backgroundImage) {
        UIImage *image = self.backgroundImage;
        [image drawInRect:self.bounds];//在坐标中画出图片
    }
    
    CGFloat radius = RADAR_DEFAULT_RADIUS;
    if (self.radius) {
        radius = self.radius;
    }
    
    CGFloat scanAngle = SCANNER_ANGLE;
    if (self.scanAngle) {
        scanAngle = self.scanAngle;
    }
    
    BOOL scanClockwise = SCANNER_CLOCKWISE;
    if (self.scanClockwise) {
        scanClockwise = self.scanClockwise;
    }
    
    UIColor *scanStartColor = SCANNER_START_COLOR;
    if (self.scanStartColor) {
        scanStartColor = self.scanStartColor;
    }
    
    UIColor *scanEndColor = SCANNER_END_COLOR;
    if (self.scanEndColor) {
        scanEndColor = self.scanEndColor;
    }
    
    if (self.scanView) {
        self.scanView.frame = self.bounds;
        self.scanView.backgroundColor = [UIColor clearColor];
        self.scanView.radius = self.radius;
        self.scanView.angle = scanAngle;
        self.scanView.clockwise = scanClockwise;
        self.scanView.startColor = scanStartColor;
        self.scanView.endColor = scanEndColor;
    }
}

#pragma mark - Actions
- (void)scan {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    BOOL indicatorClockwise = SCANNER_CLOCKWISE;
    if (self.scanClockwise) {
        indicatorClockwise = self.scanClockwise;
    }
    rotationAnimation.toValue = [NSNumber numberWithFloat: (indicatorClockwise?1:-1) * M_PI * 2.0 ];
    rotationAnimation.duration = 360.f/RADAR_ROTATE_SPEED;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = INT_MAX;
    [_scanView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stop {
    [_scanView.layer removeAnimationForKey:@"rotationAnimation"];
}

- (void)show {
}

- (void)hide {
    
}

#pragma mark - XHRadarPointViewDelegate


@end
