//
//  NewsCell.h
//  CNS
//
//  Created by Mac on 16/5/11.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSNewsModel.h"

@interface NewsCell : UITableViewCell

@property (nonatomic,strong) JSNewsModel *model;

+(NewsCell*)cellForTableview:(UITableView*)tableview;
@end
