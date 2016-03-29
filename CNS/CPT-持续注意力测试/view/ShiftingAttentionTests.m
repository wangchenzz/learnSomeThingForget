//
//  ShiftingAttentionTests.m
//  CNS
//
//  Created by Mac on 16/3/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "ShiftingAttentionTests.h"

@interface ShiftingAttentionTests ()

@property (nonatomic,strong) CAShapeLayer *referenceLayer;

@property (nonatomic,strong) CAShapeLayer *leftLayer;

@property (nonatomic,strong) CAShapeLayer *rightLayer;

@property (nonatomic,strong) UIBezierPath *roundPath;

@property (nonatomic,strong) UIBezierPath *squarePath;

/**
 *  通过点击色块的方式,来让用户进行响应,
 */
@property (nonatomic,strong) UITapGestureRecognizer *leftTap;
@property (nonatomic,strong) UITapGestureRecognizer *rightTap;

@end

@implementation ShiftingAttentionTests
/**
 *  重写初始化方法
 */

-(instancetype)init{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

+(instancetype)test{
    return [[self alloc]init];
}

-(UIBezierPath *)roundPath{
    if (!_roundPath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:CGPointMake(75, 75) radius:75 startAngle:0 endAngle:2*M_PI clockwise:YES];
        self.roundPath = path;
    }
    return _roundPath;
}

-(UIBezierPath *)squarePath{
    if (!_squarePath) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake( 0, 0, 75, 75)];
        self.squarePath = path;
    }
    return _squarePath;
}

-(CAShapeLayer *)referenceLayer{
    if (!_referenceLayer) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.bounds = CGRectMake(0, 0, 75, 75);
        layer.position = CGPointMake(self.width * .5, self.height * .2);
        layer.lineWidth = 2;
        _referenceLayer = layer;
    }
    return _referenceLayer;
}

-(CAShapeLayer *)leftLayer{
    if (!_leftLayer) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.bounds = CGRectMake(0, 0, 75, 75);
        layer.position = CGPointMake(self.width * .26, self.height * .74);
        layer.lineWidth = 2;
        _leftLayer = layer;
    }
    return _leftLayer;

}

-(CAShapeLayer *)rightLayer{
    if (!_rightLayer) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.bounds = CGRectMake(0, 0, 75, 75);
        layer.position = CGPointMake(self.width * .74, self.height * .74);
        layer.lineWidth = 2;
        [self.layer addSublayer:layer];
        _rightLayer = layer;
    }
    return _rightLayer;
}

@end
