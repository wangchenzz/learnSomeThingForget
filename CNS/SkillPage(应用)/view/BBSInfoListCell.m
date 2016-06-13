//
//  BBSInfoListCell.m
//  CNS
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 竞思教育. All rights reserved.
//


const NSString *titlesTrsid = @"123123123131223";





#import "BBSInfoListCell.h"

@interface BBSInfoListCell  ()

@property (nonatomic,retain) UIImageView *headerImageView;

@property (nonatomic,retain) UILabel *userNameLabel;

@property (nonatomic,retain) UILabel *titleLabel;

@property (nonatomic,retain) UILabel *timeLabel;

@property (nonatomic,retain) UILabel *contentLabel;

@property (nonatomic,retain) UIImageView *watchCountIcon;

@property (nonatomic,retain) UILabel *watchCountLabel;

@property (nonatomic,retain) UIImageView *answerCountIcon;

@property (nonatomic,retain) UILabel *anserCountLabel;




@end

@implementation BBSInfoListCell

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
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        
        UIView *backRoundV = [[UIView alloc] initWithFrame:CGRectMake(12, 0, JSFrame.size.width -24, 0)];
        
        [backRoundV setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
        
        [self.contentView addSubview:backRoundV];
        
        CGFloat BJ = 10;
        
        UIImageView *headerImageView = [[UIImageView alloc] init];
        
        headerImageView.width = headerImageView.height = 64;
        
        headerImageView.x =headerImageView.y = BJ;
        
        
        [backRoundV addSubview:headerImageView];
        
        
        headerImageView.layer.cornerRadius = 32;
        
        headerImageView.layer.masksToBounds = YES;
        
        /**
         * titleLabel
        **/
        UILabel *titleLabel = [[UILabel alloc] init];
        
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        
        titleLabel.x = CGRectGetMaxX(headerImageView.frame) + BJ;
        
        titleLabel.y = headerImageView.y;
        
        
        titleLabel.height = 30;
        
        titleLabel.width = (backRoundV.width -titleLabel.x)/3.0*2;
        
        titleLabel.textColor = JSTitleColor;
        
        [backRoundV addSubview:titleLabel];
        
        /**
         timeLabel
        */
        UILabel *timeLabel = [[UILabel alloc] init];
        
        timeLabel.font = JSFont(13);
        
        timeLabel.textColor = JSContentTextColor;
        
        timeLabel.x = CGRectGetMaxX(titleLabel.frame);
        
        timeLabel.y = titleLabel.y;
        
        timeLabel.height = 25;
        timeLabel.width = backRoundV.width - timeLabel.x - BJ;
        
        timeLabel.textAlignment = NSTextAlignmentRight;
        
        [backRoundV addSubview:timeLabel];
        /**
         ueserNameLabel;
         */
        
       
        UILabel *userNameLabel = [[UILabel alloc] init];
        
        userNameLabel.width = 64;
        
        userNameLabel.height = 15;
        
        userNameLabel.x = headerImageView.x;
        
        userNameLabel.y = CGRectGetMaxY(headerImageView.frame) + 5;
        
        userNameLabel.textAlignment = NSTextAlignmentCenter;
        
        userNameLabel.textColor = JSContentDescColor;
        
        userNameLabel.font = JSFont(14);
        
        [backRoundV addSubview:userNameLabel];
        
        /**
         *  正文 Label:
         */
        
        UILabel *contentLabel = [[UILabel alloc] init];
        
        contentLabel.font = JSFont(14);
        
        contentLabel.textColor = JSContentDescColor;
        
        contentLabel.x = titleLabel.x;
        
        contentLabel.y = CGRectGetMaxY(titleLabel.frame);
        
        contentLabel.width = backRoundV.width - contentLabel.x - BJ;
        
        contentLabel.height = CGRectGetMaxY(headerImageView.frame) - contentLabel.y + 2;
        
//        [contentLabel setBackgroundColor:[UIColor redColor]];
        
        [contentLabel setNumberOfLines:0];
        
        [backRoundV addSubview:contentLabel];
        /**
         *  功能性控件;
         */
        
        UILabel *anserCountLabel = [[UILabel alloc] init];
        
        anserCountLabel.font = JSFont(12);
        
        anserCountLabel.textColor = JSContentTextColor;
        
        UIImageView *answerCountIcon = [[UIImageView alloc] init];
        
        answerCountIcon.image = [UIImage imageNamed:@"say2"];
        
        [answerCountIcon sizeToFit];
        
        UIImageView *watchCountIcon = [[UIImageView alloc] init];
        
        watchCountIcon.image = [UIImage imageNamed:@"look2"];
        
        UILabel *watchCountLabel = [[UILabel alloc] init];
        
        [watchCountIcon sizeToFit];
        
        watchCountLabel.font = JSFont(12);
        
        watchCountLabel.textColor = JSContentTextColor;
        
        [backRoundV addSubview:watchCountLabel];
        [backRoundV addSubview:watchCountIcon];
        [backRoundV addSubview:answerCountIcon];
        [backRoundV addSubview:anserCountLabel];
        
        _headerImageView = headerImageView;
        _titleLabel = titleLabel;
        _contentLabel = contentLabel;
        _timeLabel = timeLabel;
        _userNameLabel = userNameLabel;
        _watchCountIcon = watchCountIcon;
        _watchCountLabel = watchCountLabel;
        _anserCountLabel = anserCountLabel;
        _answerCountIcon = answerCountIcon;
        
        
        
        _backV = backRoundV;
    }
    return self;
}

