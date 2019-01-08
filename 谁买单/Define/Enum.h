//
//  Enum.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/7/27.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#ifndef Enum_h
#define Enum_h

#import <Foundation/Foundation.h>

typedef enum : NSInteger{
    SelectTypeNone,  //未选择
    SelectTypeAll,   //全部
    SelectTypeDay,   //一天
    SelectTypeMuti   //多选
}SelectType;

typedef enum : NSInteger{
    FunctionType_Image,
    FunctionType_Bill,
    FunctionType_memberDay,
    FunctionType_setUp,
    FunctionType_Mine,
}FunctionType;


#endif /* Enum_h */
