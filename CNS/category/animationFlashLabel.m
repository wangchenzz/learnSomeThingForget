//
//  animationFlashLabel.m
//  1.5-2015
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "animationFlashLabel.h"
@interface animationFlashLabel ()



@property (nonatomic,retain) NSMutableArray *textArray;

@property (nonatomic,retain) NSTimer *acitonTimer;

@property (nonatomic,copy) NSString *inputString;

@property (nonatomic,assign) BOOL isAnimation;

@property (nonatomic,copy)void(^conpletion)(BOOL finsih) ;

@property (nonatomic,assign) NSInteger currentCount;



@property (nonatomic,retain) CADisplayLink *cad;

@end

@implementation animationFlashLabel
-(instancetype)init{
    if (self = [super init]) {
        
        [self setUpNew];
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpNew];
        
    }
    return self;
}

-(void)setUpNew{
    
    self.isAnimation = NO;
    
    self.inputString = [NSString string];
    
    
    self.adjustsFontSizeToFitWidth = YES;//调整基线位置需将此属性设置为YES
    
    self.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    
    _cad = [CADisplayLink displayLinkWithTarget:self selector:@selector(writeT)];
    
    [_cad addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    _cad.paused = YES;
    
    
}

-(void)setWillShowText:(NSString *)willShowText{
    
    self.textArray = nil;
    
    if (_willShowText != willShowText) {
        _willShowText = willShowText;
        NSInteger count = _willShowText.length;
        
        for (int i = 0 ; i < count; i ++) {
            
            NSRange range = NSMakeRange(0, i+1);
            NSString *oneStering = [_willShowText substringWithRange:range];
            [self.textArray addObject:oneStering];
        }
    }
}


-(NSMutableArray *)textArray{
    
    if (!_textArray) {
        self.textArray = [NSMutableArray array];
    }
    return _textArray;
}

-(void)showAnimation:(float)animationSpace completion:(void (^)(BOOL))completion{
    _isAnimation = YES;
    self.currentCount = 0;
    self.inputString = @"";
    self.conpletion = completion;
    
    _cad.frameInterval = 1;
    
    _cad.paused = NO;
}

-(void)writeT{
    
    if (self.currentCount >= _textArray.count) {
        
        _cad.paused = YES;
        
        if (self.conpletion) {
            self.conpletion(_isAnimation);
        }
    }else{
        
        
        self.inputString = self.textArray[self.currentCount];
        
        
        [self setText:self.inputString];
        
        
        self.currentCount ++;
        
    }
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    //    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    /**
     *  这个方法得到 字的 的位置;
     */
    
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            /**
             *  上对齐
             */
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    
    [super drawTextInRect:actualRect];
}

@end
