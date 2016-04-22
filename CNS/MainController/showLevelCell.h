//
//  showLevelCell.h
//  CNS
//
//  Created by Mac on 16/4/21.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface showLevelCell : UITableViewCell

@property (nonatomic,retain) UILabel *nameLabel;

@property (nonatomic,retain) UILabel *valueLabel;


+(instancetype)cellForTableview:(UITableView*)tableview;

@end
