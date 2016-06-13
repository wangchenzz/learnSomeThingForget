//
//  detailInfoCell.m
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "detailInfoCell.h"

@interface detailInfoCell ()

/**
 *  title
 */
@property (nonatomic,strong) UIView *titleView;

@property (nonatomic,strong) UIImageView *headerImage;

@property (nonatomic,strong) UILabel *userNameLabel;

@property (nonatomic,strong) UILabel *creatTimeLabel;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *contentLabel;

/**
 *  评论 view;
 */

@property (nonatomic,strong) UIImageView *commentHeaderImageView;

@property (nonatomic,strong) UIView *commentView;

@property (nonatomic,strong) UILabel *commentNameLabel;

@property (nonatomic,strong) UILabel *commentContentLabel;

@property (nonatomic,strong) UILabel *commentCreatTimeLabel;

/**
 *  回复 view;
 */

@property (nonatomic,strong) UILabel *anserLabel;

@end


@implementation detailInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
        
        self.commentHeaderImageView = [[UIImageView alloc] init];
        
        self.titleView = [[UIView alloc] init];
        
        self.headerImage = [[UIImageView alloc] init];
        
        self.userNameLabel = [[UILabel alloc] init];
        
        _userNameLabel.textColor = JSTitleColor;
        
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        
        self.creatTimeLabel = [[UILabel alloc] init];
        
        [self.creatTimeLabel setTextColor:[UIColor lightGrayColor]];
        
        self.userNameLabel.font = JSFont(16);
        
        self.creatTimeLabel.font = JSFont(14);
        
        self.titleLabel = [[UILabel alloc] init];
        
        [self.titleLabel setTextColor:JSTitleColor];
        
        [self.titleLabel setNumberOfLines:0];
        
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        self.contentLabel = [[UILabel alloc] init];
        
        [self.contentLabel setTextColor:JSContentTextColor];
        
        [self.contentLabel setNumberOfLines:0];
        
        
        [self.titleView addSubview:self.headerImage];
        
        [self.titleView addSubview:self.userNameLabel];
        
        [self.titleView addSubview:self.creatTimeLabel];
        
        [self.titleView addSubview:self.titleLabel];
        
        [self.titleView addSubview:self.contentLabel];
        
        /**
         *  第二种布局
         */
        
        self.commentView = [[UIView alloc] init];
        
        self.commentNameLabel = [[UILabel alloc] init];
        
        [self.commentNameLabel setTextColor:JSTitleColor];
        
        self.commentContentLabel = [[UILabel alloc] init];
        
        [self.commentContentLabel setTextColor:JSContentTextColor];
        
        self.commentCreatTimeLabel = [[UILabel alloc] init];
        
        [self.commentCreatTimeLabel setTextColor:[UIColor lightGrayColor]];
        
        [self.commentContentLabel setNumberOfLines:0];
        
        
        [self.commentView addSubview:self.commentHeaderImageView];
        
        [self.commentView addSubview:self.commentNameLabel];
        
        [self.commentView addSubview:self.commentContentLabel];
        
        [self.commentView addSubview:self.commentCreatTimeLabel];
        
        
        /**
         *  第三个布局
         */
        
        self.anserLabel = [[UILabel alloc] init];
    
        
        
        
        
        [self.contentView addSubview:self.anserLabel];
        
        [self.contentView addSubview:self.titleView];
        
        [self.contentView addSubview:self.commentView];
        
        
        
    }
    return self;
}
+(detailInfoCell*)cellForTableview:(UITableView*)tableview{
    NSString *const identif = @"detailInfoCell";
    detailInfoCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    if (!cell) {
        cell = [[detailInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}


-(void)setObj:(NSObject *)obj{
    _obj = obj;
    
    self.titleView.hidden = NO;
    self.anserLabel.hidden = NO;
    self.commentView.hidden = NO;
    
    if ([obj isKindOfClass:[detailBBSmodel class]]) {
        
        detailBBSmodel *detailModel = (detailBBSmodel *)obj;
        
        [self.anserLabel setHidden:YES];
        [self.commentView setHidden:YES];
        
        self.headerImage.frame = detailModel.headerRect;
        
        self.userNameLabel.frame = detailModel.userNameRect;
        
        self.creatTimeLabel.frame = detailModel.timeRect;
        
        self.titleLabel.frame = detailModel.titleRect;
        
        self.contentLabel.frame = detailModel.contentRect;
        
        
        
        
        
//        [self.creatTimeLabel setBackgroundColor:[UIColor blackColor]];
        
        self.headerImage.layer.cornerRadius = 20;
        
        self.headerImage.layer.masksToBounds = YES;
        
        NSString *imageStr = [NSString stringWithFormat:@"%@%@",basicUrlStr,detailModel.basicModel.headerImageUrlStr];
        
        [self.headerImage sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:nil];
        self.userNameLabel.text = detailModel.basicModel.loginName;
        self.creatTimeLabel.text = detailModel.basicModel.createtime;
        self.titleLabel.text = detailModel.basicModel.title;
        self.contentLabel.text = detailModel.basicModel.content;
        
        [self.titleLabel setFont:BBStitleFont];
        
        [self.contentLabel setFont:bbsTitleContentFont];
        
        [self.titleView setFrame:CGRectMake(0, 0, JSFrame.size.width, CGRectGetMaxY(detailModel.contentRect)+10)];
        
        
    }else if ([obj isKindOfClass:[answerModel class]]){
        answerModel *answermodel = (answerModel *)obj;
//        /**
//         *  移除不需要的模块先
//         */
        if (answermodel.isAnswer) {
            [self.titleView setHidden:YES];
        }else{
            
            [self.titleView setHidden:YES];
            [self.anserLabel setHidden:YES];
        }
        
    
        
        
        /**
         *  上面测试的  干
         */
        [self.commentNameLabel setFrame:answermodel.commentLoginNameRect];
    
        [self.commentContentLabel setFrame:answermodel.commentContentRect];

        [self.commentCreatTimeLabel setFrame:answermodel.commentCreattimeRect];
        
        [self.commentHeaderImageView setFrame:answermodel.commentHeaderImageRect];
        
        [self.commentContentLabel setFont:commentContentFont];
        
        self.commentHeaderImageView.layer.cornerRadius = self.commentHeaderImageView.width * .5;
        
        self.commentHeaderImageView.layer.masksToBounds = YES;
        
        NSString *imageStr = answermodel.commentHeaderImageSStr;
        
        NSString *urlStr = [NSString stringWithFormat:@"%@%@",basicUrlStr,imageStr];
        
        [self.commentHeaderImageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        self.commentNameLabel.text = answermodel.commentLoginName;
        
        self.commentContentLabel.text = answermodel.commentContent;
        
        self.commentCreatTimeLabel.text = answermodel.commentCreattime;
        
        [self.commentCreatTimeLabel setFont:JSFont(14)];
        
        self.commentView.frame = CGRectMake(0, 0, JSFrame.size.width, answermodel.commentTotalHeight);
        
        if (answermodel.isAnswer) {
            self.anserLabel.attributedText = [answermodel.answerString copy];
            
            [self.anserLabel setNumberOfLines:0];
            
            [self.anserLabel setFont:anserContentFont];
            
            self.anserLabel.frame = answermodel.answerRect;
        }
    }
}


@end
