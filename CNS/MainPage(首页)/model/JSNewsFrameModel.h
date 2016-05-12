//
//  JSNewsFrameModel.h
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSNewsModel.h"

#define titleFont [UIFont boldSystemFontOfSize:24]

#define contentFont JSFont(18)


#define TruecontentFont JSFont(16)

@interface JSNewsFrameModel : NSObject


@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *author;

@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) NSString *createtime;

@property (nonatomic,copy) NSString *loginName;

@property (nonatomic,copy) NSString *images;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *ctr;

@property (nonatomic,copy) NSString *num;

@property (nonatomic,assign) CGRect titleRect;

@property (nonatomic,assign) CGRect authorRect;

@property (nonatomic,assign) CGRect creatTimeRect;

@property (nonatomic,assign) CGRect contentRect;

@property (nonatomic,retain) NSMutableArray *imageRectArray;

@property (nonatomic,retain) NSMutableArray *imageArray;

@property (nonatomic,assign) CGFloat totalHeight;


-(instancetype)initWithModel:(JSNewsModel *)model;

@end
