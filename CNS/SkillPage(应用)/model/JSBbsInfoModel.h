//
//  JSBbsInfoModel.h
//  CNS
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>


#define iconFont JSFont(12)

@interface JSBbsInfoModel : NSObject




/**
 *  浏览次数
 */
@property (nonatomic,copy) NSString *ctr;


/**
 *  浏览次数大小
 */
@property (nonatomic,assign) CGRect ctrRect;

/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *  正文;
 */
@property (nonatomic,copy) NSString *content;
/**
 *  创建时间
 */
@property (nonatomic,copy) NSString *createtime;

/**
 *  类型
 */
@property (nonatomic,copy) NSString *type;
/**
 *  评论次数
 */
@property (nonatomic,copy) NSString *pCount;

/**
 *  评论大小
 */
@property (nonatomic,assign) CGRect pCountRect;

/**
 *  评论 id(唯一标识)
 */
@property (nonatomic,copy) NSString *num;

/**
 *  发帖人 name
 */
@property (nonatomic,copy) NSString *loginName;

/**
 *  前面的作为了 nickName;
 */
@property (nonatomic,copy) NSString *tureLoginName;

/**
 *  发帖人头像 url 的部分 string;
 */

@property (nonatomic,copy) NSString *headerImageUrlStr;

@end
