//
//  SymbolDigitCodingTests.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "SymbolDigitCodingTests.h"

#import "SymbolAndDigit.h"


#define JSTAG 10000

@interface SymbolDigitCodingTests ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *imageNameArray;

@property (nonatomic,strong) NSMutableArray *modelArray;

@property (nonatomic,strong) UIScrollView *testScrollView;

@property (nonatomic,weak) SymbolAndDigit *currentSymbelTestView;

@end

@implementation SymbolDigitCodingTests

-(instancetype)init{

    if (self = [super init]) {
        
        
        [self getModelForCount:8];
        
        
        
    }
    return self;
}

- (void)show {
    self.testScrollView.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishOnePage) name:@"endOfText" object:nil];
    
    self.testScrollView.scrollEnabled = NO;
    
    for (int i = 0 ; i < self.modelArray.count;i ++) {
        SymbolAndDigit *digitShow = [[SymbolAndDigit alloc] initWithStyle:SymbolAndDigitStyleShow];
        
        SymbolAndDigit *digitTest = [[SymbolAndDigit alloc] initWithStyle:SymbolAndDigitStyleTest];
        
        digitShow.model = self.modelArray[i];
        
        digitTest.model = self.modelArray[i];
        
        UIView *containView = [[UIView alloc] init];
        
        digitShow.width = digitTest.width = JSFrame.size.width * .35;
        
        digitTest.height = digitShow.height = JSFrame.size.height * .7;
        
        digitShow.centerX = JSFrame.size.width * .25;
        
        digitTest.centerX = JSFrame.size.width * .75;
        
        digitTest.y = digitShow.y = JSFrame.size.height * .05;
        
        [containView addSubview:digitShow];
        
        [containView addSubview:digitTest];
        
        [containView setTag:i+JSTAG];
        
        [digitTest setTag:JSTAG-i-1];
        
        [containView setFrame:CGRectMake(i * self.width, 0, self.width, self.height)];
        
        [self.testScrollView addSubview:containView];
        
        UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isEdit)];
        
        [containView addGestureRecognizer:tap];
    }
}

-(void)isEdit{
        
        for (DiamandsView *v in self.currentSymbelTestView.textFileArray) {
            if (v.digitView.editing) {
                //            [v.digitView resignFirstResponder];
                [self endEditing:YES];
                return;
            }
        }
        
        for (int i = 0 ; i < 8; i ++ ) {
            DiamandsView *v = self.currentSymbelTestView.textFileArray[i];
            if (v.digitView.enabled) {
                [v.digitView becomeFirstResponder];
                return;
            }
            
        }
    }

-(UIScrollView *)testScrollView{

    if (!_testScrollView) {
        UIScrollView *scrollview = [[UIScrollView alloc]init];
        
        scrollview.frame = CGRectMake(0, 0, JSFrame.size.width, JSFrame.size.height);
        
        scrollview.pagingEnabled = YES;
        
        scrollview.alwaysBounceHorizontal = NO;
        
        scrollview.delegate = self;
        
        scrollview.contentSize = CGSizeMake(JSFrame.size.width*self.modelArray.count, 0);
        
        scrollview.bounces = NO;
        
        [self addSubview:scrollview];
        
        self.testScrollView = scrollview;
    }

    return _testScrollView;
}

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

/**
 *  将指定个数的测试模型装入一个数组;
 *
 *  @param count 个数
 */

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
        
        NSMutableArray *testary = [self getSomeImageFromArray:ary withCount:8];
        
        model.testImageName_2 = testary[0];
        model.testImageName_3 = testary[1];
        model.testImageName_4 = testary[2];
        model.testImageName_5 = testary[3];
        model.testImageName_6 = testary[4];
        model.testImageName_7 = testary[5];
        model.testImageName_8 = testary[6];
        model.testImageName_9 = testary[7];
        
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

/**
 *  完成一页的测试后
 */
-(void)finishOnePage{

    CGPoint currentPoint = self.testScrollView.contentOffset;
    
    if (currentPoint.x < self.frame.size.width * (self.modelArray.count-1)) {
        
        
        NSInteger currentCount = currentPoint.x / self.testScrollView.width;
        [self changeModelWithCount:currentCount];

        [self.testScrollView setContentOffset:CGPointMake(self.testScrollView.width + currentPoint.x, 0) animated:YES];
        
    }else{
        
        [self changeModelWithCount:self.modelArray.count-1];
    
        if ([self.delegate respondsToSelector:@selector(SymbolDigitCodingTests:didFinsihTestWithModelArray:)]) {
            [self.delegate SymbolDigitCodingTests:self didFinsihTestWithModelArray:self.modelArray];
            
        }
    }
}

-(void)changeModelWithCount:(NSInteger)count{
    SymbolDigitsModel *currentModel = self.modelArray[count];
    
    currentModel.selectNo_2 = self.currentSymbelTestView.view_number2.digitView.text;
    currentModel.selectNo_3 = self.currentSymbelTestView.view_number3.digitView.text;
    currentModel.selectNo_4 = self.currentSymbelTestView.view_number4.digitView.text;
    currentModel.selectNo_5 = self.currentSymbelTestView.view_number5.digitView.text;
    currentModel.selectNo_6 = self.currentSymbelTestView.view_number6.digitView.text;
    currentModel.selectNo_7 = self.currentSymbelTestView.view_number7.digitView.text;
    currentModel.selectNo_8 = self.currentSymbelTestView.view_number8.digitView.text;
    currentModel.selectNo_9 = self.currentSymbelTestView.view_number9.digitView.text;
}

-(SymbolAndDigit *)currentSymbelTestView{
    CGPoint currentPoint = self.testScrollView.contentOffset;
    
    NSInteger currentCount = currentPoint.x / self.testScrollView.width;
    
    UIView *contain = [self viewWithTag:JSTAG + currentCount];
    
    SymbolAndDigit *symView = (SymbolAndDigit *)[contain viewWithTag:JSTAG - currentCount -1];
    
    _currentSymbelTestView = symView;
    
    return _currentSymbelTestView;
}

/**
 *  移除通知;
 */
-(void)dealloc{

    [self removeObserver:self forKeyPath:@"endOfText"];
    
}

@end


