//
//  ModuleCell.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "ModuleCell.h"

@implementation ModuleCell

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
        
        _mainImage = [[UIImageView alloc] init];
        
        _backImage = [[UIImageView alloc] init];
        
        _nameLabel = [[UILabel alloc] init];
        
        _backImage.image = [UIImage imageNamed:@"black"];
        
        [_mainImage setFrame:CGRectMake(8, 0, JSFrame.size.width - 16, (JSFrame.size.width - 16)/3)];
        
        
        [_backImage setFrame:CGRectMake(0,_mainImage.height -30, _mainImage.width, 30)];
        
        [_nameLabel setTextColor:[UIColor whiteColor]];
        [_nameLabel setBackgroundColor:[UIColor clearColor]];
        
        _nameLabel.frame = _backImage.bounds;
        
        [_backImage addSubview:_nameLabel];
        
        [_mainImage addSubview:_backImage];
        
        [self.contentView addSubview:_mainImage];
                                        
        
        
    }
    return self;
}

+(ModuleCell*)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"ModuleCell";
    
    ModuleCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[ModuleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}


@end
