//
//  AppDelegate.m
//  CNS
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDelegate+lunchAnimation.h"

#import "JSTabBarController.h"

#import "loginViewController.h"

#import "AppDelegate+NewVision.h"

#import "JSNewVisionViewControler.h"

@interface AppDelegate ()

@property (nonatomic,retain) JSTabBarController *mainViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    if ([self decideIsNewVisionCome]) {
        /**
         *  确定显示新版本的更新
         */
        JSNewVisionViewControler *vc = [[JSNewVisionViewControler alloc] init];
        
        self.window.rootViewController =vc;
        
        
        [self.window makeKeyAndVisible];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(firstVisit) name:@"CNSgameHWMCD" object:nil];
        
        [self animationComeOn];
        
        return YES;
    }
    
    
    [self decideVC];
    
    [self animationComeOn];
    
    return YES;
}


-(JSTabBarController *)mainViewController{
    if (!_mainViewController) {
        _mainViewController = [[JSTabBarController alloc] init];
        
    }
    return _mainViewController;
}

-(void)decideVC{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
    
    
    if ([dic[@"token"] isEqualToString:@"null"]) {
        
        loginViewController *lc = [[loginViewController alloc] init];
        
        self.window.rootViewController = lc;
        
        [self.window makeKeyAndVisible];
    
    }else{
        
    [[INetworking shareNet] GET:loginUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        NSDictionary *dic = (NSDictionary *)returnObject;
        if (isSuccess && [dic[@"msg"]isEqualToString:@"1"]) {
            
            self.window.rootViewController = self.mainViewController;
            
            [self.window makeKeyAndVisible];
        }else{
            
            [[NSUserDefaults standardUserDefaults]setValue:@"null" forKey:@"token"];
            
            loginViewController *lc = [[loginViewController alloc] init];
            
            self.window.rootViewController = lc;
            
            [self.window makeKeyAndVisible];
        }
    }];
    }
}


-(void)firstVisit{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CNSgameHWMCD" object:nil];
    [self decideVC];
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
