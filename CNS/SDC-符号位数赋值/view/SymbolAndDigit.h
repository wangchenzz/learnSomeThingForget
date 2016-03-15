//
//  SymbolAndDigit.h
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiamandsView.h"

#import "SymbolDigitsModel.h"

#import "JSKeyBoardView.h"

typedef NS_ENUM(NSInteger,SymbolAndDigitStyle){
    SymbolAndDigitStyleTest  =  1 ,
    SymbolAndDigitStyleShow


};

@interface SymbolAndDigit : UIView

@property (nonatomic,assign) SymbolDigitsModel *model;


@property (nonatomic,assign) SymbolAndDigitStyle style;


@property (nonatomic,strong)DiamandsView *view_number2;


@property (nonatomic,strong)DiamandsView *view_number3;


@property (nonatomic,strong)DiamandsView *view_number4;


@property (nonatomic,strong)DiamandsView *view_number5;


@property (nonatomic,strong)DiamandsView *view_number6;


@property (nonatomic,strong)DiamandsView *view_number7;


@property (nonatomic,strong)DiamandsView *view_number8;


@property (nonatomic,strong)DiamandsView *view_number9;

-(instancetype)initWithStyle:(SymbolAndDigitStyle)style;


@property (nonatomic,strong) NSMutableArray *textFileArray;

@end
