//
//  INetworking.h
//  iTestAFNetworking
//
//  Created by administrator on 15/11/23.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString * const basicUrlStr;

extern NSString * const loginUrl;

extern NSString * const loginUrlForVisitor;

extern NSString * const newsUrl;

extern NSString * const DetailNews;

extern NSString * const LikeAddUrl;

extern NSString * const addComment;

extern NSString * const getQustType;

extern NSString * const addRecord ;

extern NSString * const getRecord;

extern NSString * const getCard;

extern NSString * const getCardById;

extern NSString * const addPlunge;


extern NSString * const addAnser;

extern NSString * const addCard;

extern NSString * const getPersonBBs;

extern NSString * const getLeavemsgByPage;

extern NSString * const addSug;


@interface INetworking : NSObject

@property (nonatomic,copy) NSString *ipstr;

//下载失败的block

@property (nonatomic,copy) void(^errorDolowdToDo)();

+(INetworking*)shareNet;


-(void)GET:(NSString*)URLString withParmers:(NSDictionary *)parmers do:(void(^)(id returnObject,BOOL isSuccess))myblok;

-(void)POST:(NSString*)object parameters:(id)parameters do:(void(^)(id returnObject,BOOL isSuccess))myblok;

@end
