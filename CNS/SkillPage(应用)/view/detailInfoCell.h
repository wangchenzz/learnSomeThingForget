//
//  detailInfoCell.h
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "answerModel.h"

#import "detailBBSmodel.h"

@interface detailInfoCell : UITableViewCell

@property (nonatomic,retain) NSObject *obj;

+(detailInfoCell*)cellForTableview:(UITableView*)tableview;

@end
