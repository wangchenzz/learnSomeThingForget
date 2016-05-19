//
//  FirstViewController.h
//  CNS
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,JSTestCurrentState) {
    
    JSTestCurrentLanguageShow  =  0,                        //展示语言注意力测试
    JSTestCurrentLanguageImmediate,                         //即时语言测试
    JSTestCurrentLanguageDelaye,                            //延时语言测试
    JSTestCurrentVisualShow ,                               //展示视觉注意力测试
    JSTestCurrentVisualImmediate,                           //即时视觉注意力测试
    JSTestCurrentVisualDelaye,                              //延时视觉注意力测试
    JSTestCurrentClickTestLeft,                             //左手点击测试开始
    JSTestCurrentClickTestRight ,                           //右手点击测试开始
    JSTestCurrentSymbolTest,                                //符号位数赋值测试
    JSTestCurrentSimplifyStroopTests,                       //颜色反差测试 简单测试
    JSTestCurrentComplicationStroopTests,                   //颜色反差测试 复杂测试
    JSTestCurrentInContrastStroopTests,                     //颜色反差测试 反色测试
    JSTestCurrentShiftingAttentionTests,                    //注意力转移测试
    JSTestCurrentContinuousPerformanceTests                 //注意力持续测试状态
    
};

@interface FirstViewController : UIViewController

@property (nonatomic,copy) NSString *ModuleQyesDiff;

@property (nonatomic,copy) NSString *ModuleQuesId;

@property (nonatomic,assign) NSInteger ModuleType;

-(instancetype)initWithIsModule:(BOOL)mo andWithState:(JSTestCurrentState )state andWithArray:(NSArray *)array andWithdifcultLevel:(NSInteger)level;
@end
