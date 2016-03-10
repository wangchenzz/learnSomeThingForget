//
//  UIView+Animated.m
//  1.5-2015
//
//  Created by Mac on 16/1/29.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "UIView+Animated.h"
#import <objc/runtime.h>

static void * JSFakeLabelAnimationIsAnimatingKey = &JSFakeLabelAnimationIsAnimatingKey;

@interface UIView ()

@property (assign, nonatomic) BOOL st_isAnimating; ///< default is NO


@end

@implementation UIView (Animated)

- (void)st_startAnimationWithDirection:(JSFakeAnimationDirection)direction toText:(NSString *)toText andImage:(UIImage *)image andColor:(UIColor *)tocolor{
    
    if (self.st_isAnimating) {
        return;
    }
    
    
    
    if ([self isKindOfClass:[UILabel class]]) {
        
        if (![toText respondsToSelector:@selector(length)]) {
            return;
        }
        
        UILabel *selfLabel = (UILabel *)self;
        
        if (!(selfLabel.text)) {
            
            selfLabel.text = toText;
            selfLabel.textColor = tocolor;
            return;
        }
        
        
        self.st_isAnimating = YES;
        
        UILabel *fakeLabel = [UILabel new];
        
        
        fakeLabel.frame = self.frame;
        fakeLabel.textAlignment = selfLabel.textAlignment;
        fakeLabel.layer.cornerRadius = selfLabel.layer.cornerRadius;
        fakeLabel.layer.masksToBounds = YES;
        fakeLabel.font = selfLabel.font;
        fakeLabel.textColor = selfLabel.textColor;
        fakeLabel.adjustsFontSizeToFitWidth = selfLabel.adjustsFontSizeToFitWidth;
        fakeLabel.text = selfLabel.text;
        selfLabel.text = toText;
        selfLabel.textColor = tocolor;
        
        fakeLabel.backgroundColor = self.backgroundColor;
        
        [self.superview addSubview:fakeLabel];
        
        CGFloat labelOffsetX = 0.0;
        CGFloat labelOffsetY = 0.0;
        CGFloat labelScaleX = 0.1;
        CGFloat labelScaleY = 0.1;
        
        
        
        
        if (direction == JSFakeAnimationDown || direction == JSFakeAnimationUp) {
            
            labelOffsetY = direction * CGRectGetHeight(self.bounds) / 4;
            labelScaleX = 1.0;
            
        }
        
        if (direction == JSFakeAnimationLeft || direction == JSFakeAnimationRight) {
            labelOffsetX = direction * CGRectGetWidth(self.bounds) / 2;
            labelScaleY = 1.0;
        }
        selfLabel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(labelScaleX, labelScaleY), CGAffineTransformMakeTranslation(labelOffsetX, labelOffsetY));
        
        [UIView animateWithDuration:JSFakeLabelAnimationDuration animations:^{
            selfLabel.transform = CGAffineTransformIdentity;
            fakeLabel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(labelScaleX, labelScaleY), CGAffineTransformMakeTranslation(-labelOffsetX, -labelOffsetY));
        } completion:^(BOOL finished) {
            fakeLabel.transform = CGAffineTransformIdentity;
            [fakeLabel removeFromSuperview];
            self.st_isAnimating = NO;
        }];
    }
    
    
    if ([self isKindOfClass:[UIImageView class]]) {
        UIImageView *selfImage = (UIImageView *)self;
        if (!selfImage.image) {
            
            selfImage.image = image;
            
            return;
        }
        
        
        
        self.st_isAnimating = YES;
        UIImageView *fakeImage = [UIImageView new];
        fakeImage.frame = selfImage.frame;
        fakeImage.backgroundColor = selfImage.backgroundColor;
        fakeImage.highlighted = selfImage.highlighted;
        fakeImage.highlighted = selfImage.highlighted;
        fakeImage.tintColor = selfImage.tintColor;
        fakeImage.image = selfImage.image;
        
        selfImage.image = image;
        fakeImage.layer.cornerRadius = selfImage.layer.cornerRadius;
        
        fakeImage.layer.masksToBounds = YES;
        
        fakeImage.backgroundColor = selfImage.backgroundColor;
        [self.superview addSubview:fakeImage];
        CGFloat labelOffsetX = 0.0;
        CGFloat labelOffsetY = 0.0;
        CGFloat labelScaleX = 0.1;
        CGFloat labelScaleY = 0.1;
        
        if (direction == JSFakeAnimationDown || direction == JSFakeAnimationUp) {
            labelOffsetY = direction * CGRectGetHeight(self.bounds) / 4;
            labelScaleX = 1.0;
        }
        if (direction == JSFakeAnimationLeft || direction == JSFakeAnimationRight) {
            labelOffsetX = direction * CGRectGetWidth(self.bounds) / 2;
            labelScaleY = 1.0;
        }
        selfImage.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(labelScaleX, labelScaleY), CGAffineTransformMakeTranslation(labelOffsetX, labelOffsetY));
        
        [UIView animateWithDuration:JSFakeLabelAnimationDuration animations:^{
            selfImage.transform = CGAffineTransformIdentity;
            fakeImage.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(labelScaleX, labelScaleY), CGAffineTransformMakeTranslation(-labelOffsetX, -labelOffsetY));
        } completion:^(BOOL finished) {
            fakeImage.transform = CGAffineTransformIdentity;
            [fakeImage removeFromSuperview];
            self.st_isAnimating = NO;
        }];
    }
}

