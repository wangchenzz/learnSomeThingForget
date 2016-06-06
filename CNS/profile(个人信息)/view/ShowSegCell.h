//
//  ShowSegCell.h
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShowSegModel.h"

@interface ShowSegCell : UITableViewCell<JSModelCell>

@property (nonatomic,retain) ShowSegModel *model;

@property (nonatomic,retain) UIImageView *headerImageView;

@property (nonatomic,retain) UILabel *nameLabel;

@property (nonatomic,retain) UILabel *contentLabel;

@property (nonatomic,retain) UILabel *timeLabel;



@end
