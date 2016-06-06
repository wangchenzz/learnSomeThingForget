//
//  ShowSegCell.m
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "ShowSegCell.h"

@interface ShowSegCell ()


@end

@implementation ShowSegCell

+(CGFloat)cellHeightWithModel:(id)model{
    ShowSegModel *mo = (ShowSegModel *)model;
    return mo.totalHeight;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.headerImageView = [[UIImageView alloc] init];
        
        self.nameLabel = [[UILabel alloc] init];
        
        [self.nameLabel setTextColor:[UIColor whiteColor]];
        
        self.nameLabel.font = nameFont;
        
        self.contentLabel = [[UILabel alloc] init];
        
        [self.contentLabel setTextColor: [ UIColor whiteColor]];
        
        [self.contentLabel setFont:contentFont];
        
        [self.contentLabel setNumberOfLines:0];
        
        self.timeLabel  = [[UILabel alloc] init];
        
        [self.timeLabel setFont:timeFont];
        
        [self.timeLabel setTextColor:[UIColor darkGrayColor]];
        
        [self.contentView addSubview:self.headerImageView];
        
        
        [self.contentView addSubview:self.nameLabel];
        
        
        [self.contentView addSubview:self.contentLabel];
        
        
        
        [self.contentView addSubview:self.timeLabel];
        
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}

+(instancetype)cellForTableview:(UITableView *)tableview{
    
    
    NSString *const Identifier = NSStringFromClass([self class]);
    
    ShowSegCell *cell = [tableview dequeueReusableCellWithIdentifier:Identifier];
    
    if (!cell) {
        cell = [[ShowSegCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(void)setModel:(ShowSegModel *)model{
    _model = model;
    NSString *imageStr = [NSString stringWithFormat:@"%@%@",basicUrlStr,_model.headerImageNStr];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:nil];
    [self.headerImageView setFrame:_model.imageRect];
    
    self.headerImageView.layer.cornerRadius = self.headerImageView.width *.5;
    
    self.headerImageView.layer.masksToBounds = YES;
    
    [self.nameLabel setFrame:_model.nameRect];
    
    [self.nameLabel setText:_model.userNickName];
    
    [self.contentLabel setFrame:_model.contentRect];
    
    [self.contentLabel setText:_model.segContent];
    
    [self.timeLabel setFrame:_model.timeRect];
    
    [self.timeLabel setText:_model.creatTime];
}




@end
