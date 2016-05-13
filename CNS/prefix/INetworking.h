//
//  INetworking.h
//  iTestAFNetworking
//
//  Created by administrator on 15/11/23.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface INetworking : NSObject

#define loginUrl @"http://www.xxlccw.cn/SSM/user/getLogin"


#define newsUrl @"http://www.xxlccw.cn/SSM/news/getNewsByType"


#define DetailNews @"http://www.xxlccw.cn/SSM/news/selectNewById"

#define LikeAddUrl @"http://www.xxlccw.cn/SSM/news/addZan"

@property (nonatomic,copy) NSString *ipstr;


//下载失败的block

@property (nonatomic,copy) void(^errorDolowdToDo)();

+(INetworking*)shareNet;


-(void)GET:(NSString*)URLString withParmers:(NSDictionary *)parmers do:(void(^)(id returnObject,BOOL isSuccess))myblok;

-(void)POST:(NSString*)object parameters:(id)parameters do:(void(^)(id returnObject,BOOL isSuccess))myblok;

@end
