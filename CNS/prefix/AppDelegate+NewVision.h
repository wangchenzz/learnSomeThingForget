//
//  AppDelegate+NewVision.h
//  CNS
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (NewVision)

@property (nonatomic,copy) void(^doWhenPost)();


-(BOOL)decideIsNewVisionCome;

-(void)introduceNewVison:(void(^)())block;

@end
