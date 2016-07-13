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
    
//    _isAnimation = YES;
    
    /**
     *  先判断是否是新的版本,  1.是新版本就进入新版界面. 要求登录 进入.....
     */
    
//    if ([self decideIsNewVisionCome]) {
//        /**
//         *  确定显示新版本的更新
//         */
//        
//        _isAnimation = NO;
//        WeakObject(self);
//        [self introduceNewVison:^{
//            
//            [selfWeak normalLogin];
//            
//        }];
//        
//        return YES;
//    
//    }

    [self normalLogin];
    
    
    /**
     *  推送
     */
    //iOS8.0以后，如果需要使用本地推送通知，需要得到用户许可  --- 这里是注册服务
    if (![application isRegisteredForRemoteNotifications]) {
        UIUserNotificationSettings * setting =
        [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert |
         UIUserNotificationTypeBadge |
         UIUserNotificationTypeSound
                                          categories:nil];
        [application registerUserNotificationSettings:setting];
        //注册远程推送通知
        [application registerForRemoteNotifications];
    }
    
    
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
                
                
                
            }
            if (isSuccess&&returnObject[@"user"]){
                
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


//-(void)firstVisit{
//    
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CNSgameHWMCD" object:nil];
//    [self normalLogin];
//}

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

//-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
//    const unsigned char *dataBuffer = (const unsigned char *)[deviceToken length];
//    
//    if (!dataBuffer) {
//        return;
//    }
//    
//    NSUInteger dataLength = [deviceToken length];
//    
//    NSMutableString *hexString = [NSMutableString stringWithCapacity:64];
//    
//    for (int i = 0; i < dataLength; ++i) {
//        [hexString appendString:[NSString stringWithFormat:@"%02x",(unsigned)dataBuffer[i]]];
//    }
//    NSLog(@"%@,leng%lu",hexString,hexString.length);
//}


/**
 *  copy 过来的代码;
 */

//- (void)application:(UIApplication *)application
//didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
//{
//    [self addDeviceToken:deviceToken];
//}
///* 保存deviceToken，并同步服务器上保存的deviceToken，以便能正确推送通知 */
//- (void)addDeviceToken:(NSData *)deviceToken
//{
//    NSString *key = @"DeviceToken";
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    //取出原来的deviceToken，进行比较
//    NSData *oldToken = [defaults objectForKey:key];
//    if ([oldToken isEqualToData:deviceToken]) {
//        //存入新的deviceToken
//        [defaults setObject:deviceToken forKey:key];
//        [defaults synchronize];
//        //发送网络请求到服务器，说明deviceToken发生了改变
//        [self sendDeviceTokenWithOldDeviceToken:oldToken newDeviceToken:deviceToken];
//    }
//}
///* 发送网络请求到服务器，说明deviceToken发生了改变，服务器那边也要同步改变 */
//- (void)sendDeviceTokenWithOldDeviceToken:(NSData *)oldToken newDeviceToken:(NSData *)newToken
//{
//    //发送到服务器，下面是服务器的一个接口
//    NSString *urlStr = @"";
//    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:urlStr];
//    //POST网络请求
//    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:url];
//    requestM.HTTPMethod = @"POST";
//    //POST请求的请求体
//    NSString *bodyStr = [NSString stringWithFormat:@"oldToken=%@&newToken=%@",oldToken,newToken];
//    requestM.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
//    //使用会话来发送网络请求
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask =
//    [session dataTaskWithRequest:requestM
//               completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
//                   if(!error){
//                       NSLog(@"Send Success !");
//                   } else {
//                       NSLog(@"Send Failure, error = %@",error.localizedDescription);
//                   }
//               }];
//    //网络请求任务启动
//    [dataTask resume];
//}
//
//
///* 收到远程推送通知时会调用 */
//- (void)application:(UIApplication *)application
//didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
//    NSString *title = @"远程推送通知";
//    NSString *msg = userInfo[@"msg"];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
//                                                    message:msg
//                                                   delegate:nil
//                                          cancelButtonTitle:@"取消"
//                                          otherButtonTitles:@"确定", nil];
//    [alert show];
//}

//-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
//    if (application.applicationState == UIApplicationStateInactive) {
//        //非活跃状态,手机锁屏,双击 home 键会进入这个状态.
//        completionHandler(UIBackgroundFetchResultNewData);
//    }else if (application.applicationState == UIApplicationStateBackground){
//            //应用程序在后台运行,例如点击 home 建进入后台等
//        completionHandler(UIBackgroundFetchResultNewData);
//    }else if (application.applicationState == UIApplicationStateActive){
//            //活跃状态,应用在前台运行时候就是这个状态
//        completionHandler(UIBackgroundFetchResultNewData);
//    }
//}

@end
