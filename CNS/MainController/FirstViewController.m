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

#import "SymbolAndDigit.h"

@interface FirstViewController ()<JSLanguageAttentionTestsDelegate,JSVisualAttentionTestsDelegate,JSFgClickTestsDelegate>

@property (nonatomic,retain) JSPresentBut *flashButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
//    JSLanguageAttentionTests *te = [JSLanguageAttentionTests test];
//    
//    te.delegate = self;
//    
//    te.frame = self.view.frame;
//    
//    [self.view addSubview:te];
//    [te show];
  
    /**
     *  _______________________==================================______________________
     */
//    JSVisualAttentionTests *test = [JSVisualAttentionTests test];
//    
//    [self.view addSubview:test];
//    
//    test.frame = self.view.bounds;
//    
//    test.delegate =self;
//    
//    [test show];
    
    /**
     *  _______________________==================================______________________
     */
    
//    JSFgClickTests *test = [JSFgClickTests test];
//    test.frame = JSFrame;
//    
//    [self.view addSubview:test];
//    
//    test.delegate = self;
//    
//    [test show
//     ];

    /**
     *_________________________==================================_______________________
     */
    
//    DiamandsView *vi = [DiamandsView getView];
//    
//    [self.view addSubview:vi];
//    
//    vi.y = 200;
    
    SymbolAndDigit *dig = [[SymbolAndDigit alloc] initWithStyle:SymbolAndDigitStyleShow];
    
    dig.x = 50;
    
    dig.y = 80;
    
    [self.view addSubview:dig];
    
    
    SymbolAndDigit *digtest = [[SymbolAndDigit alloc] initWithStyle:SymbolAndDigitStyleTest];
    
    digtest.x = 250;
    
    digtest.y = 80;
    
    [digtest setTag:1];
    
    [self.view addSubview:digtest];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:1 animations:^{
        
        SymbolAndDigit *digtest = (SymbolAndDigit *)[self.view viewWithTag:1];
        
        digtest.height = 450;
    }];
    
    
}

#pragma mark -- JSLanguageAttentionTestsDelegate

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsiShowWord:(JSLanguageAttentionModel *)model{

    [test showTestWords];
}

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didClickScreen:(JSLanguageAttentionModel *)model withCurrentCount:(NSInteger)count{
    JSLog(@"%ld",(long)count);
    
}

-(void)JSLanguageAttentionTests:(JSLanguageAttentionTests *)test didFinsihTests:(JSLanguageAttentionModel *)model{

    
}

#pragma mark -- JSVisualAttentionTestsDelegate

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didClickScreen:(JSVisualAttentionModel *)model withCurrentCount:(NSInteger)count{

}

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)tests didFinishShowRightImage:(JSVisualAttentionModel *)model{

}

-(void)JSVisualAttentionTests:(JSVisualAttentionTests *)test didFinsihTests:(JSVisualAttentionModel *)model{


}


#pragma mark - JSFgClickTestsDelegate;

-(NSString *)JSFgClickTests:(JSFgClickTests *)test titleForTipsInCount:(NSInteger)Count{

    return @"请用你的左手食指点击屏幕,看到'停'字,请停止";

}

-(NSInteger)JSFgClickTests:(JSFgClickTests *)test timeTravelForCount:(NSInteger)count{
    
    /**
     *  崔斯特姆. 李奥瑞克.赫拉蒂姆 组织. 泰瑞尔天使. 奈非天. 迪亚波罗 - 墨菲斯托 - 巴尔 . 维斯特玛 .
     */

    return 5;

}

-(NSInteger)numberOfTestsCountInJSFgClickTests:(JSFgClickTests *)test{

    return 2;
}

-(void)DidFinsihAllTest:(JSFgClickTests *)test{

    JSLog(@"finish");
    
}

-(void)JSFgClickTests:(JSFgClickTests *)test clickCountForCurrentCount:(NSInteger)currentCount andClickCount:(NSInteger)clickCount{

    JSLog(@"%ld______%ld",currentCount,clickCount);
}



@end
