//
//  answerModel.m
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "answerModel.h"

@implementation answerModel

-(void)getFrame{
    CGFloat BJ = 15;
    
    _commentHeaderImageRect = CGRectMake(BJ, BJ, 30, 30);
    
    
    _commentLoginNameRect = CGRectMake(30+ 2 *BJ, BJ, JSFrame.size.width - 3 * BJ - 30, 30);
    
    NSMutableDictionary *diction = [NSMutableDictionary dictionary];
    diction[NSFontAttributeName] = commentContentFont;
    
    
    CGRect commentContentRect = [_commentContent boundingRectWithSize:CGSizeMake(_commentLoginNameRect.size.width - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:diction context:nil];
    
    _commentContentRect = CGRectMake(BJ+30, CGRectGetMaxY(_commentLoginNameRect) + BJ, commentContentRect.size.width, commentContentRect.size.height);
    
    _commentCreattimeRect = CGRectMake(BJ + 30, CGRectGetMaxY(_commentContentRect) + BJ, JSFrame.size.width - BJ - 30 , 15);
    
    
    self.commentTotalHeight = CGRectGetMaxY(_commentCreattimeRect) + BJ;
    
    /**
     *  评论完成现在是回复;
     */
    
    if (![self.answerLoginName isEqual:[NSNull null]]) {
        
        _isAnswer = YES;
        
        NSString *blueStr = [NSString stringWithFormat:@"%@: ",_answerLoginName];
        
        _answerString = [[NSMutableAttributedString alloc] initWithString:blueStr];
        
        [_answerString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, blueStr.length)];
        
        
        NSString *realStr = [NSString stringWithFormat:@"回复 %@ :%@",_commentLoginName,_answerContent];
        
        NSMutableAttributedString *real = [[NSMutableAttributedString alloc] initWithString:realStr];
        
          [real addAttribute:NSForegroundColorAttributeName value:JSContentTextColor range:NSMakeRange(0, real.length)];
        
        [_answerString insertAttributedString:real atIndex:_answerString.length];
        
        [_answerString addAttribute:NSFontAttributeName value:anserContentFont range:NSMakeRange(0, _answerString.length)];
        
        CGRect answerStringBound = [_answerString boundingRectWithSize:CGSizeMake(_commentCreattimeRect.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        
        self.answerRect = CGRectMake(self.commentContentRect.origin.x, _commentTotalHeight + 5, answerStringBound.size.width, answerStringBound.size.height);
    
        
        self.answerTotalHeight = self.answerRect.size.height + BJ;
        
    }
}

@end
