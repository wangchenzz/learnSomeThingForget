//
//  JSLoading.m
//  1.5-2015
//
//  Created by Mac on 16/2/25.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "JSLoading.h"

#import "JSLoadLayer.h"

#import "JSWriteAnimationView.h"
static NSString * const kName = @"name";

static CGFloat const kStep1Duration = 1.0;
static CGFloat const kStep2Duration = 0.5;
static CGFloat const kStep3Duration = 0.15;
static CGFloat const kStep4Duration = 0.25;
static CGFloat const kStep5Duration = 0.5;
static CGFloat const kBeforeStep6SuccessDelay = 0.1;
static CGFloat const kStep6SuccessDuration = 1;
static CGFloat const kStep6FailDuration = 0.5;
static CGFloat const kStep7FailDuration = 0.1;

static CGFloat const kRadius = 40;
static CGFloat const kLineWidth = 6;
static CGFloat const kVerticalMoveLayerHeight = 15;
static CGFloat const kVerticalThinLayerWidth = 3;
static CGFloat const kYScale = 0.8;
static CGFloat const kVerticalFatLayerWidth = 6;

@interface JSLoading ()
@property (nonatomic) BOOL isSuccess;

@property (nonatomic) CAShapeLayer *JSLoadLayer;
@property (nonatomic) CAShapeLayer *moveArcLayer;
@property (nonatomic) CALayer *verticalMoveLayer;
@property (nonatomic) CAShapeLayer *verticalDisappearLayer;
@property (nonatomic) CAShapeLayer *verticalAppearLayer;
@property (nonatomic) CAShapeLayer *leftAppearLayer;
@property (nonatomic) CAShapeLayer *rightAppearLayer;
@property (nonatomic) CAShapeLayer *checkMarkLayer;
@property (nonatomic) CAShapeLayer *exclamationMarkTopLayer;
@property (nonatomic) CAShapeLayer *exclamationMarkBottomLayer;

@property (nonatomic) UIColor *likeBlackColor;
@property (nonatomic) UIColor *likeGreenColor;
@property (nonatomic) UIColor *likeRedColor;

@property (nonatomic,strong) CAAnimationGroup *importStep;

@property (nonatomic,copy)void(^conpletion)(BOOL finsih) ;

@end

@implementation JSLoading

+ (void)loadSuccessCompletion:(void (^)(BOOL))completion {
    
    JSLoading *lei = [[JSLoading alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    
    [[UIApplication sharedApplication].keyWindow addSubview:lei];
    
    lei.alpha = 0;
    
    [lei addEffectView];
    
    [lei reset];
    
    lei.isSuccess = YES;
    
    [lei doStep1];
    
    lei.conpletion = completion;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        lei.alpha = 1;
        
    }];
}

