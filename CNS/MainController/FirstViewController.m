//
//  FirstViewController.m
//  CNS
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "FirstViewController.h"

#import "JSLanguageAttentionTests.h"

#import "JSVisualAttentionTests.h"

#import "JSPresentBut.h"

#import "JSFgClickTests.h"

#import "DiamandsView.h"

#import "SymbolDigitCodingTests.h"

#import "animationFlashLabel.h"

//后期添加的模块.

#import "StroopTests.h"

#import "ShiftingAttentionTests.h"

#import "ContinuousPerformanceTests.h"

#import "JSTestsList.h"

typedef NS_ENUM(NSInteger,JSTestCurrentState) {
    
    JSTestCurrentLanguageShow  =  1,                        //展示语言注意力测试
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
    JSTestCurrentContinuousPerformanceTests
    
};

@interface FirstViewController ()<JSLanguageAttentionTestsDelegate,JSVisualAttentionTestsDelegate,JSFgClickTestsDelegate,SymbolDigitCodingTestsDelegate,StroopTestsDelegate,ShiftingAttentionTestsDelegate,ContinuousPerformanceTestsDelegate>

@property (nonatomic,retain) JSPresentBut *flashButton;

@property (nonatomic,assign) JSTestCurrentState JSTestCurrentState;

@property (nonatomic,retain) UIButton *beginButton;

@property (nonatomic,strong) animationFlashLabel *titleLabel;

@property (nonatomic,strong) animationFlashLabel *messageLabel;

@property (nonatomic,strong) animationFlashLabel *endLabel;

@property (nonatomic,strong) UITapGestureRecognizer *tapContinue;

@property (nonatomic,strong) JSLanguageAttentionTests *languageTest;

@property (nonatomic,strong) JSVisualAttentionTests *visualTest;

@property (nonatomic,strong) JSFgClickTests *clickLeftTests;

@property (nonatomic,strong) JSFgClickTests *clickRightTests;

@property (nonatomic,strong) SymbolDigitCodingTests *symbolTest;

@property (nonatomic,strong) StroopTests *stroopTest;

@property (nonatomic,strong) ShiftingAttentionTests *shiftingAttentionTest;

@property (nonatomic,strong) ContinuousPerformanceTests *continuousPerformanceTest;


@property (nonatomic,strong) JSTestsList *testsList;

/**
 *  lastOne 应为默认是为零.在测试的过程中带来了各种意想不到的问题.
 */
@property (nonatomic,assign) NSInteger lastOne;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    
    UIButton *beginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    beginButton.height = 60;
    
    beginButton.width = 180;
    
    beginButton.centerX = self.view.centerX;
    
    beginButton.centerY = self.view.centerY;
    
    [beginButton setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:beginButton];
    
    [beginButton setTitle:@"开始" forState:UIControlStateNormal];
    
    [beginButton addTarget:self action:@selector(clickIn) forControlEvents:UIControlEventTouchUpInside];
    
    self.beginButton = beginButton;
    
    
    self.testsList = [[JSTestsList alloc] init];
    
}
-(void)clickIn{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.beginButton.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        self.beginButton.layer.cornerRadius = 30;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.beginButton.bounds = CGRectMake(0, 0, 60*1.2, 60*1.2);
            
            self.beginButton.layer.cornerRadius = 30 * 1.2;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.2 animations:^{
                
                self.beginButton.alpha = 0;
                
                
            } completion:^(BOOL finished) {
                
                [JSLoading loadSuccessCompletion:^(BOOL finished) {
                    
                    
                    self.titleLabel = [[animationFlashLabel alloc] init];
                    
                    self.titleLabel.frame = CGRectMake(0, 50, self.view.width, 50);
                    self.titleLabel.numberOfLines = 0;
                    
                    self.titleLabel.textAlignment = NSTextAlignmentCenter;
                    
                    [self.view addSubview:self.titleLabel];
                    
                    self.titleLabel.font = [UIFont boldSystemFontOfSize:24];
                    
                    self.titleLabel.willShowText = @"语言注意力测试";
                    
                    [self.titleLabel showAnimation:3 completion:nil];
                    
                    
                    
                    self.messageLabel = [[animationFlashLabel alloc] init];
                    
                    self.messageLabel.frame = CGRectMake(50, self.view.height * .2, self.view.width - 100, self.view.height * .5);
                    self.messageLabel.numberOfLines = 0;
                    
                    //                    self.messageLabel.textAlignment = NSTextAlignmentCenter;
                    
                    [self.view addSubview:self.messageLabel];
                    
                    self.messageLabel.font = [UIFont systemFontOfSize:18];
                    
                    self.messageLabel.willShowText =@"您将马上开始词语记忆测试.\n\n本测验的目的是记忆单词.\n\n将向你展示一系列单词,但每次您只能看到一个单词.\n\n尽最大努力记住这些单词,因为不久后您将被要求挑选出您刚才见过的单词.\n\n现在,您将看到15个需要记忆的单词.\n\n 每一个单词都将显示两秒钟.";
                    
                    [self.messageLabel showAnimation:3 completion:^(BOOL finished) {
                        
//                    self.JSTestCurrentState = JSTestCurrentLanguageShow;
                        self.JSTestCurrentState = JSTestCurrentSimplifyStroopTests;
                        //                         self.JSTestCurrentState = JSTestCurrentSimplifyStroopTests;
                        [self.view addGestureRecognizer:self.tapContinue];
                    }];
                    
                    
                    self.endLabel = [[animationFlashLabel alloc] init];
                    
                    self.endLabel.frame = CGRectMake(0, self.view.height * .8, self.view.width, 50);
                    
                    self.endLabel.numberOfLines = 0;
                    
                    self.endLabel.textAlignment = NSTextAlignmentCenter;
                    
                    [self.view addSubview:self.endLabel];
                    
                    self.endLabel.font = [UIFont boldSystemFontOfSize:24];
                    
                    self.endLabel.willShowText = @"双击屏幕继续";
                    
                    [self.endLabel showAnimation:3 completion:nil];
                }];
            }];
        }];
    }];
}

