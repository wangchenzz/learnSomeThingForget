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


static NSString * const VuserName = @"dawang";



static NSString * const VpassWord = @"woyiwei";


@interface AppDelegate ()

@property (nonatomic,assign) BOOL isAnimation;

@property (nonatomic,retain) JSTabBarController *mainViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _isAnimation = YES;
    
    /**
     *  先判断是否是新的版本,  1.是新版本就进入新版界面. 要求登录 进入.....
     */
    
    if ([self decideIsNewVisionCome]) {
        /**
         *  确定显示新版本的更新
         */
        
        _isAnimation = NO;
        WeakObject(self);
        [self introduceNewVison:^{
            
            [selfWeak normalLogin];
            
        }];
        
        return YES;
    
    }

    [self normalLogin];
    
    return YES;
}

/**
 *  登录流程;
 */
-(void)normalLogin{
    [self LoginInSuccess:^{
        
        /**
         *  登录成功就不用管
         */
        
        [self loginInAndBegin];
        
    } failure:^{
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        [[INetworking shareNet] GET:loginUrlForVisitor withParmers:dic do:^(id returnObject, BOOL isSuccess) {
            
            if (isSuccess&&returnObject[@"msg"]) {
                
            }else if (isSuccess&&returnObject[@"user"]){
                
                NSDictionary *dic = returnObject[@"user"];
                
                NSString *personToken = dic[@"token"];
                NSString *loginName = dic[@"loginName"];
                NSString *mobile = dic[@"mobile"];
                NSString *img = dic[@"img"];
                NSString *nickName = dic[@"nickName"];
                
                [[NSUserDefaults standardUserDefaults] setObject:personToken forKey:@"token"];
                [[NSUserDefaults standardUserDefaults] setObject:loginName forKey:@"loginName"];
                [[NSUserDefaults standardUserDefaults] setObject:mobile forKey:@"mobile"];
                [[NSUserDefaults standardUserDefaults] setObject:img forKey:@"img"];
                [[NSUserDefaults standardUserDefaults] setObject:nickName forKey:@"nickName"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [self loginInAndBegin];
            }else{
                /** lately i been ,i been losing sleep*/
                /** i could lie ,coule lie ,could lie*/
                /** i feel something so right but doing the wrong thing*/
                /** old ,but not that old*/
                /** young ,but not that bold*/
                
                /** 你一路向北,离开讲理的世界.*/
            }
        }];
    }];

}

/**
 *  显示主页
 */
-(void)loginInAndBegin{
    self.window.rootViewController = self.mainViewController;
    
    [self.window makeKeyAndVisible];
    
    if (_isAnimation) {
        [self animationComeOn];
    }
}

/**
 *  查看是否登录过
 *
 *  @param success 登陆过的操作
 *  @param failure 未登录的操作
 */
-(void)LoginInSuccess:(void (^)())success failure:(void (^)())failure{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
    
    NSString *tokenStr = dic[@"token"];
    
    
    if ([tokenStr isEqualToString:@"null"] || !tokenStr.length) {
        failure();
        
    }else{
//        __weak __typeof__(self) weakSelf = self;
        [[INetworking shareNet] GET:loginUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
            NSDictionary *dic = (NSDictionary *)returnObject;
            if (isSuccess && [dic[@"msg"]isEqualToString:@"1"]) {
                success();
                
            }else{
                failure();
            }
        }];
    }
}




///Users/Mac/Desktop/ios_IM_sdk_V3.1.3

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
        
        if (_isAnimation) {
            [self animationComeOn];
        }
        
    }else{
        
        __weak __typeof__(self) weakSelf = self;
        [[INetworking shareNet] GET:loginUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
            NSDictionary *dic = (NSDictionary *)returnObject;
            if (isSuccess && [dic[@"msg"]isEqualToString:@"1"]) {
                
                weakSelf.window.rootViewController = self.mainViewController;
                
                [weakSelf.window makeKeyAndVisible];
                
                if (_isAnimation) {
                    [self animationComeOn];
                }
                
            }else{
                
                [[NSUserDefaults standardUserDefaults]setValue:@"null" forKey:@"token"];
                
                loginViewController *lc = [[loginViewController alloc] init];
                
                weakSelf.window.rootViewController = lc;
                
                [weakSelf.window makeKeyAndVisible];
                
                if (_isAnimation) {
                    [self animationComeOn];
                }
            }
        }];
    }
}


-(void)firstVisit{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CNSgameHWMCD" object:nil];
    [self normalLogin];
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

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window{
    
    /**
     *  禁止 iPad 横屏;
     */
    return UIInterfaceOrientationMaskPortrait;
    
}

-(void)applicationShouldRequestHealthAuthorization:(UIApplication *)application{

    

}

@end
