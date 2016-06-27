//
//  AppDelegate+NewVision.m
//  CNS
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "AppDelegate+NewVision.h"

#import "JSNewVisionViewControler.h"

#import <objc/runtime.h>

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

-(void)introduceNewVison:(void(^)())block{
    JSNewVisionViewControler *vc = [[JSNewVisionViewControler alloc] init];
    
    self.window.rootViewController =vc;
    
    
    [self.window makeKeyAndVisible];
    
    self.doWhenPost = block;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstVisit) name:@"CNSgameHWMCD" object:nil];
}

-(void)firstVisit{
    self.doWhenPost();
}

-(void)setDoWhenPost:(void (^)())doWhenPost{

    objc_setAssociatedObject(self, @selector(setDoWhenPost:), doWhenPost, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

-(void (^)())doWhenPost{

    return objc_getAssociatedObject(self, @selector(setDoWhenPost:));
}

@end
