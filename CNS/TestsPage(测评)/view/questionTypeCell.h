//
//  questionTypeCell.h
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "starView.h"

@interface questionTypeCell : UITableViewCell


@property (nonatomic,retain) starView *difficuleStar;

@property (nonatomic,retain) UILabel *numberLabel;

@property (nonatomic,retain) UILabel *titleLabel;

@property (nonatomic,retain) UIButton *beginButton;


+(questionTypeCell*)cellForTableview:(UITableView*)tableview;



@end
