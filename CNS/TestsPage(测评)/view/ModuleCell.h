//
//  ModuleCell.h
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModuleCell : UITableViewCell

@property (nonatomic,retain) UIImageView *mainImage;

@property (nonatomic,retain) UIImageView *backImage;

@property (nonatomic,retain) UILabel *nameLabel;

+(ModuleCell*)cellForTableview:(UITableView*)tableview;



@end
