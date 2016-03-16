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

typedef NS_ENUM(NSInteger,JSTestCurrentState) {
    
    JSTestCurrentLanguageShow  =  1,
    JSTestCurrentLanguageImmediate,
    JSTestCurrentLanguageDelaye,
    JSTestCurrentVisualShow ,
    JSTestCurrentVisualImmediate,
    JSTestCurrentVisualDelaye,
    JSTestCurrentClickTestLeft,
    JSTestCurrentClickTestRight ,
    JSTestCurrentSymbolTest
    
};

@interface FirstViewController ()<JSLanguageAttentionTestsDelegate,JSVisualAttentionTestsDelegate,JSFgClickTestsDelegate,SymbolDigitCodingTestsDelegate>

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
}
-(void)clickIn{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
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
                        
                        self.JSTestCurrentState = JSTestCurrentLanguageShow;
                        
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


-(void)beginFirstTest{
    
    [self.titleLabel removeFromSuperview];
    
    [self.endLabel removeFromSuperview];
    
    [self.messageLabel removeFromSuperview];
    
    self.titleLabel.text =@"";
    self.messageLabel.text =@"";
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
    JSLog(@"%ld",(long)count);
    
}

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsihTests:(JSLanguageAttentionModel *)model{
    
    NSString *title = @"图像注意测验";
    NSString *message = @"您将马上开始视觉记忆测验.\n\n本测验的目的是记忆图像.\n\n将向你展示一系列图像,但一次只能看到一副.尽最大努力记住这些图像,因为不久后您将被要求挑选出您刚见过的图像.\n\n您将看到所需记忆的15幅图像.\n\n每一幅图像都将显示两秒钟";
    NSString *end = @"双击屏幕继续";
    
    [self viewWithTheTitle:title withMessage:message withEnd:end andJSTestCurrentState:JSTestCurrentVisualShow];
    
}

#pragma mark -- JSVisualAttentionTestsDelegate

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didClickScreen:(JSVisualAttentionModel *)model withCurrentCount:(NSInteger)count{
    
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
    
    return 2;
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
    
    JSLog(@"%ld______%ld",currentCount,clickCount);
}

#pragma mark - SymbolDigitCodingTestsDelegate;

-(void)SymbolDigitCodingTests:(SymbolDigitCodingTests *)test didFinsihTestWithModelArray:(NSMutableArray *)array{
    
    JSPresentBut *butt = [[JSPresentBut alloc] init];
    
    [butt show];
    
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


@end
