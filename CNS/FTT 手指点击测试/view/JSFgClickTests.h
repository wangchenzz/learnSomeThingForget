//
//  JSFgClickTests.h
//  CNS
//
//  Created by Mac on 16/3/7.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSFgClickTests;
@protocol JSFgClickTestsDelegate <NSObject>

@required
/**
 *  总共测试多少次
 *
 *  @param test ..
 *
 *  @return 次数
 */
- (NSInteger)numberOfTestsCountInJSFgClickTests:(JSFgClickTests *)test;

/**
 *  每次测试的时间
 *
 *  @param test  ..
 *  @param count 测试的编号
 *
 *  @return 时间长度
 */
- (NSInteger)JSFgClickTests:(JSFgClickTests *)test timeTravelForCount:(NSInteger)count;

@optional

/**
 *  所有测试完成之后的回调
 *
 *  @param test ...
 */
- (void)DidFinsihAllTest:(JSFgClickTests *)test;

/**
 *  每个小测试的得分
 *
 *  @param test  ...
 *  @param count 得分
 */

- (void)JSFgClickTests:(JSFgClickTests *)test clickCountForCurrentCount:(NSInteger)currentCount andClickCount:(NSInteger)clickCount;

/**
 *  每个小测试的提示文字
 *
 *  @param test  ...
 *  @param Count 测试编号
 *
 *  @return 标题
 */

- (NSString*)JSFgClickTests:(JSFgClickTests *)test titleForTipsInCount:(NSInteger)Count;

@end

@interface JSFgClickTests : UIView

@property (nonatomic,weak) id <JSFgClickTestsDelegate> delegate;


-(void)show;


@end
