//
//  SysMacro.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/7/27.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#ifndef SysMacro_h
#define SysMacro_h

//屏幕的宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define NavHeight (STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT)

//状态栏高度
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

//导航栏高度
#define NAVIGATION_BAR_HEIGHT self.navigationController.navigationBar.frame.size.height

//AppDelegate
#define AppDelegateObject ((AppDelegate *)[UIApplication sharedApplication].delegate)

//tabbar高度
#define TAB_BAR_HEIGHT self.tabBar.frame.size.height

//自我若引用
#define WEAK_SELF typeof(self) __weak weakSelf = self;

#endif /* SysMacro_h */
