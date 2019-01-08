//
//  NSDate+Extend.m
//  GeneralApp
//
//  Created by 吴庆明 on 2018/8/22.
//  Copyright © 2018年 吴庆明. All rights reserved.
//

#import "NSDate+Extend.h"

const  int START_YEAR = 2018;
const  int END_YEAR   = 2050;

static int32_t gLunarHolDay[]=
{
    0XA5, 0XB4, 0XA6, 0XA5, 0XA6, 0X96, 0X88, 0X88, 0X78, 0X78, 0X87, 0X87,   //2018
    0XA5, 0XB4, 0X96, 0XA5, 0X96, 0X96, 0X88, 0X78, 0X78, 0X79, 0X77, 0X87,   //2019
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X86,   //2020
    0XA5, 0XC3, 0XA5, 0XB5, 0XA6, 0XA6, 0X87, 0X88, 0X88, 0X78, 0X87, 0X86,   //2021
    0XA5, 0XB4, 0XA5, 0XA5, 0XA6, 0X96, 0X88, 0X88, 0X88, 0X78, 0X87, 0X87,   //2022
    0XA5, 0XB4, 0X96, 0XA5, 0X96, 0X96, 0X88, 0X78, 0X78, 0X79, 0X77, 0X87,   //2023
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X96,   //2024
    0XA5, 0XC3, 0XA5, 0XB5, 0XA6, 0XA6, 0X87, 0X88, 0X88, 0X78, 0X87, 0X86,   //2025
    0XA5, 0XB3, 0XA5, 0XA5, 0XA6, 0XA6, 0X88, 0X88, 0X88, 0X78, 0X87, 0X87,   //2026
    0XA5, 0XB4, 0X96, 0XA5, 0X96, 0X96, 0X88, 0X78, 0X78, 0X78, 0X87, 0X87,   //2027
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X96,   //2028
    0XA5, 0XC3, 0XA5, 0XB5, 0XA6, 0XA6, 0X87, 0X88, 0X88, 0X78, 0X87, 0X86,   //2029
    0XA5, 0XB3, 0XA5, 0XA5, 0XA6, 0XA6, 0X88, 0X88, 0X88, 0X78, 0X87, 0X87,   //2030
    0XA5, 0XB4, 0X96, 0XA5, 0X96, 0X96, 0X88, 0X78, 0X78, 0X78, 0X87, 0X87,   //2031
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X96,   //2032
    0XA5, 0XC3, 0XA5, 0XB5, 0XA6, 0XA6, 0X88, 0X88, 0X88, 0X78, 0X87, 0X86,   //2033
    0XA5, 0XB3, 0XA5, 0XA5, 0XA6, 0XA6, 0X88, 0X78, 0X88, 0X78, 0X87, 0X87,   //2034
    0XA5, 0XB4, 0X96, 0XA5, 0XA6, 0X96, 0X88, 0X88, 0X78, 0X78, 0X87, 0X87,   //2035
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X96,   //2036
    0XA5, 0XC3, 0XA5, 0XB5, 0XA6, 0XA6, 0X87, 0X88, 0X88, 0X78, 0X87, 0X86,   //2037
    0XA5, 0XB3, 0XA5, 0XA5, 0XA6, 0XA6, 0X88, 0X88, 0X88, 0X78, 0X87, 0X87,   //2038
    0XA5, 0XB4, 0X96, 0XA5, 0XA6, 0X96, 0X88, 0X88, 0X78, 0X78, 0X87, 0X87,   //2039
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X96,   //2040
    0XA5, 0XC3, 0XA5, 0XB5, 0XA5, 0XA6, 0X87, 0X88, 0X87, 0X78, 0X87, 0X86,   //2041
    0XA5, 0XB3, 0XA5, 0XB5, 0XA6, 0XA6, 0X88, 0X88, 0X88, 0X78, 0X87, 0X87,   //2042
    0XA5, 0XB4, 0X96, 0XA5, 0XA6, 0X96, 0X88, 0X88, 0X78, 0X78, 0X87, 0X87,   //2043
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X88, 0X87, 0X96,   //2044
    0XA5, 0XC3, 0XA5, 0XB4, 0XA5, 0XA6, 0X87, 0X88, 0X87, 0X78, 0X87, 0X86,   //2045
    0XA5, 0XB3, 0XA5, 0XB5, 0XA6, 0XA6, 0X87, 0X88, 0X88, 0X78, 0X87, 0X87,   //2046
    0XA5, 0XB4, 0X96, 0XA5, 0XA6, 0X96, 0X88, 0X88, 0X78, 0X78, 0X87, 0X87,   //2047
    0X95, 0XB4, 0XA5, 0XB4, 0XA5, 0XA5, 0X97, 0X87, 0X87, 0X88, 0X86, 0X96,   //2048
    0XA4, 0XC3, 0XA5, 0XA5, 0XA5, 0XA6, 0X97, 0X87, 0X87, 0X78, 0X87, 0X86,   //2049
    0XA5, 0XC3, 0XA5, 0XB5, 0XA6, 0XA6, 0X87, 0X88, 0X78, 0X78, 0X87, 0X87    //2050
};

@implementation NSDate (Extend)

- (NSInteger) iday {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd"];
    
    return [[formatter stringFromDate:self] integerValue];
}

