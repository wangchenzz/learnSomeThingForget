//
//  UIBarButtonItem+Extension.h
//  1.5-2015
//
//  Created by Mac on 16/1/7.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(instancetype)itemWithTitle:(NSString *)title andImage:(NSString *)imageStr targat:(id)targat action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
