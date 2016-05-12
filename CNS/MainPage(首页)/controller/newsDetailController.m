//
//  newsDetailController.m
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "newsDetailController.h"

#import "newsDtailCell.h"

#define CommentUrl @"http://www.xxlccw.cn/SSM/news/selectNewById"

@interface newsDetailController ()

@property (nonatomic,strong) JSNewsFrameModel *model;

@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation newsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    
    JSNewsFrameModel *model = [[JSNewsFrameModel alloc] initWithModel:self.currentModel];
    
    self.model = model;
}



-(void)loadSomeComment{
    
    /**
     *  ?id=1&loginName=yxj&token=78056b605739a9f27e17be00d302153d&curPage=1
     */
    
    NSMutableDictionary *parmars = [NSMutableDictionary dictionary];
    
    parmars[@"id"] = self.currentModel.num;
    parmars[@"loginName"] = self.currentModel.loginName;
    parmars[@"token"] = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    parmars[@"curPage"] = [NSString stringWithFormat:@"%ld",self.currentPage];
    

}



#pragma mark - tableviewDelegate

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    newsDtailCell *cell = [newsDtailCell cellForTableview:tableView];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    newsDtailCell *rail = (newsDtailCell *)cell;
    rail.model = self.model;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.model.totalHeight;
}


@end