-(UITapGestureRecognizer *)tapContinue{
    
    if (!_tapContinue) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(beginFirstTest)];
        tap.numberOfTapsRequired = 2;
        self.tapContinue = tap;
    }
    return _tapContinue;
}


-(void)viewWithTheTitle:(NSString *)title withMessage:(NSString *)message withEnd:(NSString *)end andJSTestCurrentState:(JSTestCurrentState)state{
    
    self.titleLabel.willShowText = title;
    self.messageLabel.willShowText = message;
    self.endLabel.willShowText = end;
    
    [self.view addSubview:self.titleLabel];
    
    [self.view addSubview:self.messageLabel];
    
    [self.view addSubview:self.endLabel];
    
    [self.titleLabel showAnimation:1 completion:nil];
    
    [self.endLabel showAnimation:1 completion:nil];
    
    [self.messageLabel showAnimation:1 completion:^(BOOL finished) {
        
        self.JSTestCurrentState = state;
        
        [self.view addGestureRecognizer:self.tapContinue];
    }];
}

-(void)beginFirstTest{
    
    
    self.titleLabel.text =@"";
    self.messageLabel.text =@"";
    
    [self.titleLabel removeFromSuperview];
    
    [self.endLabel removeFromSuperview];
    
    [self.messageLabel removeFromSuperview];
    
    //    self.endLabel.text = @"";
    switch (self.JSTestCurrentState) {
        case JSTestCurrentLanguageShow:
        {
            JSLanguageAttentionTests *te = [JSLanguageAttentionTests test];
            
            te.delegate = self;
            
            te.frame = self.view.frame;
            
            [self.view addSubview:te];
            
            [te show];
            
            self.languageTest = te;
        }
            break;
        case JSTestCurrentLanguageImmediate:
        {
            [self.languageTest showTestWords];
        }
            break;
        case JSTestCurrentVisualShow:
        {
            JSVisualAttentionTests *test = [JSVisualAttentionTests test];
            
            [self.view addSubview:test];
            
            test.frame = self.view.bounds;
            
            test.delegate =self;
            
            [test show];
            
            self.visualTest = test;
        }
            break;
            case JSTestCurrentVisualImmediate:
        {
            
            [self.visualTest showTests];
            
        }
            break;
        case JSTestCurrentClickTestLeft:
        {
            
            JSFgClickTests *test = [JSFgClickTests test];
            
            test.frame = JSFrame;
            
            [self.view addSubview:test];
            
            test.delegate = self;
            
            [test show];
            
            self.clickLeftTests = test;
            
        }
            break;
            
        case JSTestCurrentClickTestRight:
        {
            
            JSFgClickTests *test = [JSFgClickTests test];
            test.frame = JSFrame;
            
            [self.view addSubview:test];
            
            test.delegate = self;
            
            [test show];
            
            self.clickRightTests = test;
            
        }
            break;
        case JSTestCurrentSymbolTest:
        {
            SymbolDigitCodingTests *test = [[SymbolDigitCodingTests alloc] init];
            
            test.frame = JSFrame;
            
            [self.view addSubview:test];
            
            test.delegate = self;
            
            [test show];
            
            self.symbolTest = test;
            
        }
            break;
            
        case JSTestCurrentSimplifyStroopTests:
        {
            
            StroopTests *test = [StroopTests test];
            
            test.frame = JSFrame;
            
            [self.view addSubview:test];
            
            test.delegate = self;
            
            [test showSimplify];
            
            self.stroopTest = test;
            
        }
            break;
        case JSTestCurrentComplicationStroopTests:
        {
            [self.stroopTest showComplication];
        }
            break;
            
        case JSTestCurrentInContrastStroopTests:
        {
            [self.stroopTest showColorInContrast];
        }
            break;
            
        case JSTestCurrentShiftingAttentionTests:
        {
            ShiftingAttentionTests *test = [ShiftingAttentionTests test];
            
            test.frame = JSFrame;
            
            [self.view addSubview:test];
            
            [test beginOneTest];
            
            test.delegate = self;
            
            self.shiftingAttentionTest = test;
        }
            break;
            
        case JSTestCurrentContinuousPerformanceTests:
        {
            ContinuousPerformanceTests *ss = [ContinuousPerformanceTests test];
            
            ss.frame = JSFrame;
            
            [self.view addSubview:ss];
            
            [ss showMeTheTest];
            
            ss.delegate = self;
            
            self.continuousPerformanceTest = ss;
            
        }
            break;
            
            /**
             *
             */
            
        default:
            break;
    }
    
    
    [self.view removeGestureRecognizer:self.tapContinue];
}

