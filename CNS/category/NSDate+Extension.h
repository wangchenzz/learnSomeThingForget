//
//  NSDate+Extension.h
//  1.5-2015
//
//  Created by Mac on 16/1/11.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+(NSString*)dateToYearString:(NSDate*)date;


+(NSString*)dateToBirthSring:(NSDate*)date;


+(NSDate *)JSDateFromString:(NSString*)string;

@end
