//
//  JSUserManager.h
//  CNS
//
//  Created by Mac on 16/6/2.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSUserManager : NSObject

+(instancetype)shareManager;

-(NSMutableDictionary *)getUserDic;

@end
