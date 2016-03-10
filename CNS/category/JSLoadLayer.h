//
//  JSLoadLayer.h
//  1.5-2015
//
//  Created by Mac on 16/2/25.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface JSLoadLayer : CALayer


@property (nonatomic) CGFloat progress;
@property (nonatomic) UIColor *color;
@property (nonatomic) CGFloat lineWidth;

@end
