//
//  BBSInfoListCell.h
//  CNS
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "JSBbsInfoModel.h"

@interface BBSInfoListCell : UITableViewCell


@property (nonatomic,retain) UIView *backV;
@property(nonatomic,retain) JSBbsInfoModel *model;

+(BBSInfoListCell*)cellForTableview:(UITableView*)tableview;


@end
