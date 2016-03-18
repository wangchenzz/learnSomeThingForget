//
//  StroopTests.h
//  CNS
//
//  Created by Mac on 16/3/14.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  斯特鲁普测试. 关于颜色反差的. 本测试一共分为三个部分--
 
 1.简单反应
 2.正确复杂反应
 3.正确错色反应
 

 */


typedef NS_ENUM(NSInteger,StroopTestType){
    StroopTestsTypeSimplify  =  1,
    StroopTestsTypeComplication ,
    StroopTestsTypeInContrast
};
@interface StroopTests : UIView


/**
 *  简单测试
 */
-(void)showSimplify;

/**
 *  正确复杂反应
 */
-(void)showComplication;


/**
 *  颜色差异反应
 */
-(void)showColorInContrast;


@end