+ (void)loadFailCompletion:(void (^)(BOOL))completion {
    
    JSLoading *lei = [[JSLoading alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    [[UIApplication sharedApplication].keyWindow addSubview:lei];
    [lei reset];
    lei.isSuccess = NO;
    [lei doStep1];
    lei.conpletion = completion;
    
    [UIView animateWithDuration:0.5 animations:^{
        lei.alpha = 1;
    }];
}


#pragma mark - reset
- (void)reset {
    self.likeBlackColor = [UIColor colorWithRed:0x46/255.0 green:0x4d/255.0 blue:0x65/255.0 alpha:1.0];
    self.likeGreenColor = [UIColor colorWithRed:0x32/255.0 green:0xa9/255.0 blue:0x82/255.0 alpha:1.0];
    self.likeRedColor = [UIColor colorWithRed:0xff/255.0 green:0x61/255.0 blue:0x51/255.0 alpha:1.0];
    
    /**
     *  外围转圈的 layer
     */
    
    [self.JSLoadLayer removeFromSuperlayer];
    
    /**
     *  飞起来的 layer
     */
    [self.moveArcLayer removeFromSuperlayer];
    
    [self.verticalMoveLayer removeFromSuperlayer];
    [self.verticalDisappearLayer removeFromSuperlayer];
    [self.verticalAppearLayer removeFromSuperlayer];
    [self.leftAppearLayer removeFromSuperlayer];
    [self.rightAppearLayer removeFromSuperlayer];
    [self.checkMarkLayer removeFromSuperlayer];
    [self.exclamationMarkTopLayer removeFromSuperlayer];
    [self.exclamationMarkBottomLayer removeFromSuperlayer];
    [self.layer removeAllAnimations];
}

/**
 *  CA 动画 相当于播放一段动画效果. 而效果都已经是确定好了的;
 *
 */

#pragma mark - step1
- (void)doStep1 {
    self.JSLoadLayer = [CAShapeLayer layer];
    self.JSLoadLayer.strokeColor = self.likeBlackColor.CGColor;
    self.JSLoadLayer.lineWidth = kLineWidth;
    self.JSLoadLayer.bounds = CGRectMake(0,0, kRadius * 2 + kLineWidth, kRadius * 2 + kLineWidth);
    self.JSLoadLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    
    [self.layer addSublayer:self.JSLoadLayer];
    
    self.JSLoadLayer.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint centerA = CGPointMake(CGRectGetMaxX(self.JSLoadLayer.bounds) * .5, CGRectGetMaxY(self.JSLoadLayer.bounds) * .5);
    
    [path addArcWithCenter:centerA radius:CGRectGetMaxX(self.JSLoadLayer.bounds)*.5 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    self.JSLoadLayer.path = path.CGPath;
    // animation
    
    // SS(strokeStart)
    CGFloat SSFrom = 0;
    CGFloat SSTo = 0;
    
    // SE(strokeEnd)
    CGFloat SEFrom = 0;
    CGFloat SETo = 1;
    
    // end status
    self.JSLoadLayer.strokeStart = SSTo;
    self.JSLoadLayer.strokeEnd = SETo;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(SSFrom);
    startAnimation.toValue = @(SSTo);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(SEFrom);
    endAnimation.toValue = @(SETo);
    
    
    
    CABasicAnimation *rotain = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotain.fromValue = 0;
    rotain.toValue = @(-M_2_PI * 10 - 2*M_PI);
    
    rotain.repeatCount = 1;
    
    CAAnimationGroup *step1 = [CAAnimationGroup animation];
    step1.animations = @[startAnimation, endAnimation,rotain];
    step1.repeatCount = 1;
    step1.duration = kStep1Duration * 2;
    step1.delegate = self;
    
    [step1 setValue:@"step1" forKey:kName];
    
    step1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.JSLoadLayer addAnimation:step1 forKey:nil];
    
    self.importStep = step1;
}

#pragma mark - step2
- (void)doStep2 {
    self.moveArcLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.moveArcLayer];
    self.moveArcLayer.frame = self.bounds;
    // 弧的path
    UIBezierPath *moveArcPath = [UIBezierPath bezierPath];
    // 小圆圆心 变态英雄到
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    // d（x轴上弧圆心与小圆左边缘的距离）
    CGFloat d = kRadius / 2;
    // 弧圆心
    CGPoint arcCenter = CGPointMake(center.x - kRadius - d, center.y);
    // 弧半径
    CGFloat arcRadius = kRadius * 2 + d;
    // O(origin)
    CGFloat origin = M_PI * 2;
    // D(dest)
    CGFloat dest = M_PI * 2 - asin(kRadius * 2 / arcRadius);
    [moveArcPath addArcWithCenter:arcCenter radius:arcRadius startAngle:origin endAngle:dest clockwise:NO];
    self.moveArcLayer.path = moveArcPath.CGPath;
    self.moveArcLayer.lineWidth = 3;
    self.moveArcLayer.strokeColor = self.likeBlackColor.CGColor;
    self.moveArcLayer.fillColor = [UIColor clearColor].CGColor;
    
    // SS(strokeStart)
    CGFloat SSFrom = 0;
    CGFloat SSTo = 0.9;
    
    // SE(strokeEnd)
    CGFloat SEFrom = 0.1;
    CGFloat SETo = 1;
    
    // end status
    self.moveArcLayer.strokeStart = SSTo;
    self.moveArcLayer.strokeEnd = SETo;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(SSFrom);
    startAnimation.toValue = @(SSTo);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(SEFrom);
    endAnimation.toValue = @(SETo);
    
    CAAnimationGroup *step2 = [CAAnimationGroup animation];
    step2.animations = @[startAnimation, endAnimation];
    step2.duration = kStep2Duration;
    step2.delegate = self;
    [step2 setValue:@"step2" forKey:kName];
    step2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.moveArcLayer addAnimation:step2 forKey:nil];
}
/**
 *  从半空下来的 layer;
 */
