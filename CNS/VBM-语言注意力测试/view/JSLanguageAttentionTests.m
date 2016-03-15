//
//  JSLanguageAttentionTests.m
//  CNS
//
//  Created by Mac on 16/3/2.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSLanguageAttentionTests.h"

#import "JSLanguageAttentionModel.h"

@interface JSLanguageAttentionTests ()

/**
 *  存放所有可能测试的词组'
 */
@property (nonatomic,retain) NSMutableArray *allWordsArray;

/**
 *  测试模型;
 */
@property (nonatomic, retain) JSLanguageAttentionModel *model;

/**
 *  显示词语的 label
 */
@property (nonatomic,weak) UILabel *showWordsLabel;

@property (nonatomic,weak) UILabel *tipsLabel;

/**
 *  用以计时的 timer
 */
@property (nonatomic,retain) NSTimer *calculatTimer;

/**
 *  当前显示的轮次
 */
@property (nonatomic,assign) NSInteger currentWordsCount;


@property (nonatomic,retain) UITapGestureRecognizer *tapScreen;
@end

@implementation JSLanguageAttentionTests


-(instancetype)init{

    if (self = [super init]) {
        
        [self setUpModel];
        
        self.currentWordsCount = 0;
        
    }
    return self;
}

//越是要无拘无束的，便越是要用万钧重压，越是年少无知的，便越是要让他痛苦害怕。

-(void)setUpModel{
    JSLanguageAttentionModel *model = [[JSLanguageAttentionModel alloc] init];
    
    model.theTestsAllWordsArray = [self getWordsFormArray:self.allWordsArray withCount:30];
    
    model.theRightWordsArray = [self getWordsFormArray:model.theTestsAllWordsArray withCount:3];
    
    self.model = model;
}

-(UILabel *)showWordsLabel{

    if (!_showWordsLabel) {
        
        UILabel *label = [[UILabel alloc] init];
        
        label.adjustsFontSizeToFitWidth=  YES;
        
        [label setFont:[UIFont boldSystemFontOfSize:35]];
        
        [label setBackgroundColor:[UIColor clearColor]];
        
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [label setTextColor:[UIColor blackColor]];
        
        [self addSubview:label];
        
        self.showWordsLabel = label;
        
        self.showWordsLabel.height = self.showWordsLabel.width = self.width * .2;
        
        self.showWordsLabel.centerX = self.centerX;
        
        self.showWordsLabel.centerY = self.centerY;
    }
    return _showWordsLabel;
}


-(UILabel *)tipsLabel{

    if (!_tipsLabel) {
        UILabel *label = [[UILabel alloc] init];
        
        label.numberOfLines = 0;
        
        [label setFont:[UIFont systemFontOfSize:22]];
        
        [label setBackgroundColor:[UIColor clearColor]];
        
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [label setTextColor:[UIColor blackColor]];
        
        [self addSubview:label];
        
        self.tipsLabel = label;
        
        self.tipsLabel.height = self.height * .15;
        self.tipsLabel.width = self.width * .5;
        
        self.tipsLabel.centerX = self.centerX;
        
        self.tipsLabel.centerY = self.height * .8;
    }
    return _tipsLabel;
}

/**
 *  初始化方法
 *  在这里做一些必要的处理
 *  @return 实例
 */

+(instancetype)test{
    
    return [[self alloc]init];
}

/**
 *  展示那15个需要记得单词;
 */
-(void)show{
    
    self.calculatTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(showWords) userInfo:nil repeats:YES];
    
    [[timerTool tool]fireInTheHoll:self.calculatTimer];
    
    [self.tipsLabel setText:@"记住这一单词"];
}

/**
 *  定时器方法;
 */
