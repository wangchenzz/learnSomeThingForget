//
//  JSLanguageAttentionTests.h
//  CNS
//
//  Created by Mac on 16/3/2.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSLanguageAttentionModel.h"
@class JSLanguageAttentionTests;

@protocol JSLanguageAttentionTestsDelegate <NSObject>
@optional

/**
 *  展示完词语的回调
 *
 *  @param test  测试
 *  @param model 模型数据
 */
-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsiShowWord:(JSLanguageAttentionModel *)model;

/**
 *  测试的点击回调
 *
 *  @param test  测试
 *  @param model 模型
 *  @param count 轮次词语
 */
-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didClickScreen:(JSLanguageAttentionModel *)model withCurrentCount:(NSInteger)count;

/**
 *  测试完成障碍单词后的回调
 *
 *  @param test  ...
 *  @param model 数据模型
 */

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsihTests:(JSLanguageAttentionModel *)model;
@end


@interface JSLanguageAttentionTests : UIView

@property (nonatomic,weak) id <JSLanguageAttentionTestsDelegate> delegate;



/**
 *  开始测试的方法, 此处创建定时器等等;
 */
-(void)show;

-(void)showTestWords;

@end
