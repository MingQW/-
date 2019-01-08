//
//  UITextField+Done.m
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/8.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import "UITextField+Done.h"

@implementation UITextField (Done)

- (void) addFinishToKeyboard:(NSString *)title {
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH,44)];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 7,50, 30)];
    
    UIColor *color = THEME_COLOR;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:self action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *flexibleitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:self action:nil];
    NSArray *items = @[flexibleitem,flexibleitem,item];
    [bar setItems:items animated:YES];
    
    self.inputAccessoryView = bar;
}

@end
