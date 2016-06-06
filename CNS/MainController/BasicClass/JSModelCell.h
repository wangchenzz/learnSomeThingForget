//
//  JSModelCell.h
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


@protocol JSModelCell <NSObject>

@required

+ (CGFloat)cellHeightWithModel:(id)model;

@optional

+(instancetype)cellForTableview:(UITableView *)tableview;

@end