#pragma mark - step3
- (void)doStep3 {
    // prepare for step3
    
    
    [self.moveArcLayer removeFromSuperlayer];
    
    // step3 layer
    self.verticalMoveLayer = [CALayer layer];
    self.verticalMoveLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:self.verticalMoveLayer];
    
    CGFloat height = kVerticalMoveLayerHeight;
    self.verticalMoveLayer.bounds = CGRectMake(0, 0, kVerticalThinLayerWidth, height);
    self.verticalMoveLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) - kRadius * 2 + height / 2);
    self.verticalMoveLayer.backgroundColor = self.likeBlackColor.CGColor;
    
    // position
    CGPoint originPosition = self.verticalMoveLayer.position;
    CGPoint destPosition = CGPointMake(originPosition.x,  CGRectGetMidY(self.bounds) - kRadius - height / 2);
    
    // end status
    self.verticalMoveLayer.position = destPosition;
    
    // animation
    CABasicAnimation *step3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    step3.fromValue = @(originPosition.y);
    step3.toValue = @(destPosition.y);
    step3.duration = kStep3Duration;
    step3.delegate = self;
    [step3 setValue:@"step3" forKey:kName];
    [self.verticalMoveLayer addAnimation:step3 forKey:nil];
}


#pragma mark - step4

/**
 *  半空中的移除掉;
 */
- (void)doStep4 {
    [self prepareForStep4];
    [self doStep4a];
    [self doStep4b];
    [self doStep4c];
}

- (void)prepareForStep4 {
    [self.verticalMoveLayer removeFromSuperlayer];
}

// 4阶段a：小圆变形
- (void)doStep4a {
    CGRect frame = self.JSLoadLayer.frame;
    self.JSLoadLayer.anchorPoint = CGPointMake(0.5, 1);
    self.JSLoadLayer.frame = frame;
    
    // y scale
    CGFloat yFromScale = 1.0;
    CGFloat yToScale = kYScale;
    
    // x scale
    CGFloat xFromScale = 1.0;
    CGFloat xToScale = 1.1;
    
    // end status
    //这里将圆圈不规则;
    
    self.JSLoadLayer.transform = CATransform3DMakeScale(xToScale, yToScale, 1);
    
    
    // animation
    CABasicAnimation *yAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    yAnima.fromValue = @(yFromScale);
    yAnima.toValue = @(yToScale);
    
    CABasicAnimation *xAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    xAnima.fromValue = @(xFromScale);
    xAnima.toValue = @(xToScale);
    
    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[yAnima, xAnima];
    anima.duration = kStep4Duration;
    anima.delegate = self;
    [anima setValue:@"step4" forKey:kName];
    
    [self.JSLoadLayer addAnimation:anima forKey:nil];
}

