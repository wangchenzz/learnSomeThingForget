//
//  animationScroll.m
//  CNS
//
//  Created by Mac on 16/4/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "animationScroll.h"

@interface animationScroll ()

@property (nonatomic,assign) NSInteger currentIndex;

@property (nonatomic,assign) NSInteger numberOfCount;

@property (nonatomic,retain) UILabel *tipsLabel;

@end

@implementation animationScroll



-(instancetype)init{
    if (self = [super init]) {
        self.currentIndex = 0;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage)];
        
        [self addGestureRecognizer:tap];
        
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

+(instancetype)getScroll{
    return [[self alloc]init];
}

-(void)showAnimation{

    self.image = [self.delegate animationScroll:self imageForIndex:self.currentIndex];
    
    UIImageView *blackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.height - 40, self.width, 40)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, self.width, 40)];
    
    [titleLabel setTextColor:[UIColor whiteColor]];
    
    titleLabel.text = [self.delegate animationScroll:self textForIndex:self.currentIndex];
    
    [blackView addSubview:titleLabel];
    
    self.tipsLabel = titleLabel;
    
    blackView.image = [UIImage imageNamed:@"black"];
    
    [self addSubview:blackView];
    
    NSTimer *actionTimer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(animationOn) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:actionTimer forMode:NSRunLoopCommonModes];
}

-(NSInteger)numberOfCount{
    return [self.delegate numberOfImageInScrollView:self];
}

-(void)animationOn{
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.8f;
    transition.type = @"cube";//rippleEffect cude suckEffect oglFlip pageCurl pageUnCurl cameraIrisHollowOpen cameraIrisHollowClose
    transition.subtype = @"fromRight";//type为fade的时候subtype无效
    
    [self.layer addAnimation:transition forKey:@"animation"];

    self.currentIndex ++;
    
    if (self.currentIndex >= [self.delegate numberOfImageInScrollView:self] ) {
        self.currentIndex = 0;
    }
    
    self.image = [self.delegate animationScroll:self imageForIndex:self.currentIndex];
    self.tipsLabel.text = [self.delegate animationScroll:self textForIndex:self.currentIndex];
}


-(void)clickImage{

    if ([self.delegate respondsToSelector:@selector(animationScroll:didClickInIndex:)]) {
        [self.delegate animationScroll:self didClickInIndex:self.currentIndex];
    }
}


@end
