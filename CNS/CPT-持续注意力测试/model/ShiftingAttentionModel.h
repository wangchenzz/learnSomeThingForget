//
//  ShiftingAttentionModel.h
//  CNS
//
//  Created by Mac on 16/3/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ShifitingTestType) {
    ShifitingTestTypeColor  =  1,
    ShifitingTestTyoeForm
};

typedef NS_ENUM(NSInteger,ShifitingColorType) {
    ShifitingColorTypeRed  =  1,
    ShifitingColorTyoeGreen
};

typedef NS_ENUM(NSInteger,ShifitingFormType) {
    ShifitingFormTypeRound  =  1,
    ShifitingFormTypeSquare
};

/**
 *  设定每一次测试的测试要求
 *  参照体的颜色和形状以及左侧物体的颜色和形状
 *  由于左右两侧物体的颜色和形状是绝对相反的所有不需要保存右侧物体信息
 */

@interface ShiftingAttentionModel : NSObject

@property (nonatomic,assign) ShifitingTestType ShifitingTestType;


@property (nonatomic,assign) ShifitingColorType leftColorType;


@property (nonatomic,assign) ShifitingFormType leftFormType;


@property (nonatomic,assign) ShifitingColorType referenceColorType;


@property (nonatomic,assign) ShifitingFormType referenceFormType;



@end
