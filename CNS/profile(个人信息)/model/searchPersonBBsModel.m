//
//  searchPersonBBsModel.m
//  CNS
//
//  Created by Mac on 16/5/30.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "searchPersonBBsModel.h"

@implementation searchPersonBBsModel


-(void)setBasicModel:(JSBbsInfoModel *)basicModel{
    _basicModel = basicModel;
    
    CGFloat xbj = 17;
    CGFloat ybj = 18;
    CGFloat bbj = 13;

    
    NSMutableDictionary *titleDic = [NSMutableDictionary dictionary];
    titleDic[NSFontAttributeName] = titleFont;
    CGRect title = [_basicModel.title boundingRectWithSize:CGSizeMake(JSFrame.size.width - 60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:titleDic context:nil];
    
    _titleRect = CGRectMake(xbj, ybj, title.size.width, title.size.height);
    
    _isReadingImageRect = CGRectMake(JSFrame.size.width - 30, (ybj+CGRectGetMaxY(_titleRect))/2, 10, 10);
    
    
    NSInteger index = [_basicModel.type integerValue];
    
    
    NSString *typeStr = @[@"",@"注意力",@"社交能力",@"记忆力",@"阿斯伯格",@"反应能力",@"睡眠",@"冥想"][index - 1];
    
    self.typeStr = typeStr;
    
    NSMutableDictionary *typeDic = [NSMutableDictionary dictionary];
    titleDic[NSFontAttributeName] = typeFont;

    
    CGRect type = [typeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:typeDic context:nil];
    
    
    _typeLabelRect = CGRectMake(xbj, CGRectGetMaxY(_titleRect) + bbj, type.size.width+4, type.size.height+2);
    
    
    NSMutableDictionary *numDic = [NSMutableDictionary dictionary];
    
    numDic[NSFontAttributeName] = tolFont;
    
    CGRect numRect = [_basicModel.pCount boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:numDic context:nil];
    
    
    _commentNumRect = CGRectMake(JSFrame.size.width - xbj - numRect.size.width, _typeLabelRect.origin.y, numRect.size.width, numRect.size.height);
    

    _iconPoint = CGRectMake(_commentNumRect.origin.x - 10 - 15, _commentNumRect.origin.y, 15, 15);

    
    _totalHeight = CGRectGetMaxY(_commentNumRect) + ybj;
    
    
}



@end
