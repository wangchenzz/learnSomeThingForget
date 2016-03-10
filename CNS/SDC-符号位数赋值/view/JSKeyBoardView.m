//
//  JSKeyBoardView.m
//  CNS
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSKeyBoardView.h"


#define lineSpce 15

@implementation JSKeyBoardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self customView:frame];
    }
    return self;
}

- (void)customView:(CGRect)frame
{
    
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat kwidth = JSFrame.size.width;
    
    self.frame = CGRectMake(0, 0, kwidth, 150.0f);
    
    CGFloat buttonWidth =(kwidth - 5 * lineSpce) / 4.0;
    
    CGFloat buttonHeigh = (self.height - 3 *lineSpce) / 2.0;
    
    // set the frame
    
    
    // add the button
    for (int x = 0; x < 8; x++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTag:x + 2];
        
        btn = ({
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:30];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            
            btn.layer.cornerRadius = 5;
            
//            btn.layer.masksToBounds = YES;
            
//            btn.layer.borderColor = [UIColor blackColor].CGColor;
//            
//            btn.layer.borderWidth = 1;
            
            btn.layer.shadowColor = [UIColor blackColor].CGColor;
            
            btn.layer.shadowOffset = CGSizeMake(-6, 6);
            
            btn.layer.shadowOpacity = 0.9;
    
            btn;
        });
        
        
        if (x < 4) {
            btn.frame = CGRectMake(buttonWidth * x + lineSpce * (x +1), lineSpce, buttonWidth, buttonHeigh);
        }else{
            
            int parmX = x - 4;
            
            btn.frame = CGRectMake(buttonWidth * parmX + lineSpce * (parmX +1), lineSpce * 2+ buttonHeigh, buttonWidth, buttonHeigh);
        }
        
        [btn setTitle:[NSString stringWithFormat:@"%ld",btn.tag] forState:UIControlStateNormal];
        
        btn.adjustsImageWhenHighlighted = TRUE;
        
        [btn addTarget:self action:@selector(numbleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
       
        [self addSubview:btn];
    }
}

- (void)numbleButtonClicked:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    
    NSInteger number = btn.tag;
    
    
    
    // no delegate, print log info
    if (nil == _delegate)
    {
        DebugLog(@"button tag [%ld]",(long)number);
        return;
    }
    
    if (number <= 9 && number >= 0)
    {
        [_delegate numberKeyBoardInput:number];
        return;
    }
}

@end