// 4阶段b：逐渐消失的细线
- (void)doStep4b {
    
    /**
     *  这里是一个细线逐渐消失;
     */
    
    self.verticalDisappearLayer = [CAShapeLayer layer];
    self.verticalDisappearLayer.frame = self.bounds;
    [self.layer addSublayer:self.verticalDisappearLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat height = kVerticalMoveLayerHeight;
    CGFloat originY = CGRectGetMidY(self.bounds) - kRadius - height;
    CGFloat pathHeight = height + kRadius * 2 * (1 - kYScale);
    CGFloat destY = originY + pathHeight;
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.verticalDisappearLayer.path = path.CGPath;
    self.verticalDisappearLayer.lineWidth = kVerticalThinLayerWidth;
    self.verticalDisappearLayer.strokeColor = self.likeBlackColor.CGColor;
    self.verticalDisappearLayer.fillColor = nil;
    
    // SS(strokeStart)
    CGFloat SSFrom = 0;
    CGFloat SSTo = 1.0;
    
    // SE(strokeEnd)
    CGFloat SEFrom = height / pathHeight;
    CGFloat SETo = 1.0;
    
    //     end status
    self.verticalDisappearLayer.strokeStart = SSTo;
    self.verticalDisappearLayer.strokeEnd = SETo;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(SSFrom);
    startAnimation.toValue = @(SSTo);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(SEFrom);
    endAnimation.toValue = @(SETo);
    
    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = kStep4Duration;
    [self.verticalDisappearLayer addAnimation:anima forKey:nil];
}

// 4阶段c：逐渐出现的粗线
- (void)doStep4c {
    self.verticalAppearLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.verticalAppearLayer];
    self.verticalAppearLayer.frame = self.bounds;
    
    UIBezierPath *step4cPath = [UIBezierPath bezierPath];
    CGFloat originY = CGRectGetMidY(self.bounds) - kRadius;
    CGFloat destY = CGRectGetMidY(self.bounds) + kRadius;
    [step4cPath moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [step4cPath addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.verticalAppearLayer.path = step4cPath.CGPath;
    self.verticalAppearLayer.lineWidth = kVerticalFatLayerWidth;
    self.verticalAppearLayer.strokeColor = self.likeBlackColor.CGColor;
    self.verticalAppearLayer.fillColor = nil;
    
    // SS(strokeStart)
    CGFloat SSFrom = 0;
    CGFloat SSTo = 0.2;
    
    // SE(strokeEnd)
    CGFloat SEFrom = 0;
    CGFloat SETo = 0.5;
    
    // end status
    self.verticalAppearLayer.strokeStart = SSTo;
    self.verticalAppearLayer.strokeEnd = SETo;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(SSFrom);
    startAnimation.toValue = @(SSTo);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(SEFrom);
    endAnimation.toValue = @(SETo);
    
    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = kStep4Duration;
    [self.verticalAppearLayer addAnimation:anima forKey:nil];
    
}

#pragma mark - step5
- (void)doStep5 {
    [self prepareForStep5];
    [self doStep5a];
    [self doStep5b];
    [self doStep5c];
    //    [self doStep5d];
}

- (void)prepareForStep5 {
    [self.verticalDisappearLayer removeFromSuperlayer];
}

// 小圆回复原状
- (void)doStep5a {
    // end status
    /**
     *  一定要设置最后的状态,不然结束后会变成之前的样子
     
     */
    self.JSLoadLayer.transform = CATransform3DIdentity;
    
    // animation
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    anima.duration = kStep5Duration;
    anima.fromValue = @(kYScale);
    anima.toValue = @1;
    anima.delegate = self;
    [self.JSLoadLayer addAnimation:anima forKey:nil];
}

// 竖线成长到全长
- (void)doStep5b {
    // SS(strokeStart)
    CGFloat SSFrom = 1 - kYScale;
    CGFloat SSTo = 0;
    
    // SE(strokeEnd)
    CGFloat SEFrom = 0.5;
    CGFloat SETo = 1;
    
    // end status
    self.verticalAppearLayer.strokeStart = SSTo;
    self.verticalAppearLayer.strokeEnd = SETo;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(SSFrom);
    startAnimation.toValue = @(SSTo);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(SEFrom);
    endAnimation.toValue = @(SETo);
    
    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = kStep5Duration;
    [self.verticalAppearLayer addAnimation:anima forKey:nil];
}

// 出现竞思文案的动画
- (void)doStep5c {
    self.leftAppearLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.leftAppearLayer];
    
    self.leftAppearLayer.bounds = CGRectMake(0,0, kRadius * 2 , kRadius * 2 );
    self.leftAppearLayer.position =  CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) - 2*kVerticalMoveLayerHeight + 5);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    /**
     *   这个 letter 是 path
     */
    CGMutablePathRef letters = CGPathCreateMutable();
    
    /**
     *  font 是字体信息
     */
    CTFontRef font = CTFontCreateWithName(CFSTR("Helvetica-Bold"), 40.0f, NULL);
    
    /**
     *  变成字典
     */
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    /**
     * 通过字体字典得到NSAttributedString的字;
     */
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"竞思"
                                                                     attributes:attrs];
    
    /**
     *  根据新字得到 line属性;
     */
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    /**
     * 根据 line 得到一个路线数组;
     */
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    /**
     *  遍历这个数组
     */
    // for each RUN
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // get Glyph & Glyph-data
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // Get PATH of outline
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(font);
    
    //    self.leftAppearLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    self.leftAppearLayer.geometryFlipped = YES;
    self.leftAppearLayer.path = path.CGPath;
    self.leftAppearLayer.strokeColor = [self.likeBlackColor CGColor];
    self.leftAppearLayer.fillColor = nil;
    self.leftAppearLayer.lineWidth = 3;
    self.leftAppearLayer.lineJoin = kCALineJoinBevel;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = kStep5Duration * 3;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.5f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    CABasicAnimation *pathAnimation1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    pathAnimation1.duration = kStep5Duration * 3;
    pathAnimation1.fromValue = [NSNumber numberWithFloat:0.5f];
    pathAnimation1.toValue = [NSNumber numberWithFloat:0.0f];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    group.animations = @[pathAnimation,pathAnimation1];
    
    group.delegate = self;
    
    group.duration = 3 * kStep5Duration;
    
    [group setValue:@"step5" forKey:kName];
    
    [self.leftAppearLayer addAnimation:group forKey:@"step5"];
    
}

