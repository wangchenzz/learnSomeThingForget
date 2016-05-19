//
//  buttonView.h
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface buttonView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;


+(instancetype)viewWithTile:(NSString *)titleString withHeadImage:(NSString *)imageStr withIntroduce:(NSString *)intrString withEnglishStr:(NSString *)engStr;


@end
