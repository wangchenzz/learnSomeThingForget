//
//  ShowSegModel.h
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#define nameFont JSFont(17)

#define contentFont JSFont(14)

#define timeFont JSFont(14)



@interface ShowSegModel : NSObject

@property (nonatomic,copy) NSString *userNickName;


@property (nonatomic,copy) NSString *headerImageNStr;


@property (nonatomic,copy) NSString *segContent;


@property (nonatomic,copy) NSString *creatTime;

@property (nonatomic,assign) CGRect nameRect;

@property (nonatomic,assign) CGRect imageRect;

@property (nonatomic,assign) CGRect contentRect;

@property (nonatomic,assign) CGRect timeRect;


@property (nonatomic,assign) CGFloat totalHeight;


-(instancetype)initWithDic:(NSDictionary *)dic;

@end
