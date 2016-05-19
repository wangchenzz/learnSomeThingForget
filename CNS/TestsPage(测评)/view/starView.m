//
//  starView.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "starView.h"

@implementation starView

-(instancetype)init{
    if (self = [super init]) {
        self.starValue = 0;
        self.star1=[[UIImageView alloc] init];
        self.star2=[[UIImageView alloc] init];
        self.star3=[[UIImageView alloc] init];
        self.star4=[[UIImageView alloc] init];
        self.star5=[[UIImageView alloc] init];
        self.starArray = [NSMutableArray arrayWithObjects:self.star1,self.star2,self.star3,self.star4,self.star5, nil];
        
        
        for (UIImageView *star in self.starArray) {
            [self addSubview:star];
        }
    }
    return self;
}

-(void)layoutSubviews{
    for (int i = 0; i < 5 ; i ++) {
        
        UIImageView *star = self.starArray[i];
        star.centerY = self.centerY;
        star.centerX = self.width/6.0 *(i+1);
    }
    
    
}

+(instancetype)star{
    return [[self alloc] init];
}


-(void)setStarValue:(NSInteger)starValue{
    if (_starValue != starValue) {
        _starValue = starValue;
        for (int i = 0; i < 5; i ++) {
            UIImageView *star = self.starArray[i];
            if (i < starValue) {
                star.image = [UIImage imageNamed:@"wuxing1"];
//                [star setBackgroundColor:[UIColor redColor]];
                
            }else{
                star.image = [UIImage imageNamed:@"wuxing2"];
            }
            
            star.height = star.width = star.image.size.height * (star.image.scale - 1);
        }
        
        
    }

}

@end
