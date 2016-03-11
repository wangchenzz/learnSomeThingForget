//
//  JSKeyBoardView.h
//  CNS
//
//  Created by Mac on 16/3/10.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol JSKeyBoardViewDelegate <NSObject>

- (void) numberKeyBoardInput:(NSInteger) number;

@end

@interface JSKeyBoardView : UIView


@property (nonatomic,weak) id <JSKeyBoardViewDelegate> delegate;

- (void)customView:(CGRect)frame;


@end
