//
//  StroopModel.m
//  CNS
//
//  Created by Mac on 16/3/16.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "StroopModel.h"

@implementation StroopModel


-(UIColor *)colorForText{
    if ([self.showText isEqualToString:@"红"]) {
        return [UIColor redColor];
    }else if ([self.showText isEqualToString:@"蓝"]){
        return [UIColor blueColor];
    }else if ([self.showText isEqualToString:@"绿"]){
        return [UIColor greenColor];
    }else if ([self.showText isEqualToString:@"灰"]){
        return [UIColor grayColor];
    }else if ([self.showText isEqualToString:@"黄"]){
        return [UIColor yellowColor];
    }else{
        return [UIColor orangeColor];    }
}

@end
