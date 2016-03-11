//
//  SymbolAndDigit.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "SymbolAndDigit.h"

@interface SymbolAndDigit ()<JSKeyBoardViewDelegate>


@property (nonatomic,strong) NSMutableArray *textFileArray;



@end

@implementation SymbolAndDigit

-(instancetype)initWithStyle:(SymbolAndDigitStyle)style{
    
    if (self = [super initWithFrame:CGRectMake(0, 0, 120, 480)]) {
        
        
        [self setUpIni];
        
        self.style = style;
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        
        self.layer.shadowOffset = CGSizeMake(-8, 8);
        
        self.layer.shadowOpacity = 0.8;
        
        //        self.layer.shadowRadius = 5;
        
    }
    return self;
}

-(NSMutableArray *)textFileArray{
    
    if (!_textFileArray) {
        self.textFileArray = [@[self.view_number2,self.view_number3,self.view_number4,self.view_number5,self.view_number6,self.view_number7,self.view_number8,self.view_number9] mutableCopy];
    }
    return _textFileArray;
}

-(void)setStyle:(SymbolAndDigitStyle)style{
    
    if (_style != style) {
        _style = style;
        
        if (self.style == SymbolAndDigitStyleShow) {
            [self.view_number2.digitView setText:@"2"];
            self.view_number2.digitView.enabled = NO;
            
            [self.view_number3.digitView setText:@"3"];
            self.view_number3.digitView.enabled = NO;
            
            [self.view_number4.digitView setText:@"4"];
            self.view_number4.digitView.enabled = NO;
            
            [self.view_number5.digitView setText:@"5"];
            self.view_number5.digitView.enabled = NO;
            
            [self.view_number6.digitView setText:@"6"];
            self.view_number6.digitView.enabled = NO;
            
            [self.view_number7.digitView setText:@"7"];
            self.view_number7.digitView.enabled = NO;
            
            [self.view_number8.digitView setText:@"8"];
            self.view_number8.digitView.enabled = NO;
            
            [self.view_number9.digitView setText:@"9"];
            self.view_number9.digitView.enabled = NO;
            
        }else{
            
            JSKeyBoardView *keyBoard = [[JSKeyBoardView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            for (DiamandsView *text in self.textFileArray) {
                text.digitView.inputView = keyBoard;
            }
            
            keyBoard.delegate = self;
            
        }
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    for (DiamandsView *v in self.textFileArray) {
//        if (v.digitView.enabled) {
//            [v.digitView becomeFirstResponder];
//        }
//    }
    
    for (int i = 0 ; i < 8; i ++ ) {
        DiamandsView *v = self.textFileArray[i];
        if (v.digitView.enabled) {
            [v.digitView becomeFirstResponder];
            return;
        }
    }
}

-(void)setUpIni{
    
    self.view_number2 = [DiamandsView getView];
    self.view_number3 = [DiamandsView getView];
    self.view_number4 = [DiamandsView getView];
    self.view_number5 = [DiamandsView getView];
    self.view_number6 = [DiamandsView getView];
    self.view_number7 = [DiamandsView getView];
    self.view_number8 = [DiamandsView getView];
    self.view_number9 = [DiamandsView getView];
    
    self.view_number2.y = 0;
    self.view_number3.y = 60;
    self.view_number4.y = 120;
    self.view_number5.y = 180;
    self.view_number6.y = 240;
    self.view_number7.y = 300;
    self.view_number8.y = 360;
    self.view_number9.y = 420;
    
    for (DiamandsView *text in self.textFileArray) {
        text.digitView.height =60;
        text.digitView.width = 120;
        [self addSubview:text];
    }
    
}


-(void)setModel:(SymbolDigitsModel *)model{
    
    if (_model != model) {
        _model = model;
        self.view_number2.symbolView.image = [UIImage imageNamed:_model.ImageName_2];
        self.view_number3.symbolView.image = [UIImage imageNamed:_model.ImageName_3];
        self.view_number4.symbolView.image = [UIImage imageNamed:_model.ImageName_4];
        self.view_number5.symbolView.image = [UIImage imageNamed:_model.ImageName_5];
        self.view_number6.symbolView.image = [UIImage imageNamed:_model.ImageName_6];
        self.view_number7.symbolView.image = [UIImage imageNamed:_model.ImageName_7];
        self.view_number8.symbolView.image = [UIImage imageNamed:_model.ImageName_8];
        self.view_number9.symbolView.image = [UIImage imageNamed:_model.ImageName_9];
    }
}


#pragma mark - delegate

-(void)numberKeyBoardInput:(NSInteger)number{
    
    for (DiamandsView *text in self.textFileArray) {
        
        if (text.digitView.editing) {
            text.digitView.text = [NSString stringWithFormat:@"%ld",number];
            [text.digitView resignFirstResponder];
            [text.digitView setEnabled:NO];
        }
        if (text.digitView.enabled) {
            [text.digitView becomeFirstResponder];
            return;
        }else if (text == self.view_number9){
        
            DebugLog(@"123123");
            
            JSFunc;
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"endOfText" object:nil];
            
        }
    }
}


@end
