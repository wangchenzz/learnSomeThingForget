//
//  UIImage+Render.h
//  1.5-2015
//
//  Created by Mac on 16/1/8.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Render)
/**
 *  返回渲染的图片;
 *
 *  @param string 图片名字
 *
 *  @return 渲染后的图片
 */

+(instancetype)imageWithRenderNamed:(NSString*)string;




/**
 *  返回固定颜色的图片
 *
 *  @param color 指定的颜色和透明度
 *
 *  @return 图片
 */

+(UIImage *)imageWithBgColor:(UIColor *)color;





/**
 *  返回图片的颜色
 *
 *  @return 可充当背景图片的颜色;
 */

-(UIColor*)imageToColor;





/**
 *  将图片进行缩放 改变图片的 size; 可是好像没卵用
 *
 *  @param size  缩放后的 size
 *
 *  @return 图片
 */
- (UIImage *)scaleSize:(CGSize)size;





@end
