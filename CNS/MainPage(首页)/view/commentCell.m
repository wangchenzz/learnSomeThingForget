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

@property (nonatomic,retain) UILabel *creatTimeLabel;

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
        
        _creatTimeLabel = [[UILabel alloc] init];
        
        _userCommentLabel = [[UILabel alloc] init];

        /**
         *  设置各种属性的
                这里暂时还没有设置头像的各种属性
         */
        
        _userNameLabel.font = titleCommentFont;
        
        _userNameLabel.textColor = JSTitleColor;
        
        _creatTimeLabel.font = timeFont;
        
        _creatTimeLabel.textColor = JSContentDescColor;
        
        _userCommentLabel.font = contentCommentFont;
        
        _userCommentLabel.numberOfLines =0;
        
        _userCommentLabel.textColor = JSContentTextColor;
        
        
        [self.contentView addSubview:_userCommentLabel];
        
        [self.contentView addSubview:_creatTimeLabel];
    
        [self.contentView addSubview:_userNameLabel];
        
        
        /**
         *  头像,
         */
        
        _headImageView = [[UIImageView alloc] init];
        
        _headImageView.width = _headImageView.height = 45;
        
        _headImageView.layer.cornerRadius = 22.5;
        
        _headImageView.layer.masksToBounds = YES;
        
        
        [self.contentView addSubview:_headImageView];
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(void)gongxiwe{
    
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

-(void)setModel:(JSComentModel *)model{
    if (model !=_model) {
        _model = model;
        
        self.userNameLabel.text = _model.loginName;
        self.userNameLabel.frame = _model.nameLabelRect;
        
        
        self.creatTimeLabel.text = _model.creatTime;
        self.creatTimeLabel.frame = _model.timeLabelRect;
        
        
        self.userCommentLabel.text = _model.contentMent;
        self.userCommentLabel.frame = _model.contentLabelRect;
        
        self.headImageView.frame = _model.headImageRect;
        
        NSString *imageStr = [NSString stringWithFormat:@"%@%@",basicUrlStr,_model.HeadImageUrlStr];
        
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"touxiang"]];
    }
}



@end