#pragma mark -- JSLanguageAttentionTestsDelegate

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsiShowWord:(JSLanguageAttentionModel *)model{
    
    NSString *title = @"词语记忆测验";
    NSString *message = @"现在,您将看到另一个更长的单词表.\n\n如果某个单词是要求记忆的15个单词中的一个,请单击屏幕.\n\n 如果不是,则不要按任何按键,等待下一个单词的出现.\n\n每一个单词都将显示两秒钟.";
    NSString *end = @"双击屏幕继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentLanguageImmediate];
    
    
}

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didClickScreen:(JSLanguageAttentionModel *)model withCurrentCount:(NSInteger)count{
    
    if (self.lastOne != count && [model.theRightWordsArray containsObject:model.theTestsAllWordsArray[count-1]]) {
        self.testsList.VIMimmediateRightReaction ++;
    }
    
    if (self.lastOne != count && ![model.theRightWordsArray containsObject:model.theTestsAllWordsArray[count-1]]) {
        self.testsList.VIMimmediateWrongReaction++;
    }
    
    self.lastOne = count;
    /**
     *  每次显示完成时候 count 已经完成++
     */
}

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsihTests:(JSLanguageAttentionModel *)model{
    
    NSString *title = @"图像注意测验";
    NSString *message = @"您将马上开始视觉记忆测验.\n\n本测验的目的是记忆图像.\n\n将向你展示一系列图像,但一次只能看到一副.尽最大努力记住这些图像,因为不久后您将被要求挑选出您刚见过的图像.\n\n您将看到所需记忆的15幅图像.\n\n每一幅图像都将显示两秒钟";
    NSString *end = @"双击屏幕继续";
    
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentVisualShow];
    
    self.lastOne = 0;
}

#pragma mark -- JSVisualAttentionTestsDelegate

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didClickScreen:(JSVisualAttentionModel *)model withCurrentCount:(NSInteger)count{
    
    if (self.lastOne != count && [model.theRightImageArray containsObject:model.theTestsAllImageArray[count-1]]) {
        self.testsList.VBMimmediateWrongReaction ++;
    }
    
    if (self.lastOne != count && ![model.theRightImageArray containsObject:model.theTestsAllImageArray[count-1]]) {
        self.testsList.VBMimmediateWrongReaction++;
    }
    
    self.lastOne = count;
}

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)tests didFinishShowRightImage:(JSVisualAttentionModel *)model{
    
    NSString *title = @"图像记忆测验";
    NSString *message = @"现在,您将看到一系列更多的图像.\n\n如果某一幅图像是要求记忆的15幅图像中的一个,请单击屏幕.\n\n 如果不是,则不要按任何按键,等待下一幅图像的出现.\n\n每一幅图像都将显示两秒钟.";
    NSString *end = @"双击屏幕继续";
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentVisualImmediate];
}

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didFinsihTests:(JSVisualAttentionModel *)model{
    
    NSString *title = @"手指敲击测试";
    NSString *message = @"现在,您将用左手进行手指敲击测试.\n\n将会测量你得速度和准确度\n\n用您的左手食指尽可能快得敲击屏幕十秒钟.\n\n本测验将重复两次.\n\n进行每一次测验之前,将有三秒钟的倒计时";
    NSString *end = @"双击屏幕继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentClickTestLeft];
    
    self.lastOne = 1000;
}


