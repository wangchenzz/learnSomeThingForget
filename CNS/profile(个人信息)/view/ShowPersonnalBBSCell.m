//
//  ShowPersonnalBBSCell.m
//  CNS
//
//  Created by Mac on 16/5/30.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "ShowPersonnalBBSCell.h"

@interface ShowPersonnalBBSCell ()

@property (nonatomic,retain) UILabel *BBSTitleLabel;

@property (nonatomic,retain) UIImageView *iconImage;

@property (nonatomic,retain) UILabel *commentNumLabel;

@property (nonatomic,retain) UIImageView *isReadImage;

@property (nonatomic,retain) UILabel *typeLabel;



@end

@implementation ShowPersonnalBBSCell



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
        
        _BBSTitleLabel = [[UILabel alloc] init];
        
        _BBSTitleLabel.textColor = [UIColor whiteColor];
        
        _typeLabel = [[UILabel alloc] init];
        
        _typeLabel.backgroundColor = [UIColor darkGrayColor];
        
        _isReadImage = [[UIImageView alloc] init];
        
        _iconImage = [[UIImageView alloc] init];
        
        _commentNumLabel = [[UILabel alloc] init];
        
        _commentNumLabel.textColor = [UIColor whiteColor];
        
        _typeLabel.textColor  = [UIColor whiteColor];
        
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        
        _iconImage.image = [UIImage imageNamed:@"say"];
        
        [_iconImage sizeToFit];
        
        _iconImage.width = _iconImage.height = _iconImage.width * 1.5;
        
        [self.contentView addSubview:_BBSTitleLabel];
        
        [self.contentView addSubview:_typeLabel];
        
        [self.contentView addSubview:_isReadImage];
        
        [self.contentView addSubview:_iconImage];
        
        [self.contentView addSubview:_commentNumLabel];
        
    }
    return self;
}

+(ShowPersonnalBBSCell*)cellForTableview:(UITableView*)tableview{
    NSString *const identif = @"ShowPersonnalBBSCell";
    ShowPersonnalBBSCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    if (!cell) {
        cell = [[ShowPersonnalBBSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(void)setFrameModel:(searchPersonBBsModel *)frameModel{
    _frameModel = frameModel;
    
    self.BBSTitleLabel.font = titleFont;
    
    self.typeLabel.font = typeFont;
    
    self.commentNumLabel.font = tolFont;
    
    self.BBSTitleLabel.text = _frameModel.basicModel.title;
    
    self.BBSTitleLabel.frame =_frameModel.titleRect;
    
    self.isReadImage.frame = _frameModel.isReadingImageRect;
    
    self.isReadImage.layer.cornerRadius = self.isReadImage.width * .5;
    
    self.isReadImage.layer.masksToBounds = YES;
    
    if ([_frameModel.state isEqualToString:@"0"]) {
        [self.isReadImage setBackgroundColor:[UIColor redColor]];
        
    }else{
    
        
        [self.isReadImage setBackgroundColor:[UIColor clearColor]];;
    }
    
    self.typeLabel.text = _frameModel.typeStr;
    
    self.typeLabel.frame = _frameModel.typeLabelRect;
    
    self.iconImage.frame = _frameModel.iconPoint;
    
    self.typeLabel.layer.cornerRadius = 5;
    self.typeLabel.layer.masksToBounds = YES;
    self.commentNumLabel.text = _frameModel.basicModel.pCount;
    
    self.commentNumLabel.frame = _frameModel.commentNumRect;
}

@end
