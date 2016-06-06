//
//  ContinuousPerformanceTests.h
//  CNS
//
//  Created by Mac on 16/3/31.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContinuousPerformanceTests;


@protocol ContinuousPerformanceTestsDelegate <NSObject>

@optional

-(void)ContinuousPerformanceTests:(ContinuousPerformanceTests *)test didClickWithCount:(NSInteger)count andWords:(NSString*)word andTimeTravel:(float)time;

-(void)ContinuousPerformanceTests:(ContinuousPerformanceTests *)test didFinishWithTime:(float)time;

@end

@interface ContinuousPerformanceTests : testBaseView

@property (nonatomic,weak) id <ContinuousPerformanceTestsDelegate> delegate;
+(instancetype)test;
-(void)showMeTheTest;

@end
