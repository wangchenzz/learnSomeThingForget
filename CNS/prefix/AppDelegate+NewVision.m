//
//  AppDelegate+NewVision.m
//  CNS
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "AppDelegate+NewVision.h"

@implementation AppDelegate (NewVision)

-(BOOL)decideIsNewVisionCome{
    
    NSString *versionKey = @"CFBundleVersion";
    
    NSString*currentVersion = [[NSBundle mainBundle].infoDictionary objectForKey:versionKey];
    
    NSString*userVersion = [[NSUserDefaults standardUserDefaults]objectForKey:versionKey];
    
    if ([currentVersion isEqualToString:userVersion]) {
        return NO;
    }else{
        return YES;
    }
}

@end
