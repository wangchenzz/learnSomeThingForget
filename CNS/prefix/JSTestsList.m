//
//  JSTestsList.m
//  CNS
//
//  Created by Mac on 16/4/14.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSTestsList.h"

@implementation JSTestsList

-(NSMutableArray *)SimplifyTime{
    if (!_SimplifyTime) {
        self.SimplifyTime = [NSMutableArray array];
    }
    return _SimplifyTime;
}

-(NSMutableArray *)ComplicationTime{
    if (!_ComplicationTime) {
        self.ComplicationTime = [NSMutableArray array];
    }
    return _ComplicationTime;
}

-(NSMutableArray *)InContrastTime{
    if (!_InContrastTime) {
        self.InContrastTime = [NSMutableArray array];
    }
    return _InContrastTime;
}

@end