#pragma mark - JSFgClickTestsDelegate;

-(NSString *)JSFgClickTests:(JSFgClickTests *)test titleForTipsInCount:(NSInteger)Count{
    
    if (test == self.clickRightTests) {
        
        return @"请用你的右手食指点击屏幕,看到'停'字,请停止";
    }else{
        return @"请用你的左手食指点击屏幕,看到'停'字,请停止";
    }
}

-(NSInteger)JSFgClickTests:(JSFgClickTests *)test timeTravelForCount:(NSInteger)count{
    
    return 10;
}

-(NSInteger)numberOfTestsCountInJSFgClickTests:(JSFgClickTests *)test{
    
    return 3;
}

-(void)DidFinsihAllTest:(JSFgClickTests *)test{
    if (test == self.clickLeftTests) {
        NSString *title = @"手指敲击测试";
        NSString *message = @"现在,您将用右手进行手指敲击测试.\n\n将会测量你得速度和准确度\n\n用您的右手食指尽可能快得敲击屏幕十秒钟.\n\n本测验将重复两次.\n\n进行每一次测验之前,将有三秒钟的倒计时";
        NSString *end = @"双击屏幕继续";
        
        [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentClickTestRight];
    }else{
        
#pragma mark - 两次都测试完毕;
        NSString *title = @"符号数字编码";
        NSString *message = @"使用弹出的键盘,将测验网格中的每一个符号与答案网格中的正确编号相匹配.\n\n闪烁光标将指示您的位置.\n\n不能跳过一个符号或后退.\n\n点击屏幕任意位置可以弹出或者收回键盘.\n\n现在,您将进行符号数字编码测验.";
        NSString *end = @"双击屏幕继续";
        
        [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentSymbolTest];
        
        
    }
}

-(void)JSFgClickTests:(JSFgClickTests *)test clickCountForCurrentCount:(NSInteger)currentCount andClickCount:(NSInteger)clickCount{
    if (currentCount == 0 && test==self.clickLeftTests) {
        self.testsList.left1ClickCount = clickCount;
    }
    if (currentCount == 1 && test==self.clickLeftTests) {
        self.testsList.left2ClickCount = clickCount;
    }
    if (currentCount == 2 && test==self.clickLeftTests) {
        self.testsList.left3ClickCount = clickCount;
    }
    if (currentCount == 0 && test==self.clickRightTests) {
        self.testsList.right1ClickCount = clickCount;
    }
    if (currentCount == 1 && test==self.clickRightTests) {
        self.testsList.right2ClickCount = clickCount;
    }
    if (currentCount == 2 && test==self.clickRightTests) {
        self.testsList.right3ClickCount = clickCount;
    }
}

#pragma mark - SymbolDigitCodingTestsDelegate;

-(void)SymbolDigitCodingTests:(SymbolDigitCodingTests *)test didFinsihTestWithModelArray:(NSMutableArray *)array{
    
    //    JSPresentBut *butt = [[JSPresentBut alloc] init];
    //
    //    [butt show];
    
    for (SymbolDigitsModel *model in array) {
        for (int i = 0;i < 8; i++ ) {
            NSString *selecteStr = model.selectArray[i];
            NSInteger selectNo = [selecteStr integerValue] - 2;
            [model.nameArray[selectNo] isEqualToString:model.testArray[i]]?self.testsList.SDCRightSelect++:self.testsList.SDCWrongSelect++;
            
            
        }
    }
    
    //计划 .首先完成所有模块的整合. 测试效果,
    // .接受测试数据 根据要求收集数据.
    // 这是我最新的设计, 首先需要设置枚举来表示新的状态来显示出来在那些地方可以如此,
    
    [self.symbolTest removeFromSuperview];
    NSString *title = @"斯特鲁普测试";
    NSString *message = @"您将马上开始斯特鲁普测验\n\n本测验的目的是对词语和颜色做出反应\n\n本测验有三部分组成\n\n这是斯特鲁普测验的第一部分.\n\n一看到屏幕上显示一个词语,您就立即点击屏幕.\n\n所有词语都将是颜色的名称.\n\n现在,您将进行斯特鲁普测验的第一部分.\n\n一看到屏幕上显示一个词语,您就立即点击屏幕.\n\n本测验将测验您的反应速度";
    NSString *end = @"双击屏幕以继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentSimplifyStroopTests];
    
    /**
     *  1.特殊情况是在 某些状态下面 点击屏幕 会展示新的信息 而不是直接开始,
     *  2.所以需要一个特殊的方法去完成这个操作.
     */
    
    
}