- (NSInteger) imonth {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"MM"];
    
    return [[formatter stringFromDate:self] integerValue];
}

- (NSInteger) iyear {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"YYYY"];
    
    return [[formatter stringFromDate:self] integerValue];
}

- (NSString *)day {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd"];
    
    return [formatter stringFromDate:self];
}

- (NSString *)engLishWeek {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"EEEE"];
    NSString *weekDay = [formatter stringFromDate:self];
    
    if ([weekDay isEqualToString:@"星期一"] || [weekDay isEqualToString:@"Monday"]) {
        return @"MONDAY";
    }
    else if ([weekDay isEqualToString:@"星期二"] || [weekDay isEqualToString:@"Tuesday"]) {
        return @"TUESDAY";
    }
    else if ([weekDay isEqualToString:@"星期三"] || [weekDay isEqualToString:@"Wednesday"]) {
        return @"WEDNESDAY";
    }
    else if ([weekDay isEqualToString:@"星期四"] || [weekDay isEqualToString:@"Thursday"]) {
        return @"THURSDAY";
    }
    else if ([weekDay isEqualToString:@"星期五"] || [weekDay isEqualToString:@"Friday"]) {
        return @"FRIDAY";
    }
    else if ([weekDay isEqualToString:@"星期六"] || [weekDay isEqualToString:@"Saturday"]) {
        return @"SATURDAY";
    }
    else if ([weekDay isEqualToString:@"星期日"] || [weekDay isEqualToString:@"Sunday"]) {
        return @"SUNDAY";
    }
    
    return @"";
}

- (NSString *)engLishMonth {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"MM"];
    
    NSInteger iMonth = [[formatter stringFromDate:self] integerValue];
    
    switch (iMonth) {
        case 1:
            return @"JAN";
            break;
        case 2:
            return @"FEB";
            break;
        case 3:
            return @"MAR";
            break;
        case 4:
            return @"APR";
            break;
        case 5:
            return @"MAY";
            break;
        case 6:
            return @"JUN";
            break;
        case 7:
            return @"JUL";
            break;
        case 8:
            return @"AUG";
            break;
        case 9:
            return @"SEP";
            break;
        case 10:
            return @"OCT";
            break;
        case 11:
            return @"NOV";
            break;
        case 12:
            return @"DEC";
            break;
            
        default:
            break;
    }
    
    return @"";
}

- (NSString *)monthDayWeek {
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    [formatter setDateFormat:@"MM"];
    NSInteger month=[[formatter stringFromDate:self]integerValue];
    
    [formatter setDateFormat:@"dd"];
    NSInteger day=[[formatter stringFromDate:self] integerValue];
    
    [formatter setDateFormat:@"EEEE"];
    NSString *weekDay = [formatter stringFromDate:self];
    
    return [NSString stringWithFormat:@"%ld月%ld日 %@", month, day, weekDay];
}

- (NSString *) yearMonthDay {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyyMMdd"];
    
    return [formatter stringFromDate:self];
}

- (BOOL) compareYearMonthDay:(NSDate *)date {
    NSString *selfYearMonthDay = [self yearMonthDay];
    NSString *dateYearMonthDay = [date yearMonthDay];
    
    return [selfYearMonthDay isEqualToString:dateYearMonthDay];
}
- (NSString *)getLunarHoliDay {
    NSTimeInterval timeInterval_day = 60*60*24.0;
    
    NSDate *nextDay_date = [NSDate dateWithTimeInterval:timeInterval_day sinceDate:self];
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:nextDay_date];
    
    if ( 1 == localeComp.month && 1 == localeComp.day ) {
        return @"除夕";
    }
    
    NSDictionary *chineseHoliDay = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"春节", @"1-1",
                                    @"元宵", @"1-15",
                                    @"端午", @"5-5",
                                    @"七夕", @"7-7",
                                    @"中元", @"7-15",
                                    @"中秋", @"8-15",
                                    @"重阳", @"9-9",
                                    @"腊八", @"12-8",
                                    @"小年", @"12-24",
                                    nil];
    
    localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *key_str = [NSString stringWithFormat:@"%ld-%ld",(long)localeComp.month,localeComp.day];

    return [chineseHoliDay objectForKey:key_str];
}

- (NSString *)getLunarSpecial {
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"小寒", @"大寒", @"立春", @"雨水", @"惊蛰", @"春分",
                          @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至",
                          @"小暑", @"大暑", @"立秋", @"处暑", @"白露", @"秋分",
                          @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", nil];
    
    NSInteger iYear = [self iyear];
    NSInteger iMonth = [self imonth];
    NSInteger iDay = [self iday];
    
    NSInteger array_index = (iYear - START_YEAR)*12+iMonth -1 ;
    
    
    int64_t flag = gLunarHolDay[array_index];
    int64_t day;
    
    if(iDay <15)
        day= 15 - ((flag>>4)&0x0f);
    else
        day = ((flag)&0x0f)+15;
    
    NSInteger index = -1;
    
    if(iDay == day){
        index = (iMonth-1) *2 + (iDay>15? 1: 0);
    }
    
    if ( index >= 0  && index < [chineseDays count] ) {
        return [chineseDays objectAtIndex:index];
    }
    else {
        return @"";
    }
}

@end
