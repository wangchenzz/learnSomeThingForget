//
//  ShowPersonnalBBSCell.h
//  CNS
//
//  Created by Mac on 16/5/30.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "searchPersonBBsModel.h"

@interface ShowPersonnalBBSCell : UITableViewCell

@property (nonatomic,retain) searchPersonBBsModel *frameModel;


+(ShowPersonnalBBSCell*)cellForTableview:(UITableView*)tableview;


@end
