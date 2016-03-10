//
//  DiamandsView.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "DiamandsView.h"

@implementation DiamandsView


+(instancetype)getView{

    DiamandsView *vi = [[NSBundle mainBundle]loadNibNamed:@"diamondsXib" owner:nil options:nil].firstObject;
    
    vi.symbolView.layer.borderColor = [[UIColor blackColor]CGColor];
    
    vi.symbolView.layer.borderWidth = 1.0;
    vi.digitView.layer.borderColor = [[UIColor blackColor]CGColor];
    
    vi.digitView.layer.borderWidth = 1.0;
    
    JSKeyBoardView *keyBoard = [[JSKeyBoardView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    vi.digitView.inputView = keyBoard;

//    keyBoard.delegate = self;
    
    return vi;
}

//
//-(void)numberKeyBoardInput:(NSInteger)number{
//
//    
//}



@end
