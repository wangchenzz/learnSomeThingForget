//
//  JSComentModel.m
//  CNS
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSComentModel.h"

@implementation JSComentModel


+(instancetype)modelForDic:(NSDictionary *)dic{

    JSComentModel * model = [[self alloc] init];
    model.loginName = dic[@"nickName"];
    model.contentMent = dic[@"content"];
    model.creatTime = dic[@"createtime"];
    model.HeadImageUrlStr = dic[@"img"];
    
    [model getFrame];
    
    return model;
}

-(void)getFrame{
    CGFloat bj = 8;
    
    self.headImageRect = CGRectMake(bj, bj, 45, 45);
    
    self.nameLabelRect = CGRectMake(CGRectGetMaxX(self.headImageRect)+bj, bj, 300, 22.5);
    
    self.timeLabelRect = CGRectMake(self.nameLabelRect.origin.x, 37, 300, 16);
    
    CGFloat contentY = CGRectGetMaxY(self.headImageRect) + bj;
    
    CGFloat contentX = self.nameLabelRect.origin.x;
    
    CGFloat contentWidth = JSFrame.size.width - contentX - bj;
    
    NSMutableDictionary *diccomment = [NSMutableDictionary dictionary];
    diccomment[NSFontAttributeName] = contentCommentFont;
    
    CGRect commentrect = [self.contentMent boundingRectWithSize:CGSizeMake(contentWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:diccomment context:nil];

    CGFloat contentHeight = commentrect.size.height;
    
    self.contentLabelRect = CGRectMake(contentX, contentY, contentWidth, contentHeight);
    
    
    self.totalHeight = CGRectGetMaxY(self.contentLabelRect) + bj;
    
}

@end
