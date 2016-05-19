//
//  questionTypeCell.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 816年 竞思教育. All rights reserved.
//

#import "questionTypeCell.h"

@implementation questionTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIView *backRund = [[UIView alloc] init];
        
        [backRund setBackgroundColor:[UIColor colorWithWhite:0.85 alpha:0.3]];
        
        backRund.frame = CGRectMake(8, 0, JSFrame.size.width - 16, 50);
        [self.contentView addSubview:backRund];
        
        /**
         序号设置
         */
        _numberLabel = [[UILabel alloc] init];
        
        [_numberLabel setBackgroundColor:[UIColor clearColor]];
        
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        
        [_numberLabel setTextColor:[UIColor whiteColor]];
        
        [_numberLabel setFrame:CGRectMake(0, 0, 50, 50)];
        
        [backRund addSubview:_numberLabel];
        /**
         *  标题设置;
         */
        
        _titleLabel = [[UILabel alloc] init];
        
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [_titleLabel setTextColor:[UIColor whiteColor]];
        
        [_titleLabel setFrame:CGRectMake(50, 0, JSFrame.size.width * .5 -8 - 50, 50)];
        
        [backRund addSubview:_titleLabel];

        _difficuleStar = [starView star];
        
        [_difficuleStar setFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame), 0, JSFrame.size.width*.25, 50)];
        
        
        [backRund addSubview:_difficuleStar];
        /**
         <#Description#>
         */
        _beginButton = [UIButton buttonWithType:UIButtonTypeCustom];;
    
        [_beginButton setBackgroundImage:[UIImage imageNamed:@"dati"] forState:UIControlStateNormal];
        
        [_beginButton setTitle:@"开始答题" forState:UIControlStateNormal];
        
        _beginButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        _beginButton.titleLabel.font = JSFont(11);
        
        [_beginButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
       
        [_beginButton setFrame:CGRectMake(CGRectGetMaxX(_difficuleStar.frame) + 8, 15, JSFrame.size.width *.25 -8 - 8 - 8, 20)];
        
        [backRund addSubview:_beginButton];
        
    }
    return self;
}

+(questionTypeCell*)cellForTableview:(UITableView*)tableview{
    
    NSString *const identif = @"questionTypeCell";
    
    questionTypeCell *cell = [tableview dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[questionTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}



@end
