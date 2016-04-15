//
//  SymbolDigitsModel.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "SymbolDigitsModel.h"

@implementation SymbolDigitsModel



//nameArray;
//
//
//@property (nonatomic,retain) NSMutableArray *testArray;
//
//
//@property (nonatomic,retain) NSMutableArray *selectArray;

-(NSMutableArray *)nameArray{
    return [@[self.ImageName_2,self.ImageName_3,_ImageName_4,_ImageName_5,_ImageName_6,_ImageName_7,_ImageName_8,_ImageName_9] mutableCopy];
}

-(NSMutableArray *)testArray{
    return [@[self.testImageName_2,self.testImageName_3,self.testImageName_4,self.testImageName_5,self.testImageName_6,self.testImageName_7,self.testImageName_8,self.testImageName_9] mutableCopy];
}

-(NSMutableArray *)selectArray{
    return [@[self.selectNo_2,self.selectNo_3,self.selectNo_4,self.selectNo_5,self.selectNo_6,self.selectNo_7,self.selectNo_8,self.selectNo_9] mutableCopy];
}
@end
