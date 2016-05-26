//
//  NSDate+Extension.m
//  1.5-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+(NSString *)dateToYearString:(NSDate*)date{
    NSDateFormatter *yFormatter = [[NSDateFormatter alloc]init];
    [yFormatter setDateFormat:@"yyyy"];
    return [yFormatter stringFromDate:date];
}


+(NSString *)dateToBirthSring:(NSDate*)date{
    NSDateFormatter *ymdFormatter = [[NSDateFormatter alloc] init];
    [ymdFormatter setDateFormat:@"yyyy-MM-dd"];
    return [ymdFormatter stringFromDate:date];
}

+(NSString *)dateToDetailSring:(NSDate*)date{
    NSDateFormatter *ymdFormatter = [[NSDateFormatter alloc] init];
    [ymdFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [ymdFormatter stringFromDate:date];
}

+(NSDate *)JSDateFromString:(NSString*)string{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [inputFormatter setTimeZone:timeZone];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: inputDate];
    NSDate *localeDate = [inputDate  dateByAddingTimeInterval: interval];
    
    return localeDate;
}


@end
