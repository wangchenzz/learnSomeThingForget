//
//  commentCell.m
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "commentCell.h"

@interface commentCell ()

@property (nonatomic,retain) UIImageView *headImageView;

@property (nonatomic,retain) UILabel *userNameLabel;

@property (nonatomic,retain) UILabel *userCommentLabel;

@end

@implementation commentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _headImageView = [[UIImageView alloc] init];
        
        _userNameLabel = [[UILabel alloc] init];
        
        _userCommentLabel = [[UILabel alloc] init];

        /**
         *  设置各种属性
         */
    }
    return self;
}

+(commentCell*)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"commentCell";
    
    commentCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[commentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



@end
