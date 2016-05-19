//
//  starView.h
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface starView : UIView

+(instancetype)star;

@property (nonatomic,assign) NSInteger starValue; //default 0 ~~ 0-5 ~~

@property (nonatomic,retain) UIImageView *star1;

@property (nonatomic,retain) UIImageView *star2;

@property (nonatomic,retain) UIImageView *star3;

@property (nonatomic,retain) UIImageView *star4;

@property (nonatomic,retain) UIImageView *star5;

@property (nonatomic,retain) NSMutableArray *starArray;


@end
