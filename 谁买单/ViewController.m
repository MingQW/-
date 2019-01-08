//
//  ViewController.m
//  谁买单
//
//  Created by WuQingMing on 2018/12/22.
//  Copyright © 2018年 WuQingMing. All rights reserved.
//

#import "ViewController.h"
#import "RadarView.h"
#import "WaterWave.h"
#import "Utils.h"
#import <AVKit/AVKit.h>

@interface ViewController ()<RadarViewDelegate>
@property (nonatomic, strong) RadarView *radarView;
@property (nonatomic, assign) BOOL bEnableAddFingure;
@property (nonatomic, strong) NSMutableArray *waterWaveArray;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *resetBtn;

@property (nonatomic, assign) NSInteger timerCount;
@property (nonatomic, strong) NSMutableArray *colors;
@property (nonatomic, strong) NSMutableArray *names;

@property (nonatomic, strong) UIImageView *tipImageView;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.bEnableAddFingure = YES;
    self.timerCount = 5;
    [self initRadar];
    [self.view addSubview:self.resetBtn];
    [self.view addSubview:self.tipImageView];
    
    _colors = [ViewController constColorArray].mutableCopy;
    _names = [ViewController constNames].mutableCopy;
    
    [self showTips];
}

- (void) initRadar {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = self.view.frame.size.height;
    CGRect rect = CGRectMake((screenW - self.view.frame.size.height)/2, 0, screenH, screenH);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = [UIImage imageNamed:@"radar_background_3"];
    [self.view addSubview:imageView];
    
    RadarView *radarView = [[RadarView alloc] initWithFrame:rect];
    radarView.backgroundImage = [UIImage imageNamed:@"radar_background_3"];
    radarView.alpha = 0;
    radarView.delegate = self;
    radarView.radius = screenH/2;
    [self.view addSubview:radarView];
    _radarView = radarView;
    
    UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-39, self.view.center.y-39, 78, 78)];
    avatarView.layer.cornerRadius = 39;
    avatarView.layer.masksToBounds = YES;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event{
    if ([self.resetBtn.titleLabel.text isEqualToString:@"再来"]) {
        return;
    }
    
    if (self.bEnableAddFingure) {
        if (_names.count == 0 || _colors.count == 0) {
            return;
        }
        
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        //CGPoint centerPoint = self.view.center;
        
        //CGRect centerRect = CGRectMake(centerPoint.x - 30, centerPoint.y - 30, 60, 60);
        
        if(CGRectContainsPoint(_resetBtn.frame, point) ||
           //CGRectContainsPoint(centerRect, point) ||
           CGRectContainsPoint(self.tipImageView.frame, point))
        {
            return;
        }
        
        for (UIView *wave in self.waterWaveArray) {
            CGRect tempRect = CGRectMake(wave.frame.origin.x - 15, wave.frame.origin.y - 15, wave.frame.size.width + 30, wave.frame.size.height + 30);
            
            if (CGRectContainsPoint(tempRect, point)) {
                return;
            }
        }
        
        _resetBtn.hidden = NO;
        _resetBtn.enabled = YES;
        
        [self showResetBtn];
        
        WaterWave *waterWave = [[WaterWave alloc] initWithFrame:CGRectMake(point.x -25, point.y - 25, 40, 40)];
        waterWave.userInteractionEnabled = NO;
        waterWave.backgroundColor = [UIColor clearColor];
        
        NSInteger count = (NSInteger)(arc4random_uniform((int)_colors.count));
        UIColor *color = _colors[count];
        waterWave.color = color;
        [_colors removeObjectAtIndex:count];
        
        count = (NSInteger)(arc4random_uniform((int)_names.count));
        NSString *text = _names[count];
        waterWave.text = text;
        [_names removeObjectAtIndex:count];
        
        [self.view addSubview:waterWave];
        [self.waterWaveArray addObject:waterWave];
        
        if (self.waterWaveArray.count == 2) {
            [_resetBtn setTitle:@"开始" forState:UIControlStateNormal];
            
            [UIView animateWithDuration:0.5 animations:^{
                self.resetBtn.frame = CGRectMake(0, 0, 60, 60);
                self.resetBtn.layer.cornerRadius = 30;
                self.resetBtn.center = self.view.center;
            }];
        }
        else if (self.waterWaveArray.count == 1) {
            [self hiddleTips];
        }
    }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {   
}

- (void) startScan:(UIButton *)sender {
    NSInteger number = [sender.titleLabel.text integerValue];
    
    if ([sender.titleLabel.text isEqualToString:@"再点击一次屏幕"] || (0 < number && number < 6)) {
        return;
    }
    
    if ([sender.titleLabel.text isEqualToString:@"再来"]) {
        [self.audioPlayer stop];
        
        [self showTips];
        _resetBtn.hidden = YES;
        [_resetBtn setTitle:@"再点击一次屏幕" forState:UIControlStateNormal];
        
        [self.waterWaveArray enumerateObjectsUsingBlock:^(WaterWave *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        [self.waterWaveArray removeAllObjects];
        
        _resetBtn.enabled = NO;
        self.bEnableAddFingure = YES;
        
        self.resetBtn.frame = CGRectMake(self.view.center.x - 60, -60, 150, 36);
        self.resetBtn.layer.cornerRadius = 18;
        
        return;
    }
    
    [self playAutoVideo:@"rock"];
    
    [self.timer fire];
    
    _resetBtn.titleLabel.font = [UIFont boldSystemFontOfSize:32];
    
    _radarView.alpha = 1;
    [_radarView scan];
}

- (void) setUpTimer {
    [_resetBtn setTitle:[NSString stringWithFormat:@"%ld", (long)self.timerCount] forState:UIControlStateNormal];
    
    if (self.timerCount == 0) {
        [self playAutoVideo:@"hit"];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.radarView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.radarView stop];
            
            [self.timer invalidate];
            self.timer = nil;
            
            self.resetBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
            [self.resetBtn setTitle:@"再来" forState:UIControlStateNormal];
            self.bEnableAddFingure = YES;
            
            NSInteger count = (NSInteger)(arc4random_uniform((int)self.waterWaveArray.count));
            WaterWave *waterWave = self.waterWaveArray[count];
            waterWave.bHit = YES;
        }];
        
        _colors = [ViewController constColorArray].mutableCopy;
        _names = [ViewController constNames].mutableCopy;
        self.timerCount = 5;
    }
    
    self.timerCount--;
}

