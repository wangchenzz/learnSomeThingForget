//
//  StroopTests.m
//  CNS
//
//  Created by Mac on 16/3/14.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "StroopTests.h"

#import "StroopModel.h"

@interface StroopTests ()

/**
 *  显示词语的 label;
 */
@property (nonatomic,strong) UILabel *showWordsLabel;

/**
 *  显示词语的 label 的字体颜色;
 */
@property (nonatomic,retain) UIColor *labelTextColor;

/**
 *  用来提示的 label;
 */
@property (nonatomic,strong) UILabel *tipsLabel;

/**
 *  用来计时的定时器;
 */
@property (nonatomic,strong) NSTimer *timeTimer;

/**
 *  用来控制更新 label 的定时器;
 */
@property (nonatomic,strong) NSTimer *actionTimer;


/**
 *  记录经过了多少时间
 */
@property (nonatomic,assign) float timeTravel;

/**
 *  当前所进行的测试状态
 */
@property (nonatomic,assign) StroopTestType StroopTestType;

/**
 *  1... 需要规定每个字显示多久;
    2... 过多久会更新一次 label;   默认显示的时间为 1~2s 时间.   一二点为同一属性.
    3... 模型构造;
 
    考虑之后 准备放置在一个类里面,供应调用,  模型数据存放于数组之中, 一共设置三个数组;
 */


/**
 *  存放简单测试的模型;
 */
@property (nonatomic,strong) NSMutableArray *SimplifyModelArray;

/**
 *  存放复杂测试的模型;
 */
@property (nonatomic,strong) NSMutableArray *ComplicationModelArray;

/**
 *  存放异色测试的模型;
 */
@property (nonatomic,strong) NSMutableArray *ColorInContrastModelArray;


@property (nonatomic,strong) NSArray *colorArray;

@property (nonatomic,strong) NSArray *textArray;

@end

@implementation StroopTests

-(instancetype)init{
    if (self = [super init]) {
        
        [self setUpInfo];
        
    }
    return self;
}

-(NSArray *)colorArray{

    if (!_colorArray) {
        _colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor blackColor],[UIColor yellowColor],[UIColor orangeColor]];
    }
    return _colorArray;
}

-(void)setUpInfo{

    for (int i = 0; i < 20; i ++) {
        [self.SimplifyModelArray addObject:[self getModelForType:StroopTestsTypeSimplify]];
    }
}

-(NSArray *)textArray{
    if (!_textArray) {
        _textArray = @[@"红",@"蓝",@"绿",@"黑",@"黄",@"橙"];
    }
    return _textArray;
}

-(StroopModel*)getModelForType:(StroopTestType)type{

    NSInteger counts = self.colorArray.count;
    
    if (type == StroopTestsTypeSimplify) {
        StroopModel *model = [[StroopModel alloc] init];
        
        model.textColor = [UIColor blackColor];
        model.showTime = 1 + arc4random()%100/10.0;
        model.showText = self.textArray[arc4random()%counts];
    
        return model;
    }else{
        
        StroopModel *model = [[StroopModel alloc] init];
        
        model.textColor = self.colorArray[arc4random()%counts];
        model.showTime = 1 + arc4random()%100/10.0;
        model.showText = self.textArray[arc4random()%counts];
        
        return model;
    }
}

/**
 *  设置 label 的属性
 */
-(void)settingUi{
    
    self.showWordsLabel = ({
        
        self.showWordsLabel = [[UILabel alloc] init];
        
        self.showWordsLabel.font = [UIFont boldSystemFontOfSize:29];
        
        self.showWordsLabel.textColor = [UIColor whiteColor];
        
        self.showWordsLabel.height = self.showWordsLabel.width = self.width * .2;
        
        self.showWordsLabel.centerX = self.centerX;
        
        self.showWordsLabel.centerY = self.height * .5;
    
        self.showWordsLabel;
    });
    
    self.tipsLabel = ({
        
        self.tipsLabel = [[UILabel alloc] init];
        
        self.tipsLabel.font = JSFont(19);
        
        self.tipsLabel.textColor = [UIColor whiteColor];
        
        self.tipsLabel.height = self.width * .1;
        
        self.showWordsLabel.width = self.width * .2;
        
        self.tipsLabel.centerX = self.centerX;
        
        self.tipsLabel.centerY = self.height * .8;
    
        self.tipsLabel;
    });
}

-(void)setLabelTextColor:(UIColor *)labelTextColor{
    
    if (_labelTextColor != labelTextColor) {
        _labelTextColor = labelTextColor;
        [self.showWordsLabel setTextColor:_labelTextColor];
    }
}

/**
 *  初始化方法
 *
 *  @return ...
 */
+(instancetype)test{
    return [[self alloc] init];
}



/**
 *  简单测试.
 */
-(void)showSimplify{
    self.StroopTestType = StroopTestsTypeSimplify;
    
}
-(void)showComplication{
    self.StroopTestType = StroopTestsTypeComplication;
    
}

-(void)showColorInContrast{
    self.StroopTestType = StroopTestsTypeInContrast;
    
}

@end
