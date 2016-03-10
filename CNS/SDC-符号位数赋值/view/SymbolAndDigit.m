//
//  SymbolAndDigit.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "SymbolAndDigit.h"

@interface SymbolAndDigit ()




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
    
    self.view_number2.width =  120;
    self.view_number3.width =  120;
    self.view_number4.width =  120;
    self.view_number5.width =  120;
    self.view_number6.width =  120;
    self.view_number7.width =  120;
    self.view_number8.width =  120;
    self.view_number9.width =  120;
    
    self.view_number2.height = 60;
    self.view_number3.height = 60;
    self.view_number4.height = 60;
    self.view_number5.height = 60;
    self.view_number6.height = 60;
    self.view_number7.height = 60;
    self.view_number8.height = 60;
    self.view_number9.height = 60;

    
    self.view_number2.y = 0;
    self.view_number3.y = 60;
    self.view_number4.y = 120;
    self.view_number5.y = 180;
    self.view_number6.y = 240;
    self.view_number7.y = 300;
    self.view_number8.y = 360;
    self.view_number9.y = 420;
    
    [self addSubview:self.view_number2];
    [self addSubview:self.view_number3];
    [self addSubview:self.view_number4];
    [self addSubview:self.view_number5];
    [self addSubview:self.view_number6];
    [self addSubview:self.view_number7];
    [self addSubview:self.view_number8];
    [self addSubview:self.view_number9];
    
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




@end
