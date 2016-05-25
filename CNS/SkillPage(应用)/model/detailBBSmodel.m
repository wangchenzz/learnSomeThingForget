//
//  detailBBSmodel.m
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "detailBBSmodel.h"

@implementation detailBBSmodel


-(void)setBasicModel:(JSBbsInfoModel *)basicModel{
    _basicModel = basicModel;
//    @property (nonatomic,assign) CGRect headerRect;
//    
//    @property (nonatomic,assign) CGRect userNameRect;
//    
//    @property (nonatomic,assign) CGRect titleRect;
//    
//    @property (nonatomic,assign) CGRect contentRect;
//    
//    @property (nonatomic,assign) CGRect timeRect;

    
    
    CGFloat BJ = 15;
    
    CGFloat LBJ = 10;
    
    CGFloat imageWidth = 40;
    
    self.headerRect = CGRectMake(BJ, BJ, imageWidth, imageWidth);
    
    self.userNameRect = CGRectMake(BJ + imageWidth + BJ, BJ, JSFrame.size.width - 2 * BJ - imageWidth, BJ);

    self.timeRect = CGRectMake(_userNameRect.origin.x, CGRectGetMaxY(_userNameRect)+5, _userNameRect.size.width, _userNameRect.size.height);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = BBStitleFont;
    

    
    CGRect titleBound = [self.basicModel.title boundingRectWithSize:CGSizeMake(JSFrame.size.width - 2 * BJ, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    self.titleRect = CGRectMake(BJ, CGRectGetMaxY(_headerRect) + LBJ, titleBound.size.width, titleBound.size.height);
    
    /**
     *  正文
     */
    
    NSMutableDictionary *dicContent = [NSMutableDictionary dictionary];
    dicContent[NSFontAttributeName] = bbsTitleContentFont;
    
    
    
    CGRect contentBound = [self.basicModel.content boundingRectWithSize:CGSizeMake(JSFrame.size.width - 2 * BJ, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dicContent context:nil];
    
    self.contentRect = CGRectMake(BJ, CGRectGetMaxY(_titleRect) + LBJ, contentBound.size.width, contentBound.size.height);
    
    self.totalHeight = CGRectGetMaxY(self.contentRect) + 15;
}

@end
