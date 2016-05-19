//
//  newsDtailCell.h
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "JSNewsFrameModel.h"




@interface newsDtailCell : UITableViewCell

@property (nonatomic,strong) JSNewsFrameModel *model;



+(newsDtailCell*)cellForTableview:(UITableView*)tableview;

@end
