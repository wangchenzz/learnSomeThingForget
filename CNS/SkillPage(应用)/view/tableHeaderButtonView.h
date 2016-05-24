//
//  tableHeaderButton.h
//  CNS
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tableHeaderButtonView;
@protocol tableHeaderButtonViewDelegate <NSObject>

@optional

-(NSArray *)titleArrayForTableHeaderButtonView:(tableHeaderButtonView *)view;

-(void)tableHeaderButtonView:(tableHeaderButtonView *)view didSelecte:(NSInteger)index;

@end

@interface tableHeaderButtonView : UIView

@property (nonatomic,weak) id <tableHeaderButtonViewDelegate> delegare;

@property (nonatomic,assign) NSInteger currentIndex;


+(instancetype)getHeader;



@end
