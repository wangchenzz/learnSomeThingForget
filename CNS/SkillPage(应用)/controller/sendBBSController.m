
//
//  AddCommentController.m
//  CNS
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "sendBBSController.h"

@interface sendBBSController ()

@property (nonatomic,retain) UILabel *titleTipsLabel;


@property (nonatomic,retain) UILabel *commentTipsLabel;


@property (nonatomic,retain) UITextField *titleFiled;


@property (nonatomic,retain) UITextView *commentView;


@end

@implementation sendBBSController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"发帖";
    
    [self setUpView];
}

-(void)setUpView{

    CGFloat yBJ = 8;
    CGFloat xBJ = 13;
    CGFloat labelHeigt = 50;
    self.titleTipsLabel = ({
        
        self.titleTipsLabel = [[UILabel alloc] init];
        
        self.titleTipsLabel.width = self.view.width - 2 * xBJ;
        
        self.titleTipsLabel.height = labelHeigt;
        
        self.titleTipsLabel.x = xBJ;
        
        self.titleTipsLabel.y = yBJ;
        
        self.titleTipsLabel.textColor = [UIColor whiteColor];
        
        self.titleTipsLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleTipsLabel.font = JSFont(16);
        
        self.titleTipsLabel;
        
    } );
    
    
    self.titleFiled = ({
        
        self.titleFiled = [[UITextField alloc] init];
        
        
        
        
        self.titleFiled;
    });
    

}


@end
