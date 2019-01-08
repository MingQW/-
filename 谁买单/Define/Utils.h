//
//  Utils.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/7/27.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#ifndef Utils_h
#define Utils_h

#define  LL_iPhoneX ([UIScreen mainScreen].bounds.size.width*1.0/[UIScreen mainScreen].bounds.size.height < 0.5? YES : NO)

//alert
#define ALERT(msg) [[[UIAlertView alloc] initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

//NSUserDefault 存对象数据
#define UDSaveObject(obj, key) \
        if(obj != nil && key != nil) { \
            [[NSUserDefaults standardUserDefaults] setSecretObject:obj forKey:key]; \
            [[NSUserDefaults standardUserDefaults] synchronize]; \
        }

//NSUserDefault 取对象数据
#define UDGetObject(key)  (key != nil ? [[NSUserDefaults standardUserDefaults] secretObjectForKey:key] : nil)

#define POSTNOTIFICATION(NAME,USERINFO) \
    [[NSNotificationCenter defaultCenter] postNotificationName:NAME object:nil userInfo:USERINFO];
#define ADDNOTIFICATION(NAME,SEL) \
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SEL) name:NAME object:nil];
#define REMOVENOTIFICATION(NAME) \
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NAME object:nil];

#endif /* TUtils_h */
