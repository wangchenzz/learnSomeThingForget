//
//  JSVisualAttentionModel.h
//  CNS
//
//  Created by Mac on 16/3/4.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSVisualAttentionModel : NSObject

/**
 *  本测试实际需要计算 即时正确不点 和延时正确不点, 实际代码中难以直接得到.
 */

/**
 *  含干扰项的数组;
 */
@property (nonatomic,retain) NSMutableArray *theTestsAllImageArray;

/**
 *  第一次展示的正确的数组;
 */
@property (nonatomic,retain) NSMutableArray *theRightImageArray;

/**
 *  即时正确的点击次数
 */
@property (nonatomic,assign) NSInteger immediateRightReaction;

/**
 *  即时错误点击次数
 */
@property (nonatomic,assign) NSInteger immediateWrongReaction;

/**
 *  延时正确点击次数
 */
@property (nonatomic,assign) NSInteger delayedRightReaction;

/**
 *  延时错误点击次数
 */
@property (nonatomic,assign) NSInteger delayedWrongReaction;

@end
