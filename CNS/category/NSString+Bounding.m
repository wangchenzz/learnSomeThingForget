//
//  NSString+Bounding.m
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "NSString+Bounding.h"

@implementation NSString (Bounding)

-(CGRect)boundingRectWithSize:(CGSize)size strFont:(UIFont *)font{
    
    NSMutableDictionary *titleDic = [NSMutableDictionary dictionary];
    titleDic[NSFontAttributeName] = font;
    
    CGRect valueRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:titleDic context:nil];

    return valueRect;
}


@end
