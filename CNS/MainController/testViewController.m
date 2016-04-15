//
//  test.m
//  CNS
//
//  Created by Mac on 16/3/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "testViewController.h"

#import "StroopTests.h"

#import "ShiftingAttentionTests.h"

#import "ContinuousPerformanceTests.h"

@interface testViewController ()<ShiftingAttentionTestsDelegate>

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    StroopTests *test = [StroopTests test];
    
    test.frame = self.view.bounds;
    
    [self.view addSubview:test];
    
    [test showComplication];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
}

-(void)ShiftingAttentionTests:(ShiftingAttentionTests *)test clickInCount:(NSInteger)count clickIsRight:(BOOL)isRight andClickPTime:(float)timetravel{

    JSLog(@"%ld______%d_______%f",(long)count,isRight,timetravel);
    
}
@end
