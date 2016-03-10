//
//  JSPresentBut.h
//  1.5-2015
//
//  Created by Mac on 16/2/22.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSPresentBut : UIView


@property (nonatomic,weak) UIButton *leftButton;


@property (nonatomic,weak) UIButton *rightButton;

/**
 *  显示 button 的方法;
 */

/**
 *
 */

-(void)show;

/**
 *  初始化的类方法
 *
 *  @return 一个实例 建议使用这个
 */
+(instancetype)flash;

@end
