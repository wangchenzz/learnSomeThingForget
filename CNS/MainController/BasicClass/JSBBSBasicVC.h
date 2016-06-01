//
//  JSBBSBasicVC.h
//  CNS
//
//  Created by Mac on 16/6/1.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSRefreshTableViewController.h"

@class JSBBSBasicVC;

@protocol JSBBSBasicVCDelegate <NSObject>

@required

-(void)JSBBSBasicVC:(JSBBSBasicVC *)vc didSelectedBBSModel:(id)BBSmodel;

@end

@interface JSBBSBasicVC : JSRefreshTableViewController

@property (nonatomic,weak) id <JSBBSBasicVCDelegate> delegate;

@end
