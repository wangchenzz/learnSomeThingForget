//
//  SymbolDigitsModel.h
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SymbolDigitsModel : NSObject

/**
 *  按顺序对应数组 '2'
 */
@property (nonatomic,copy) NSString *ImageName_2;

/**
 *  按顺序对应数组 '3'
 */
@property (nonatomic,copy) NSString *ImageName_3;

/**
 *  按顺序对应数组 '4'
 */
@property (nonatomic,copy) NSString *ImageName_4;

/**
 *  按顺序对应数组 '5'
 */
@property (nonatomic,copy) NSString *ImageName_5;

/**
 *  按顺序对应数组 '6'
 */
@property (nonatomic,copy) NSString *ImageName_6;

/**
 *  按顺序对应数组 '7'
 */
@property (nonatomic,copy) NSString *ImageName_7;

/**
 *  按顺序对应数组 '8'
 */
@property (nonatomic,copy) NSString *ImageName_8;

/**
 *  按顺序对应数组 '9'
 */
@property (nonatomic,copy) NSString *ImageName_9;



/**
 *  测试数据, 封装在一个模型里面.
 */
/**
 *  按顺序每张图的名字都有 选择的数字也存在.  现在需要计算那个可以使用
 
 */
@property (nonatomic,copy) NSString *testImageName_2;

@property (nonatomic,copy) NSString *selectNo_2;

@property (nonatomic,copy) NSString *testImageName_3;

@property (nonatomic,copy) NSString *selectNo_3;

@property (nonatomic,copy) NSString *testImageName_4;

@property (nonatomic,copy) NSString *selectNo_4;

@property (nonatomic,copy) NSString *testImageName_5;

@property (nonatomic,copy) NSString *selectNo_5;

@property (nonatomic,copy) NSString *testImageName_6;

@property (nonatomic,copy) NSString *selectNo_6;

@property (nonatomic,copy) NSString *testImageName_7;

@property (nonatomic,copy) NSString *selectNo_7;

@property (nonatomic,copy) NSString *testImageName_8;

@property (nonatomic,copy) NSString *selectNo_8;

@property (nonatomic,copy) NSString *testImageName_9;

@property (nonatomic,copy) NSString *selectNo_9;

@property (nonatomic,retain) NSMutableArray *nameArray;


@property (nonatomic,retain) NSMutableArray *testArray;


@property (nonatomic,retain) NSMutableArray *selectArray;

@end
