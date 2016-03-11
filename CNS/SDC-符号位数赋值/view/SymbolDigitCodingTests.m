//
//  SymbolDigitCodingTests.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "SymbolDigitCodingTests.h"

#import "SymbolAndDigit.h"

@interface SymbolDigitCodingTests ()

@property (nonatomic,strong) NSArray *imageNameArray;

@property (nonatomic,strong) NSMutableArray *modelArray;

@property (nonatomic,strong) SymbolAndDigit *sdView;

@end

@implementation SymbolDigitCodingTests



-(NSArray *)imageNameArray{

    if (!_imageNameArray) {
        self.imageNameArray = @[@"visualImage1",@"visualImage2",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage7",@"visualImage8"];
    }

    return _imageNameArray;
}

-(NSMutableArray *)modelArray{

    if (!_modelArray) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

-(void)getModelForCount:(NSInteger)count{
    for (int i = 0 ; i < count; i ++ ) {
     
        SymbolDigitsModel *model = [[SymbolDigitsModel alloc] init];
        
        NSMutableArray *ary = [self getSomeImageFromArray:[self.imageNameArray mutableCopy] withCount:8];
        
        model.ImageName_2 = ary[0];
        model.ImageName_3 = ary[1];
        model.ImageName_4 = ary[2];
        model.ImageName_5 = ary[3];
        model.ImageName_6 = ary[4];
        model.ImageName_7 = ary[5];
        model.ImageName_8 = ary[6];
        model.ImageName_9 = ary[7];
        
        [self.modelArray addObject:model];
    }
}

/**
 *  从一个数组中乱序得到一些元素
 *
 *  @param array 目标数组
 *  @param count 元素个数
 */
-(NSMutableArray *)getSomeImageFromArray:(NSMutableArray *)array withCount:(NSInteger)count{
    
    NSMutableArray *cotainArray = [NSMutableArray array];
    
    NSMutableArray *copyArray = [NSMutableArray arrayWithArray:array];
    
    if (count > array.count) {
        count = (int)array.count;
    }
    for (int i = (int)count ;i > 0 ;i -- ) {
        
        int a = arc4random()%i;
        
        [cotainArray addObject:copyArray[a]];
        
        [copyArray removeObjectAtIndex:a];
        
    }
    return cotainArray;
    
}

@end


