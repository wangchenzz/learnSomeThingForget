//
//  answerModel.h
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface answerModel : NSObject
#define commentContentFont JSFont(16)

#define anserContentFont JSFont(16)

@property (nonatomic,copy) NSString *commentContent;

@property (nonatomic,copy) NSString *commentCreattime;

@property (nonatomic,copy) NSString *commentLoginName;

/**
 *  
 */

@property (nonatomic,copy) NSString *answerContent;

@property (nonatomic,copy) NSString *answerCreatTime;

@property (nonatomic,copy) NSString *answerLoginName;




@property (nonatomic,assign) CGRect commentContentRect;

@property (nonatomic,assign) CGRect commentCreattimeRect;

@property (nonatomic,assign) CGRect commentLoginNameRect;

@property (nonatomic,assign) CGRect answerRect;

@property (nonatomic,retain) NSMutableAttributedString *answerString;

@property (nonatomic,assign) CGFloat commentTotalHeight;

@property (nonatomic,assign) CGFloat answerTotalHeight;


/**
 *  是否被回答过
 */
@property (nonatomic,assign) BOOL isAnswer;


-(void)getFrame;

@end
