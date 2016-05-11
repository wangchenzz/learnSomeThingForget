//
//  showLevelCell.m
//  CNS
//
//  Created by Mac on 16/4/21.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "showLevelCell.h"

@implementation showLevelCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, JSFrame.size.width, 50)];
        [self addSubview:labelName];
        labelName.textAlignment = NSTextAlignmentCenter;
        labelName.font = JSFont(14);
        labelName.textColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        self.nameLabel = labelName;
        
        
        UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, JSFrame.size.width, 50)];
        [self addSubview:valueLabel];
        valueLabel.font = [UIFont boldSystemFontOfSize:18];
        
        valueLabel.textAlignment = NSTextAlignmentCenter;
        self.valueLabel = valueLabel;
    }
    return self;
}

+(instancetype)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"showLevelCell";
    
    showLevelCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[showLevelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
    }
    return cell;
}

@end
