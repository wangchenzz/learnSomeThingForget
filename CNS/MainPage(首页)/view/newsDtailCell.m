//
//  newsDtailCell.m
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "newsDtailCell.h"


@interface newsDtailCell ()

@property (nonatomic,retain) UILabel *titleLabel;

@property (nonatomic,retain) UILabel *timeLabel;

@property (nonatomic,retain) UILabel *authorLabel;

@property (nonatomic,retain) UILabel *contentLabel;


@end

@implementation newsDtailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *label = [[UILabel alloc] init];
        
        label.font = titleFont;
        
        label.textColor = [UIColor blackColor];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel = label;
        
        
        UILabel *label1 = [[UILabel alloc] init];
        
        label1.font = contentFont;
        
        label1.textColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        
        self.timeLabel = label1;
        
        UILabel *label2 = [[UILabel alloc] init];
        
        label2.font = contentFont;
        
        label2.textColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        
        self.authorLabel = label2;
        
        UILabel *label3 =[[UILabel alloc] init];
        
        label3.font = TruecontentFont;
        
        [label3 setNumberOfLines:0];
        
        label3.textColor = [UIColor blackColor];
        
        self.contentLabel = label3;
        
        [self.contentView addSubview:label3];
        [self.contentView addSubview:label2];
        [self.contentView addSubview:label1];
        [self.contentView addSubview:label];
        
        
        
//        [self.contentLabel setBackgroundColor:[UIColor redColor]];
//        
//        [self.titleLabel setBackgroundColor:[UIColor redColor]];
//        
//        [self.timeLabel setBackgroundColor:[UIColor redColor]];
//        
//        [self.authorLabel setBackgroundColor:[UIColor redColor]];
        
    }
    return self;
}

+(newsDtailCell*)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"newsDtailCell";
    
    newsDtailCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[newsDtailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)setModel:(JSNewsFrameModel *)model{
    if (_model != model) {
        _model = model;
        
        
        self.titleLabel.text = _model.title;
        
        self.authorLabel.text = _model.author;
        
        self.contentLabel.text = _model.content;
        
        self.timeLabel.text = _model.createtime;
        
        self.titleLabel.frame = _model.titleRect;
        
        self.authorLabel.frame = _model.authorRect;
        
        self.contentLabel.frame = _model.contentRect;
        
        self.timeLabel.frame = _model.creatTimeRect;
        
        
        
        
        
        for (int i = 0 ;i < _model.imageRectArray.count;i++) {
            NSString *rec = _model.imageRectArray[i];
            CGRect re = CGRectFromString(rec);
            
            UIImageView *vie = [[UIImageView alloc] init];
            
            vie.frame = re;
            
            vie.contentMode = UIViewContentModeScaleAspectFill;
            
            vie.clipsToBounds = YES;
            
            [self.contentView addSubview:vie];
            
            vie.image = _model.imageArray[i];
            
        }
        
        
    }

}


@end
