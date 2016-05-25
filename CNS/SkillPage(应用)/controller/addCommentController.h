//
//  addCommentController.h
//  CNS
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@class addCommentController;

@protocol  addCommentControllerDelegate <NSObject>


@optional

-(void)addCommentController:(addCommentController *)comment didSendComment:(NSMutableDictionary *)dic;

@end

@interface addCommentController : UIViewController

@property (nonatomic,copy) NSString* BBSid;

@property (nonatomic,weak) id<addCommentControllerDelegate>delegate;

@end
