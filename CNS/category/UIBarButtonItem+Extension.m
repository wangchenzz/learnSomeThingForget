//
//  UIBarButtonItem+Extension.m
//  1.5-2015
//
//  Created by Mac on 16/1/7.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)


+(instancetype)itemWithTitle:(NSString *)title andImage:(NSString *)imageStr targat:(id)targat action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{

    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    
    but.titleLabel.textColor = [UIColor blackColor];
    
    [but setTitle:title forState:UIControlStateNormal];
    
    [but setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    
    [but sizeToFit];
    
    [but addTarget:targat action:action forControlEvents:controlEvents];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:but];
    
    return item;
}

@end
