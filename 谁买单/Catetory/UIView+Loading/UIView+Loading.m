//
//  UIView+Loading.m
//  GeneralApp
//
//  Created by WuQingMing on 2018/10/13.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import "UIView+Loading.h"
#import <MBProgressHUD.h>

@implementation UIView (Loading)

- (void) showLoading {
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.tag = 1111;
    bgView.backgroundColor = [UIColor whiteColor];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.center = bgView.center;
    
    [bgView addSubview:activityView];
    [self addSubview:bgView];
    
    [activityView startAnimating];
}

- (void) showClearoading {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.userInteractionEnabled = NO;
    hud.tag = 1112;
    hud.mode = MBProgressHUDModeIndeterminate;
}

- (void) hiddleLoading {
    [MBProgressHUD hideHUDForView:self animated:YES];
    
    for (UIView *subView in self.subviews) {
        if (subView.tag == 1111 ||subView.tag == 1112) {
            subView.hidden = YES;
            [subView removeFromSuperview];
        }
    }
}

- (void) showToast:(NSString *)tips {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.userInteractionEnabled = NO;
    
    hud.mode = MBProgressHUDModeText;
    hud.label.text = tips;
    hud.center = self.center;
    
    hud.margin = 10.0f;
    hud.bezelView.layer.cornerRadius = 5.0;
    
    [hud hideAnimated:YES afterDelay:2];
}

@end