/**
 *  label 的动画接口
 *
 *  @param direction 方向
 *  @param toText    改变后的字
 */
-(void)JSLabel_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toText:(NSString *)toText{
    
    [self st_startAnimationWithDirection:direction toText:toText andImage:nil andColor:nil];
}

/**
 *  label 的动画接口
 *
 *  @param direction 方向
 *  @param toText    改变后的字
 *  @param tocolor   改变后的字颜色
 */
-(void)JSLabel_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toText:(NSString *)toText andToColor:(UIColor *)tocolor{
    
    [self st_startAnimationWithDirection:direction toText:toText andImage:nil andColor:tocolor];
}

/**
 *  imageview 的动画接口
 *
 *  @param direction 方向
 *  @param toImage   改变后的图
 */

-(void)JSImage_StarAnimationWithDirection:(JSFakeAnimationDirection)direction toImage:(UIImage *)toImage{
    
    [self st_startAnimationWithDirection:direction toText:nil andImage:toImage andColor:nil];
    
}

-(void)jsLabel_AnimatgionRollDirctionToText:(NSString *)toText andColor:(UIColor *)tocolor{
    
    int rol = arc4random()%4;
    switch (rol) {
        case 0:
            [self JSLabel_StarAnimationWithDirection:JSFakeAnimationDown toText:toText andToColor:tocolor];
            break;
        case 1:
            [self JSLabel_StarAnimationWithDirection:JSFakeAnimationLeft toText:toText andToColor:tocolor];
            break;
        case 2:
            [self JSLabel_StarAnimationWithDirection:JSFakeAnimationRight toText:toText andToColor:tocolor];
            break;
        case 3:
            [self JSLabel_StarAnimationWithDirection:JSFakeAnimationUp toText:toText andToColor:tocolor];
            break;
            
        default:
            break;
    }
    
    
}

-(void)jsImage_AnimatgionRollDirctionToImage:(UIImage *)Image{
    int rol = arc4random()%4;
    switch (rol) {
        case 0:
            [self JSImage_StarAnimationWithDirection:JSFakeAnimationDown toImage:Image];
            break;
        case 1:
            [self JSImage_StarAnimationWithDirection:JSFakeAnimationLeft toImage:Image];
            break;
        case 2:
            [self JSImage_StarAnimationWithDirection:JSFakeAnimationRight toImage:Image];
            break;
        case 3:
            [self JSImage_StarAnimationWithDirection:JSFakeAnimationUp toImage:Image];
            break;
            
        default:
            break;
    }
}

- (BOOL)st_isAnimating {
    NSNumber *isAnimatingNumber = objc_getAssociatedObject(self, JSFakeLabelAnimationIsAnimatingKey);
    return isAnimatingNumber.boolValue;
}

- (void)setSt_isAnimating:(BOOL)st_isAnimating {
    objc_setAssociatedObject(self, JSFakeLabelAnimationIsAnimatingKey, @(st_isAnimating), OBJC_ASSOCIATION_ASSIGN);
}

-(void)addEffectView{
    
    UIVisualEffectView *backVisual = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    //将模糊视图的大小等同于自身
    backVisual.frame = self.bounds;
    //设置模糊视图的透明度
    backVisual.alpha = 1;
    
    //非常模糊的效果
    [self addSubview:backVisual];
    
    /**
     *  把模糊视图调到最底层, 不影响别的子视图;
     */
    [self sendSubviewToBack:backVisual];
}

-(void)startImageViewAnimationImage:(UIImage*)image{
    
    CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnimation.duration = 1.0f;
    contentsAnimation.removedOnCompletion = YES;
    contentsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:contentsAnimation forKey:nil];
    UIImageView *imageSelf = (UIImageView *)self;
    imageSelf.image = image;
    
    
}

@end