-(void)showWords{
    
    if (self.currentWordsCount >= self.model.theRightWordsArray.count) {
        [self.calculatTimer invalidate];
        self.currentWordsCount = 0;
        [self.showWordsLabel removeFromSuperview];
        
        [self.tipsLabel removeFromSuperview];
        
        if ([self.delegate respondsToSelector:@selector(JSLanguageAttentionTests:didFinsiShowWord:)]) {
            [self.delegate JSLanguageAttentionTests:self didFinsiShowWord:self.model];
        }
    }
    
    [self.showWordsLabel jsLabel_AnimatgionRollDirctionToText:self.model.theRightWordsArray[self.currentWordsCount] andColor:[UIColor blackColor]];
    
    self.currentWordsCount ++;
}


/**
 *  开始全部的测试
 */
-(void)showTestWords{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickScreen)];
    
    [self addGestureRecognizer:tap];
    
    
    [self.tipsLabel setText:@"如果您被要求记住这一单词,请点击屏幕"];
    
    
    self.tapScreen = tap;

    self.calculatTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(showWordsMore) userInfo:nil repeats:YES];
    
    [[timerTool tool]fireInTheHoll:self.calculatTimer];
    
}

-(void)clickScreen{

    if ([self.delegate respondsToSelector:@selector(JSLanguageAttentionTests:didClickScreen:withCurrentCount:)]) {
        [self.delegate JSLanguageAttentionTests:self didClickScreen:self.model withCurrentCount:self.currentWordsCount];
    }
}

-(void)showWordsMore{
    
    if (self.currentWordsCount >= self.model.theTestsAllWordsArray.count) {
        [self.calculatTimer invalidate];
        self.currentWordsCount = 0;
        [self.showWordsLabel removeFromSuperview];
        [self.tipsLabel removeFromSuperview];
        [self removeGestureRecognizer:self.tapScreen];
        if ([self.delegate respondsToSelector:@selector(JSLanguageAttentionTests:didFinsihTests:)]) {
            [self.delegate JSLanguageAttentionTests:self didFinsihTests:self.model];
        }
    }
    
    [self.showWordsLabel jsLabel_AnimatgionRollDirctionToText:self.model.theTestsAllWordsArray[self.currentWordsCount] andColor:[UIColor blackColor]];
    
    self.currentWordsCount ++;
    

}

-(NSMutableArray *)allWordsArray{
    
    if (!_allWordsArray) {
        
        self.allWordsArray = [@[@"街道",@"馅饼",@"镜子",@"鼓",@"音乐",@"云彩",@"汽车",@"飞镖",@"炉子",@"窗户",@"长袜",@"沙漠",@"娃娃",@"孩子",@"热",@"铃",@"父母",@"心",@"监狱",@"蛤蟆",@"货摊",@"手",@"教堂",@"苍蝇",@"火鸡",@"教师",@"月亮",@"铅笔",@"盾牌",@"被子",@"电",@"纸张",@"女孩",@"牛奶",@"头盔",@"马",@"学校",@"河流",@"鸟",@"床",@"沙漠",@"街道",@"猴子",@"猪",@"橡皮",@"电视",@"苹果",@"猫",@"水",@"游戏",@"英雄",@"黑猫",@"大树",@"小草",@"小虫",@"手表",@"手指",@"电脑",@"数学"] mutableCopy];
    }
    return _allWordsArray;
}

/**
 *  从一个数组中随机得到几个元素.乱序排布到数组中返回
 *
 *  @param array 目标数组
 *  @param count 元素个数
 *
 *  @return 包含指定个数元素的数组
 */
-(NSMutableArray*)getWordsFormArray:(NSMutableArray *)array withCount:(int)count{
    
    
    NSMutableArray *cotainArray = [NSMutableArray array];
    
    NSMutableArray *copyArray = [NSMutableArray arrayWithArray:array];
    
    if (count > array.count) {
        count = (int)array.count;
    }
    for (int i = count ;i > 0 ;i -- ) {
        
        int a = arc4random()%i;
        
        [cotainArray addObject:copyArray[a]];
        
        [copyArray removeObjectAtIndex:a];
        
    }
    return cotainArray;
    
}

@end
