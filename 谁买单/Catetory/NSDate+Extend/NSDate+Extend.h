//
//  NSDate+Extend.h
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/22.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extend)

- (NSInteger) iday;
- (NSInteger) imonth;
- (NSInteger) iyear;

- (NSString *) engLishWeek;
- (NSString *) engLishMonth;

- (NSString *) monthDayWeek;
- (NSString *) yearMonthDay;

- (BOOL) compareYearMonthDay:(NSDate *)date;

//获取节假日
- (NSString *)getLunarHoliDay;
//获取节气
- (NSString *)getLunarSpecial;

@end
