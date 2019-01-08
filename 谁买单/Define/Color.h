//
//  Color.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/6.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#ifndef Color_h
#define Color_h

//RGB色值
#define RGBA(R, G, B, A/*透明*/) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A];

//主题色
#define THEME_COLOR RGBA(0, 0, 0, 0.4)

//主题色
#define Theme_White_color RGBA(255, 255, 255, 0.5)

//浅绿色（登录按钮）
#define color_c1e08c [UIColor colorWithHex:0Xc1e08c]

//蔚蓝色
#define color_b8f0fe [UIColor colorWithHex:0Xb8f0fe]

//蓝色
#define color_4381c4 [UIColor colorWithHex:0X4381c4]

#define color_7ccd7c [UIColor colorWithHex:0X7ccd7c]

//月白
#define color_d6ecf0 [UIColor colorWithHex:0Xd6ecf0]

#endif /* Color_h */
