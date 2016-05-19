//
//  ShiftingAttentionTests.h
//  CNS
//
//  Created by Mac on 16/3/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShiftingAttentionTests;

@protocol  ShiftingAttentionTestsDelegate <NSObject>

@optional

-(void)ShiftingAttentionTests:(ShiftingAttentionTests*)test clickInCount:(NSInteger)count clickIsRight:(BOOL)isRight andClickPTime:(float)timetravel;

-(void)ShiftingAttentionTestsDidFinsih:(ShiftingAttentionTests*)test;

@end

@interface ShiftingAttentionTests : UIView

@property (nonatomic,weak) id <ShiftingAttentionTestsDelegate> delegate;
+(instancetype)test;
-(void)beginOneTest;

@end

