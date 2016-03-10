//
//  JSVisualAttentionTests.h
//  CNS
//
//  Created by Mac on 16/3/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSVisualAttentionTests;

@class JSVisualAttentionModel;

@protocol  JSVisualAttentionTestsDelegate <NSObject>

@optional


/**
 *  展示完需要记住的图片时候的回调
 *
 *  @param tests ...
 *  @param model 模型
 */
-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)tests didFinishShowRightImage:(JSVisualAttentionModel *)model;

/**
 *  测试的点击回调
 *
 *  @param test  测试
 *  @param model 模型
 *  @param count 轮次图片
 */
-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didClickScreen:(JSVisualAttentionModel *)model withCurrentCount:(NSInteger)count;

/**
 *  展示了所有图片后的回调
 *
 *  @param test  ..
 *  @param model 模型
 */

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didFinsihTests:(JSVisualAttentionModel *)model;


@end

@interface JSVisualAttentionTests : UIView

@property (nonatomic,weak) id<JSVisualAttentionTestsDelegate> delegate;

-(void)show;

-(void)showTests;

@end
