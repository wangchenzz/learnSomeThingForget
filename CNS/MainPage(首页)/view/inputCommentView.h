//
//  inputCommentView.h
//  CNS
//
//  Created by Mac on 16/5/16.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>


@class inputCommentView;

@protocol inputCommentViewDelegate <NSObject>

-(void)inputCommentViewShowKeyBord:(inputCommentView*)view with:(CGFloat)heght;

-(void)inputCommentViewHideKeyBord:(inputCommentView*)view;

/**
 *  点击确定的回调
 */
-(void)clickSend:(inputCommentView *)view;

@end

@interface inputCommentView : UIView<UITextViewDelegate>


@property (nonatomic,weak) id<inputCommentViewDelegate>delegate;


@property (nonatomic,weak) UITextView *inputTextView;

@property (nonatomic,weak) UIButton *sendButton;

/**
 *  提示文字;
 */
@property (nonatomic,copy) NSString *tipsSting;


+(instancetype)put;

@end
