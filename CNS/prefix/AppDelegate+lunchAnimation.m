//
//  AppDelegate+lunchAnimation.m
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "AppDelegate+lunchAnimation.h"


static NSString * const Setp1key = @"animationKey";

static NSString * const Setp2key = @"animationKey";

@implementation AppDelegate (lunchAnimation)

-(void)animationComeOn{
    [self doStep1];
}

-(void)doStep1{
    
    UIImageView *mainImageView = [[UIImageView alloc] init];
    
    mainImageView.tag = 1;
    
    mainImageView.image = [UIImage imageNamed:@"lunchBackRound"];
    
    [mainImageView setFrame:CGRectMake(0, 0, JSFrame.size.width * 3, JSFrame.size.height)];
    
    UIWindow *windows = [[UIApplication sharedApplication] keyWindow];
    
    mainImageView.center = windows.center;
    
    [windows addSubview:mainImageView];
    
//    [windows insertSubview:mainImageView atIndex:0];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    
    animation.delegate = self;
    
    mainImageView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    animation.fromValue = [NSNumber numberWithInteger:300];
    
    animation.toValue = [NSNumber numberWithInteger:150];;
    
    animation.duration = 0.8;
    
    animation.repeatCount = 1;
    
    animation.autoreverses = NO;
    
    mainImageView.userInteractionEnabled = YES;
    
    animation.removedOnCompletion = NO;

    [animation setValue:@"step1" forKey:Setp1key];
    
    animation.fillMode = kCAFillModeBoth;

    [mainImageView.layer addAnimation:animation forKey:nil];
    
    
}

-(void)doStep2{
    /**
     出现图像的过渡动画:
     */
    UIImageView *wordsImageView = [[UIImageView alloc] init];
    
    wordsImageView.tag = 2 ;
    
    UIImage * image = [UIImage imageNamed:@"lunchWords"];
    
    CGRect bounds = {{0,0},image.size};
    
    wordsImageView.bounds = bounds;
    
    CABasicAnimation *imageAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    
    imageAnimation.removedOnCompletion = YES;
    
    imageAnimation.repeatCount = 1;
    
    imageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    imageAnimation.duration = 1.0f;
    
    [wordsImageView.layer addAnimation:imageAnimation forKey:nil];
    
    
    wordsImageView.image = image;

    /**
     *  图像出现之后;先图像上移
     */
    CABasicAnimation *imageMoveAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    
    [[UIApplication sharedApplication].keyWindow addSubview:wordsImageView];
    
    wordsImageView.x = 500;
    
    wordsImageView.y = 100;
    
    imageMoveAnimation.fromValue = @220;
    
    imageMoveAnimation.toValue = @130;
    
    imageMoveAnimation.duration = 1.5;
    
    imageMoveAnimation.repeatCount = 1;
    
    imageMoveAnimation.autoreverses = NO;
    
    imageMoveAnimation.removedOnCompletion = NO;
    
    
    imageMoveAnimation.fillMode = kCAFillModeBoth;
    
    imageMoveAnimation.delegate = self;
    
    /**
     *  组合起来
     */
    //5700
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    group.animations = @[imageMoveAnimation,imageAnimation];
    
    group.duration = 0.8f;
    
    group.repeatCount = 1;
    
    group.delegate = self;
    
    [imageMoveAnimation setValue:@"step2" forKey:Setp2key];
    
    [wordsImageView.layer addAnimation:imageMoveAnimation forKey:nil];
    

}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    UIWindow *key = [UIApplication sharedApplication].keyWindow;
    
    UIView *view1 = [key viewWithTag:1];
    
    UIView *view2 = [key viewWithTag:2];
    
    
    
    if ([[anim valueForKey:Setp1key] isEqualToString:@"step1"]) {
        
        [self doStep2];
    
    }
    if ([[anim valueForKey:Setp2key] isEqualToString:@"step2"]) {
        
        [view1 removeFromSuperview];
        [view2 removeFromSuperview];
    
    }
}



@end