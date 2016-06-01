//
//  searchPersonBBsModel.h
//  CNS
//
//  Created by Mac on 16/5/30.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSBbsInfoModel.h"

#define titleFont JSFont(17)

#define typeFont JSFont(12)

#define tolFont JSFont(14)

@interface searchPersonBBsModel : NSObject

@property (nonatomic,retain) JSBbsInfoModel *basicModel;

/**
 *  0表示没看过, 1表示看过
 */
@property (nonatomic,copy) NSString *state;

@property (nonatomic,copy) NSString *typeStr;

@property (nonatomic,assign) CGRect titleRect;

@property (nonatomic,assign) CGRect isReadingImageRect;

@property (nonatomic,assign) CGRect typeLabelRect;

@property (nonatomic,assign) CGRect iconPoint;

@property (nonatomic,assign) CGRect commentNumRect;

@property (nonatomic,assign) CGFloat totalHeight;

@end
