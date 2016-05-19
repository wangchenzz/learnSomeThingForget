//
//  commentCell.h
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "JSComentModel.h"


@interface commentCell : UITableViewCell


@property (nonatomic,strong) JSComentModel *model;

+(commentCell*)cellForTableview:(UITableView*)tableview;

@end