#pragma mark - StroopTestsDelegate

-(void)StroopTests:(StroopTests *)test clickScreenWithModel:(StroopModel *)model andCurrentCount:(NSInteger)count andClickTime:(float)currentTime{
    
    if (self.JSTestCurrentState == JSTestCurrentSimplifyStroopTests) {
        if (self.lastOne!=count) {
            [self.testsList.SimplifyTime addObject:@(currentTime)];
            JSLog(@"%f",currentTime);
        }
    }
    if (self.JSTestCurrentState == JSTestCurrentComplicationStroopTests) {
        
        if (self.lastOne!=count && [[model colorForText] isEqual:model.textColor]) {
            [self.testsList.ComplicationTime addObject:@(currentTime)];
        }
        
    }
    if (self.JSTestCurrentState == JSTestCurrentInContrastStroopTests) {
        
        if (self.lastOne!=count && ![[model colorForText] isEqual:model.textColor]) {
            [self.testsList.InContrastTime addObject:@(currentTime)];
        }
        
    }
    self.lastOne = count;
}

-(void)StroopTestsDidFinsihSimplifyTest:(StroopTests *)test{
    NSString *title = @"斯特鲁普测试";
    NSString *message = @"这是斯特鲁普测验的第二部分.\n\n只有当词语的颜色与该词语 所描述的颜色名称相符时,才点击屏幕.\n\n现在,您将练习斯特鲁普测验的第二部分";
    NSString *end = @"双击屏幕以继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentComplicationStroopTests];
    
}

-(void)StroopTestsDidFinsihComplicationTest:(StroopTests *)test{
    NSString *title = @"斯特鲁普测试";
    NSString *message = @"";
    NSString *end = @"双击屏幕以继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentInContrastStroopTests];
    
}

-(void)StroopTestsDidFinsihInContrastTest:(StroopTests *)test{

    
    [self.stroopTest removeFromSuperview];
    
    NSString *title = @"注意力转移测试";
    NSString *message = @"现在,您将进行注意力转移测验.\n\n本测验的目的是根据测验规则来匹配颜色和形状.\n\n 屏幕顶部将显示一个彩色正方形或圆形以及测验规则--'匹配颜色'或'匹配形状'\n\n屏幕底部将显示两个形状.请根据规则,通过点击屏幕的方式作出反应\n\n对每一个屏幕,您将有了两秒钟的时间做出反应.\n\n将会测量您的速度和准确度.";
    NSString *end = @"双击屏幕继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentShiftingAttentionTests];
    
}

#pragma mark - ShiftingAttentionTestsDelegate

-(void)ShiftingAttentionTests:(ShiftingAttentionTests *)test clickInCount:(NSInteger)count clickIsRight:(BOOL)isRight andClickPTime:(float)timetravel{
    if (self.lastOne != count && isRight) {
        self.testsList.trueReatctiionTime+=timetravel;
        self.testsList.trueCount++;
        JSLog(@"yes");
    }else if (self.lastOne != count &&!isRight) {
        self.testsList.wrongCount ++;
        JSLog(@"no");
    }
    
}

-(void)ShiftingAttentionTestsDidFinsih:(ShiftingAttentionTests *)test{
    
    NSString *title = @"持续性操作测验";
    NSString *message = @"您将马上开始持续性操作测验.本测验的目的是仅对字母表中的特定字母做出反应.字母表中的不同字母将在屏幕上闪烁.当您看到字母'b'时,请尽快点击屏幕,如果您看到'b'意外的其他字母,请不要做任何操作.";
    NSString *end = @"双击屏幕继续";
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentContinuousPerformanceTests];
    
}

#pragma mark - jiekaimaneijiudeyaohai

-(void)ContinuousPerformanceTests:(ContinuousPerformanceTests *)test didClickWithCount:(NSInteger)count andWords:(NSString *)word andTimeTravel:(float)time{
    if (([word isEqualToString:@"b"]||[word isEqualToString:@"B"]) && self.lastOne!= count) {
        self.testsList.CPTTime += time;
        self.testsList.CPTTrueCount++;
    }else if (self.lastOne != count ){
        self.testsList.CPTWrongCount++;
    }
}

-(void)ContinuousPerformanceTests:(ContinuousPerformanceTests *)test didFinishWithTime:(float)time{
    
    
    /**
     *  所有测试都已经完成后的回调;
     */
    
    
}
@end
