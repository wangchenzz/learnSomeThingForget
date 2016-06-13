//
//  JSNewsFrameModel.h
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSNewsModel.h"

#define titleFont [UIFont boldSystemFontOfSize:18]

#define contentFont JSFont(13)


#define TruecontentFont JSFont(16)

@interface JSNewsFrameModel : NSObject


/**
 *  是否点过赞
 */
@property (nonatomic,assign) BOOL isLike;


/**
 *  评论次数
 */
@property (nonatomic,copy) NSString *commentNum;

/**
 *  点赞次数
 */
@property (nonatomic,copy) NSString *likeNum;


/**
 *  内容模型
 */
@property (nonatomic,strong) JSNewsModel *lmodel;

/**
 *  标题位置
 */
@property (nonatomic,assign) CGRect titleRect;

/**
 *  作者位置
 */
@property (nonatomic,assign) CGRect authorRect;

/**
 *  时间位置
 */
@property (nonatomic,assign) CGRect creatTimeRect;

/**
 *  正文位置
 */
@property (nonatomic,assign) CGRect contentRect;

/**
 *  图片位置数组
 */
@property (nonatomic,retain) NSMutableArray *imageRectArray;

/**
 *  图片数组
 */
@property (nonatomic,retain) NSMutableArray *imageArray;

/**
 *  评论内容数组
 */
@property (nonatomic,retain) NSMutableArray *commentArray;

/**
 *  评论按钮位置
 */
@property (nonatomic,assign) CGRect commentButRect;

/**
 *  喜欢按钮位置
 */
@property (nonatomic,assign) CGRect likeTooButRect;

/**
 *  cell 总高度
 */
@property (nonatomic,assign) CGFloat totalHeight;


-(instancetype)initWithModel:(JSNewsModel *)model;

@end