// 右下斜线成长到全长
- (void)doStep5d {
    self.rightAppearLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.rightAppearLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint originPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [path moveToPoint:originPoint];
    CGFloat deltaX = kRadius * sin(M_PI / 3);
    CGFloat deltaY = kRadius * cos(M_PI / 3);
    CGPoint destPoint = originPoint;
    destPoint.x += deltaX;
    destPoint.y += deltaY;
    [path addLineToPoint:destPoint];
    self.rightAppearLayer.path = path.CGPath;
    self.rightAppearLayer.lineWidth = kLineWidth;
    self.rightAppearLayer.strokeColor = self.likeBlackColor.CGColor;
    self.rightAppearLayer.fillColor = nil;
    
    // end status
    CGFloat strokeEnd = 1;
    
    // animation
    self.rightAppearLayer.strokeEnd = strokeEnd;
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anima.duration = kStep5Duration;
    anima.fromValue = @0;
    anima.toValue = @(strokeEnd);
    [self.rightAppearLayer addAnimation:anima forKey:nil];
}

#pragma mark - step6 success
- (void)doStep6Success {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kBeforeStep6SuccessDelay * 1000 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
        [self prepareForStep6Success];;
        [self processStep6SuccessA];
        [self processStep6SuccessB];
    });
}

- (void)prepareForStep6Success {
    [self.verticalAppearLayer removeFromSuperlayer];
    [self.leftAppearLayer removeFromSuperlayer];
    [self.rightAppearLayer removeFromSuperlayer];
}

// 圆变色
- (void)processStep6SuccessA {
    
    self.JSLoadLayer.strokeColor = self.likeGreenColor.CGColor;
    
}

