//
//  JSWriteAnimationView.m
//  1.5-2015
//
//  Created by Mac on 16/2/24.
//  Copyright © 2016年 竟思. All rights reserved.
//

#import "JSWriteAnimationView.h"

@interface JSWriteAnimationView ()


@property (nonatomic, retain) CALayer *animationLayer;
@property (nonatomic, retain) CAShapeLayer *pathLayer;
@property (nonatomic, retain) CALayer *penLayer;

@end

@implementation JSWriteAnimationView
-(instancetype)init{
    
    if (self = [super init]) {
        [self setupTextLayer];
        
        [self setBackgroundColor:[UIColor redColor]];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupTextLayer];
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
    
}

- (void) setupTextLayer
{
    self.animationLayer = [CALayer layer];
    self.animationLayer.frame = CGRectMake(20.0f, 64.0f,
                                           CGRectGetWidth(self.layer.bounds) - 40.0f,
                                           CGRectGetHeight(self.layer.bounds) - 84.0f);
    [self.layer addSublayer:self.animationLayer];
    
    if (self.pathLayer != nil) {
        [self.penLayer removeFromSuperlayer];
        [self.pathLayer removeFromSuperlayer];
        self.pathLayer = nil;
        self.penLayer = nil;
    }
    
    /**
     *   这个 letter 是 path
     */
    CGMutablePathRef letters = CGPathCreateMutable();
    
    /**
     *  font 是字体信息
     */
    CTFontRef font = CTFontCreateWithName(CFSTR("Helvetica-Bold"), 72.0f, NULL);
    
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
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(font);
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.animationLayer.bounds;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    //pathLayer.backgroundColor = [[UIColor yellowColor] CGColor];
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 3.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.animationLayer addSublayer:pathLayer];
    
    self.pathLayer = pathLayer;
//    
//    UIImage *penImage = [UIImage imageNamed:@"noun_project_347_2.png"];
//    CALayer *penLayer = [CALayer layer];
//    penLayer.contents = (id)penImage.CGImage;
//    penLayer.anchorPoint = CGPointZero;
//    penLayer.frame = CGRectMake(0.0f, 0.0f, penImage.size.width, penImage.size.height);
//    [pathLayer addSublayer:penLayer];
//    
//    self.penLayer = penLayer;
}



- (void) startAnimation
{
    
    [self.pathLayer removeAllAnimations];
    [self.penLayer removeAllAnimations];
    
    self.penLayer.hidden = NO;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 10.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    //    CABasicAnimation *pathAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    //    pathAnimation2.duration = 10.0;
    //    pathAnimation2.fromValue = [NSNumber numberWithFloat:0.5f];
    //    pathAnimation2.toValue = [NSNumber numberWithFloat:0.0f];
    //
    //    CAAnimationGroup *group = [CAAnimationGroup animation];
    //    group.animations = @[pathAnimation,pathAnimation2];
    //    group.autoreverses = YES;
    //    group.duration = 10.0f;
    //    group.repeatCount = 1;
    
    
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    CAKeyframeAnimation *penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    penAnimation.duration = 10.0;
    penAnimation.path = self.pathLayer.path;
    penAnimation.calculationMode = kCAAnimationPaced;
    penAnimation.delegate = self;
    [self.penLayer addAnimation:penAnimation forKey:@"position"];
}


- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.penLayer.hidden = YES;
}



- (void)dealloc
{
    self.animationLayer = nil;
    self.pathLayer = nil;
    self.penLayer = nil;
}



@end