- (void) showResetBtn {
    __weak ViewController *weakSelf = self;
    
    [UIView animateWithDuration:1 delay:0.5 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.resetBtn.center = self.view.center;
    } completion:^(BOOL finished) {
        if (weakSelf.waterWaveArray.count == 1)  {
            weakSelf.resetBtn.hidden = NO;
            [weakSelf.resetBtn setTitle:@"再点击一次屏幕" forState:UIControlStateNormal];
        }
    }];
}

- (void) showTips {
    CGFloat sourceY = 30;
    if (LL_iPhoneX) {
        sourceY = 60;
    }
    
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.tipImageView.center = CGPointMake(self.tipImageView.center.x, sourceY);
    } completion:nil];
}

- (void) hiddleTips {
    [UIView animateWithDuration:0.5 animations:^{
        self.tipImageView.center = CGPointMake(self.tipImageView.center.x, -(self.tipImageView.frame.size.height));
    }];
}

- (void) playAutoVideo:(NSString *)name {

    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
    NSURL *fileUrl = [[NSURL alloc] initFileURLWithPath:path];

    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];

    if ([name isEqualToString:@"radar"]) {
        self.audioPlayer.volume = 3;
        self.audioPlayer.numberOfLoops = 2;
    }
    else if ([name isEqualToString:@"hit"]) {
        self.audioPlayer.volume = 0.6;
    }
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
}

- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tips"]];
        _tipImageView.center = self.view.center;
        
        _tipImageView.frame = CGRectMake(self.view.center.x - 80, -_tipImageView.frame.size.height, 150, 80);
    }
    
    return _tipImageView;
}

- (NSMutableArray *)waterWaveArray {
    if (!_waterWaveArray) {
        _waterWaveArray = [NSMutableArray array];
    }
    
    return _waterWaveArray;
}

- (UIButton *)resetBtn {
    if (!_resetBtn) {
        _resetBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 60, -60, 150, 30)];
        _resetBtn.hidden = YES;
        _resetBtn.enabled = NO;
        _resetBtn.backgroundColor = [UIColor whiteColor];
        _resetBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _resetBtn.layer.cornerRadius = _resetBtn.frame.size.height/2;
        _resetBtn.layer.borderWidth = 3;
        [_resetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_resetBtn setTitle:@"再点击一次屏幕" forState:UIControlStateNormal];
        
        [_resetBtn addTarget:self action:@selector(startScan:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _resetBtn;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setUpTimer) userInfo:nil repeats:YES];
    }
    
    return _timer;
}

+ (NSArray *)constColorArray {
    return @[[UIColor whiteColor], [UIColor orangeColor], [UIColor blueColor], [UIColor greenColor], [UIColor purpleColor], [UIColor brownColor], [UIColor redColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor cyanColor]];
}

+ (NSArray *)constNames {
    return @[@"刘一", @"陈二", @"张三", @"李四", @"王五", @"赵六", @"孙七", @"周八", @"吴九", @"郑十"];
}

- (AVAudioPlayer *)audioPlayer {
    if (!_audioPlayer) {
        _audioPlayer = [[AVAudioPlayer alloc] init];
    }
    
    return _audioPlayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
