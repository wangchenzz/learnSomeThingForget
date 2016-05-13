//
//  AppDelegate.m
//  CNS
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "AppDelegate.h"

#import "JSTabBarController.h"

#import "loginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
    
    [[INetworking shareNet] GET:loginUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        NSDictionary *dic = (NSDictionary *)returnObject;
        if (isSuccess && [dic[@"msg"]isEqualToString:@"1"]) {
            
            JSTabBarController *jstc = [[JSTabBarController alloc]init];
            self.window.rootViewController = jstc;
            
            [self.window makeKeyAndVisible];
        }else{
            loginViewController *lc = [[loginViewController alloc] init];
            self.window.rootViewController = lc;
            
            [self.window makeKeyAndVisible];
        }
    }];
    
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