// 对号出现
- (void)processStep6SuccessB {
    self.checkMarkLayer = [CAShapeLayer layer];
    self.checkMarkLayer.frame = self.bounds;
    [self.layer addSublayer:self.checkMarkLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGPoint firstPoint = centerPoint;
    firstPoint.x -= kRadius / 2;
    [path moveToPoint:firstPoint];
    CGPoint secondPoint = centerPoint;
    secondPoint.x -= kRadius / 8;
    secondPoint.y += kRadius / 2;
    [path addLineToPoint:secondPoint];
    CGPoint thirdPoint = centerPoint;
    thirdPoint.x += kRadius / 2;
    thirdPoint.y -= kRadius / 2;
    [path addLineToPoint:thirdPoint];
    
    self.checkMarkLayer.path = path.CGPath;
    self.checkMarkLayer.lineWidth = 6;
    self.checkMarkLayer.strokeColor = self.likeGreenColor.CGColor;
    self.checkMarkLayer.fillColor = nil;
    
    // end status
    CGFloat strokeEnd = 1;
    self.checkMarkLayer.strokeEnd = strokeEnd;
    
    // animation
    CABasicAnimation *step6bAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    step6bAnimation.duration = kStep6SuccessDuration;
    step6bAnimation.fromValue = @0;
    step6bAnimation.toValue = @(strokeEnd);
    step6bAnimation.delegate = self;
    [step6bAnimation setValue:@"success" forKey:kName];
    [self.checkMarkLayer addAnimation:step6bAnimation forKey:@"success"];
}

#pragma mark - step6 fail
- (void)doStep6Fail {
    [self prepareForStep6Fail];
    [self processStep6FailA];
    [self processStep6FailB];
    [self processStep6FailC];
}

- (void)prepareForStep6Fail {
    [self.verticalMoveLayer removeFromSuperlayer];
}

// 圆变色
- (void)processStep6FailA {
    self.JSLoadLayer.strokeColor = self.likeRedColor.CGColor;
}

// 叹号上半部分出现
- (void)processStep6FailB {
    self.exclamationMarkTopLayer = [CAShapeLayer layer];
    self.exclamationMarkTopLayer.frame = self.bounds;
    [self.layer addSublayer: self.exclamationMarkTopLayer];
    
    CGFloat partLength = kRadius * 2 / 8;
    CGFloat pathPartCount = 5;
    CGFloat visualPathPartCount = 4;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat originY = CGRectGetMidY(self.bounds) - kRadius;
    CGFloat destY = originY + partLength * pathPartCount;
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.exclamationMarkTopLayer.path = path.CGPath;
    self.exclamationMarkTopLayer.lineWidth = 6;
    self.exclamationMarkTopLayer.strokeColor = self.likeRedColor.CGColor;
    self.exclamationMarkTopLayer.fillColor = nil;
    
    // end status
    CGFloat strokeStart = (pathPartCount - visualPathPartCount ) / pathPartCount;
    CGFloat strokeEnd = 1.0;
    self.exclamationMarkTopLayer.strokeStart = strokeStart;
    self.exclamationMarkTopLayer.strokeEnd = strokeEnd;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @0;
    startAnimation.toValue = @(strokeStart);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @0;
    endAnimation.toValue = @(strokeEnd);
    
    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = kStep6FailDuration;
    anima.delegate = self;
    [anima setValue:@"step6Fail" forKey:kName];
    
    [self.exclamationMarkTopLayer addAnimation:anima forKey:nil];
}

// 叹号下半部分出现
- (void)processStep6FailC {
    self.exclamationMarkBottomLayer = [CAShapeLayer layer];
    self.exclamationMarkBottomLayer.frame = self.bounds;
    [self.layer addSublayer: self.exclamationMarkBottomLayer];
    
    CGFloat partLength = kRadius * 2 / 8;
    CGFloat pathPartCount = 2;
    CGFloat visualPathPartCount = 1;
    
    self.exclamationMarkBottomLayer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat originY = CGRectGetMidY(self.bounds) + kRadius;
    CGFloat destY = originY - partLength * pathPartCount;
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.exclamationMarkBottomLayer.path = path.CGPath;
    self.exclamationMarkBottomLayer.lineWidth = 6;
    self.exclamationMarkBottomLayer.strokeColor = self.likeRedColor.CGColor;
    self.exclamationMarkBottomLayer.fillColor = nil;
    
    // end status
    CGFloat strokeStart = (pathPartCount - visualPathPartCount ) / pathPartCount;
    CGFloat strokeEnd = 1.0;
    self.exclamationMarkBottomLayer.strokeStart = strokeStart;
    self.exclamationMarkBottomLayer.strokeEnd = strokeEnd;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @0;
    startAnimation.toValue = @(strokeStart);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @0;
    endAnimation.toValue = @(strokeEnd);
    
    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = kStep6FailDuration;
    
    [self.exclamationMarkBottomLayer addAnimation:anima forKey:nil];
}

#pragma mark - step7 fail
- (void)doStep7Fail {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.fromValue = @(-M_PI / 12);
    anima.toValue = @(M_PI / 12);
    anima.duration = kStep7FailDuration;
    
    /**
     *  会还原;
     */
    anima.autoreverses = YES;
    /**
     *  4次;
     */
    anima.delegate = self;
    anima.repeatCount = 4;
    [anima setValue:@"fall" forKey:kName];
    [self.layer addAnimation:anima forKey:@"fall"];
}

/**
 *  每段动画的回调;
 *
 *  @return ..
 */
#pragma mark - animation step stop
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([[anim valueForKey:kName] isEqualToString:@"step1"]) {
        [self doStep2];
    } else if ([[anim valueForKey:kName] isEqualToString:@"step2"]) {
        [self doStep3];
    } else if ([[anim valueForKey:kName] isEqualToString:@"step3"]) {
        if (self.isSuccess) {
            [self doStep4];
        } else {
            [self doStep6Fail];
        }
    } else if ([[anim valueForKey:kName] isEqualToString:@"step4"]) {
        [self doStep5];
    } else if ([[anim valueForKey:kName] isEqualToString:@"step5"]) {
        //        [self doStep6Success];
        
        [self endOfLoading];
    }
    
    else if ([[anim valueForKey:kName] isEqualToString:@"step6Fail"]) {
        [self doStep7Fail];
    }
    if([[anim valueForKey:kName] isEqualToString:@"fall"]||[[anim valueForKey:kName] isEqualToString:@"success"]){
        
        [self endOfLoading];
        
    }
}

-(void)endOfLoading{
    if (self.conpletion) {
        self.conpletion(YES);
    }
    
    [UIView animateWithDuration:0.8 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
