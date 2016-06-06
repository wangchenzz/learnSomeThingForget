//
//  NSString+Bounding.h
//  CNS
//
//  Created by Mac on 16/6/3.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (Bounding)

-(CGRect)boundingRectWithSize:(CGSize)size strFont:(UIFont *)font;

@end
