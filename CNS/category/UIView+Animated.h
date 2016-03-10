//
//  UIView+Animated.h
//  1.5-2015
//
//  Created by Mac on 16/1/29.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JSFakeAnimationDirection) {
    JSFakeAnimationRight = 1,       ///< left to right
    JSFakeAnimationLeft = -1,       ///< right to left
    JSFakeAnimationDown = -2,       ///< up to down
    JSFakeAnimationUp = 2           ///< down to up
};

static const NSTimeInterval JSFakeLabelAnimationDuration = 0.7;

@interface UIView (Animated)


/**
 *  label滚动动画
 *
 *  @param direction 方向
 *  @param toText    动画后的字
 */
-(void)JSLabel_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toText:(NSString *)toText;



-(void)JSLabel_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toText:(NSString *)toText andToColor:(UIColor *)tocolor;


/**
 *  imageview 滚动动画
 *
 *  @param direction 方向
 *  @param toImage   滚动后的图
 */
-(void)JSImage_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toImage:(UIImage *)toImage;

/**
 *  label 随机方向滚动动画
 *
 *  @param toText 滚动完后的字
 */
-(void)jsLabel_AnimatgionRollDirctionToText:(NSString *)toText andColor:(UIColor *)tocolor;

/**
 *  image 随机滚动动画
 *
 *  @param Image 滚动完后的画
 */
-(void)jsImage_AnimatgionRollDirctionToImage:(UIImage *)Image;

/**
 *  会在 view 上面加上一层模糊效果,但是不会影响 view 上面别的子视图;
 */
-(void)addEffectView;

/**
 *  让 UIimageview 的图片逐渐变化
 *
 *  @param image 变化后的图
 */
-(void)startImageViewAnimationImage:(UIImage*)image;
@end
