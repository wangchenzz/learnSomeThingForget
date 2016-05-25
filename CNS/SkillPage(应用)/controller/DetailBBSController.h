//
//  DetailBBSController.h
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSBbsInfoModel.h"

#import "answerModel.h"
#import "detailInfoCell.h"

#import "detailBBSmodel.h"

#import "addCommentController.h"

@interface DetailBBSController : UIViewController

@property (nonatomic,retain) JSBbsInfoModel *basicModel;

@property (nonatomic,retain) UITableView *tableView;


@end
