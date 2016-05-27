//
//  JSComentModel.h
//  CNS
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSComentModel : NSObject

#define titleCommentFont JSFont(16)

#define timeFont JSFont(14)

#define contentCommentFont JSFont(15)


@property (nonatomic,copy) NSString *loginName;


@property (nonatomic,copy) NSString *creatTime;


@property (nonatomic,copy) NSString *contentMent;


@property (nonatomic,copy) NSString *HeadImageUrlStr;


@property (nonatomic,assign) CGRect headImageRect;


@property (nonatomic,assign) CGRect timeLabelRect;


@property (nonatomic,assign) CGRect nameLabelRect;


@property (nonatomic,assign) CGRect contentLabelRect;


@property (nonatomic,assign) CGFloat totalHeight;


+(instancetype)modelForDic:(NSDictionary *)dic;
@end