-(void)setModel:(JSBbsInfoModel *)model{
    if (_model!=model) {
        _model = model;
        NSString *imageStr = [NSString stringWithFormat:@"%@%@",basicUrlStr,_model.headerImageUrlStr];
        
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:[UIImage imageNamed:@"touxiang"]];
        
        
        self.titleLabel.text = model.title;
        
        self.userNameLabel.text = model.loginName;
        
        self.contentLabel.text = model.content;
        
        self.timeLabel.text = model.createtime;
        
        
//        [self.titleLabel sizeToFit];
        /**
         *  评论次数;
         */
        
        
        self.anserCountLabel.frame = model.pCountRect;
        
        self.anserCountLabel.text = model.pCount;
        
        self.anserCountLabel.y = CGRectGetMaxY(_userNameLabel.frame);
        
        self.anserCountLabel.x = _backV.width - 10 - _anserCountLabel.width;
        
        [self.answerCountIcon sizeToFit];
        
        CGFloat with = 1.5;
        
        self.answerCountIcon.width = 1.5 * self.answerCountIcon.width;
        self.answerCountIcon.height = 1.5 * self.answerCountIcon.height;

        
        self.answerCountIcon.y = self.anserCountLabel.y;
        
        self.answerCountIcon.x = CGRectGetMinX(self.anserCountLabel.frame) - _answerCountIcon.width - 2;
        
        /**
         *  浏览次数
         */
        
        self.watchCountLabel.frame = model.ctrRect;
        
        self.watchCountLabel.text = model.ctr;
        
        self.watchCountLabel.y = CGRectGetMaxY(_userNameLabel.frame);
        
        self.watchCountLabel.x = CGRectGetMinX(_answerCountIcon.frame) - 15;
        
        [self.watchCountIcon sizeToFit];
        
        self.watchCountIcon.width = self.watchCountIcon.width * with;
        
        
        self.watchCountIcon.height = self.watchCountIcon.height * with;
        
        self.watchCountIcon.y = self.anserCountLabel.y;
        
        self.watchCountIcon.x = CGRectGetMinX(self.watchCountLabel.frame) - _watchCountIcon.width - 2;
        
        _backV.height = CGRectGetMaxY(_watchCountIcon.frame) + 10;
        
        
    }

}

+(BBSInfoListCell*)cellForTableview:(UITableView*)tableview{
    NSString *const identif = @"BBSInfoListCell";
    BBSInfoListCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    if (!cell) {
        cell = [[BBSInfoListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
@end
