//
//  animationScroll.h
//  CNS
//
//  Created by Mac on 16/4/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>
@class animationScroll;

@protocol animationScrollDelegate <NSObject>

@required

-(UIImage*)animationScroll:(animationScroll *)scroll imageForIndex:(NSInteger)index;

-(NSString*)animationScroll:(animationScroll *)scroll textForIndex:(NSInteger)index;

-(NSInteger)numberOfImageInScrollView:(animationScroll*)scroll;

@optional

-(void)animationScroll:(animationScroll *)scroll didClickInIndex:(NSInteger)index;

@end


@interface animationScroll : UIImageView

@property (nonatomic,weak) id <animationScrollDelegate> delegate;

+(instancetype)getScroll;

-(void)showAnimation;

@end
