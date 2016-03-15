//
//  JSVisualAttentionTests.m
//  CNS
//
//  Created by Mac on 16/3/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSVisualAttentionTests.h"

#import "JSVisualAttentionModel.h"

#import <Foundation/Foundation.h>

@interface JSVisualAttentionTests ()

/**
 *  包含所有图片名字的 Array;
 */
@property (nonatomic,retain) NSMutableArray *containAllImageNameArray;


/**
 *  显示图片的 ImageView
 */
@property (nonatomic,weak) UIImageView *showImageView;



/**
 *  用于提示的 label;
 */

@property (nonatomic,weak) UILabel *tipsLabel;

/**
 *  用以计时的 timer
 */
@property (nonatomic,retain) NSTimer *calculatTimer;

/**
 *  当前显示的轮次
 */
@property (nonatomic,assign) NSInteger currentImageCount;

/**
 *  点击屏幕的手势
 */
@property (nonatomic,retain) UITapGestureRecognizer *tapScreen;

/**
 *  包含测试内容和测试结果的模型;
 */
@property (nonatomic,retain) JSVisualAttentionModel *model;

@end

@implementation JSVisualAttentionTests

-(instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpModel];
        
        self.currentImageCount = 0;
    }
    return self;
}


+(instancetype)test{

    return [[self alloc]init];
    
}

-(void)show{
    
    self.calculatTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(showImage) userInfo:nil repeats:YES];
    
    [self.tipsLabel setText:@"请记下来每一张图的样子"];
    
    [[timerTool tool] fireInTheHoll:self.calculatTimer];
}

-(void)showTests{

    self.calculatTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(showTestsImage) userInfo:nil repeats:YES];
    
    [[timerTool tool] fireInTheHoll:self.calculatTimer];
    
    
    [self.tipsLabel setText:@"如果是要求记忆的图像请点击屏幕"];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickScreen)];
    
    [self addGestureRecognizer:tap];
    
    
    self.tapScreen = tap;
}

-(void)clickScreen{
    if ([self.delegate respondsToSelector:@selector(JSVisualAttentionTests:didClickScreen:withCurrentCount:)]) {
        [self.delegate JSVisualAttentionTests:self didClickScreen:self.model withCurrentCount:self.currentImageCount];
    }
}

/**
 *  第一次展示的正确图片
 */
-(void)showImage{
    
    [self.showImageView startImageViewAnimationImage:[UIImage imageNamed:self.model.theRightImageArray[self.currentImageCount]]] ;
    
    self.currentImageCount++;
    
    if (self.currentImageCount >= self.model.theRightImageArray.count) {
        [self.calculatTimer invalidate];
        self.currentImageCount = 0;
        [self.showImageView removeFromSuperview];
        [self.tipsLabel removeFromSuperview];
        [self removeGestureRecognizer:self.tapScreen];
        
        if ([self.delegate respondsToSelector:@selector(JSVisualAttentionTests:didFinishShowRightImage:)]) {
            [self.delegate JSVisualAttentionTests:self didFinishShowRightImage:self.model];
        }
        return;
    }
}

-(void)showTestsImage{
    [self.showImageView startImageViewAnimationImage:[UIImage imageNamed:self.model.theTestsAllImageArray[self.currentImageCount]]];
    
    self.currentImageCount++;
    
    if (self.currentImageCount >= self.model.theTestsAllImageArray.count) {
        [self.calculatTimer invalidate];
        self.currentImageCount = 0;
        [self.showImageView removeFromSuperview];
        [self.tipsLabel removeFromSuperview];
        [self removeGestureRecognizer:self.tapScreen];
        
        if ([self.delegate respondsToSelector:@selector(JSVisualAttentionTests:didFinishShowRightImage:)]) {
            [self.delegate JSVisualAttentionTests:self didFinsihTests:self.model];
        }
        return;
    }


}


/**
 *  这里是将要可能使用的数据放在数组中,实际中还未定,
 *
 *  @return ...
 */
-(NSMutableArray *)containAllImageNameArray{

    if (!_containAllImageNameArray) {
        self.containAllImageNameArray = [@[@"visualImage1",@"visualImage2",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage2",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage3",@"visualImage4",@"visualImage5",@"visualImage6",@"visualImage3",@"visualImage4",@"visualImage5"] mutableCopy];
    }
    return _containAllImageNameArray;
}

-(void)setUpModel{
    
    JSVisualAttentionModel *model = [[JSVisualAttentionModel alloc] init];
    
    model.theTestsAllImageArray = [self getSomeImageFromArray:self.containAllImageNameArray withCount:30];
    
    model.theRightImageArray = [self getSomeImageFromArray:model.theTestsAllImageArray withCount:15];
    
    self.model = model;
}
-(UIImageView *)showImageView{
    
    if (!_showImageView) {
        
        UIImageView *imageView = [[UIImageView alloc] init];

        [self addSubview:imageView];
        
        self.showImageView = imageView;
        
        self.showImageView.height = self.showImageView.width = self.width * .4;
        
        self.showImageView.centerX = self.centerX;
        
        self.showImageView.centerY = self.centerY;
    }
    return _showImageView;
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
