//
//  NewsCell.m
//  CNS
//
//  Created by Mac on 16/5/11.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell ()

@property (nonatomic,retain) UIImageView *photoInfoImage;

@property (nonatomic,retain) UILabel *newsTitleLabel;

@property (nonatomic,retain) UILabel *contentInfoLabel;

@property (nonatomic,retain) UIImageView *shenglueImage;

@end

@implementation NewsCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//* 背景图片 kuang-sy*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *backround = [[UIImageView alloc] init];
        
        [backround setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.3]];

        backround.frame = CGRectMake(10, 0, JSFrame.size.width - 2*10, 115);
        
        [self.contentView addSubview:backround];
        
        backround.image = [UIImage imageNamed:@"kuang-sy"];

        UIImageView *imageview  = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 75, 75)];
        
        [backround addSubview:imageview];
        
        self.photoInfoImage = imageview;
        
        
        
        UILabel *tit = [[UILabel alloc] initWithFrame:CGRectMake(105, 20, backround.width - CGRectGetMaxX(imageview.frame) - 20 - 35, 35)];
        
        [tit setTextColor:JSTitleColor];
        
        [tit setFont:[UIFont boldSystemFontOfSize:15]];
        
        self.newsTitleLabel = tit;
        
        self.shenglueImage = [[UIImageView alloc] init];
        
        self.shenglueImage.image =[UIImage imageNamed:@"shenglue"];
        
        [self.shenglueImage sizeToFit];
        
        
        self.shenglueImage.centerY = self.newsTitleLabel.centerY;
        
        self.shenglueImage.x = backround.width - _shenglueImage.width - 15;
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 55, JSFrame.size.width - 120 - 2*10 - 20, 40)];
        
        [infoLabel setNumberOfLines:0];
        
        infoLabel.textColor = JSContentDescColor;
        
        [infoLabel setFont:[UIFont systemFontOfSize:15]];
        
        self.contentInfoLabel = infoLabel;
        
        [backround addSubview:tit];
        
        [backround addSubview:infoLabel];
        
        [backround addSubview:self.shenglueImage];
        
        [self.contentView addSubview:backround];
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

+(NewsCell*)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"NewsCell";
    
    NewsCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)setModel:(JSNewsModel *)model{
    if (_model != model) {
        _model = model;
        
        self.contentInfoLabel.text = _model.content;
        
        self.newsTitleLabel.text = _model.title;
        
        NSString*imageString = _model.images;
        
        NSArray *imageArray = [imageString componentsSeparatedByString:@","];
        
        NSString *imastr = [NSString stringWithFormat:@"%@%@",basicUrlStr,imageArray[0]];
        
        
        [self.photoInfoImage sd_setImageWithURL:[NSURL URLWithString:imastr]];
        
    }
}




@end
