//
//  detailBBSmodel.h
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSBbsInfoModel.h"

#define BBStitleFont [UIFont boldSystemFontOfSize:19]

#define bbsTitleContentFont JSFont(15)

@interface detailBBSmodel : NSObject

@property (nonatomic,retain) JSBbsInfoModel *basicModel;

@property (nonatomic,assign) CGRect headerRect;

@property (nonatomic,assign) CGRect userNameRect;

@property (nonatomic,assign) CGRect titleRect;

@property (nonatomic,assign) CGRect contentRect;

@property (nonatomic,assign) CGRect timeRect;

@property (nonatomic,assign) CGFloat totalHeight;

@end
