//
//  buttonView.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "buttonView.h"

@implementation buttonView
+(instancetype)viewWithTile:(NSString *)titleString withHeadImage:(NSString *)imageStr withIntroduce:(NSString *)intrString withEnglishStr:(NSString *)engStr{
     NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"buttonView" owner:nil options:nil];
    
    buttonView *view = [views firstObject];
    
    [view setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:0.3]];
    
    view.titleLabel.text = titleString;
    view.introduceLabel.text = intrString;
    [view.introduceLabel setNumberOfLines:0];
    view.imageView.image = [UIImage imageNamed:imageStr];
    view.englishLabel.text = engStr;
    return view;
}
@end
