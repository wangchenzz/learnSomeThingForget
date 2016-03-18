//
//  StroopModel.h
//  CNS
//
//  Created by Mac on 16/3/16.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StroopModel : NSObject

/**
 *  要设定颜色的种类和个数
 */
@property (nonatomic,copy) NSString *showText;

@property (nonatomic,retain) UIColor *textColor;

/**
 *  时间范围在1~2秒之间'
 */
@property (nonatomic,assign) float showTime;

@end
