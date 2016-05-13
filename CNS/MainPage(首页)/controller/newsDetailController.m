//
//  newsDetailController.m
//  CNS
//
//  Created by Mac on 16/5/12.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "newsDetailController.h"

#import "newsDtailCell.h"



@interface newsDetailController ()

@property (nonatomic,strong) JSNewsFrameModel *model;

@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation newsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 1;
    
    //?loginName=yxj&token=e3592eb60392ce73d6247e9aab02e93e&id=1
    
    
    self.title = @"新闻";
    
    [self setUpTablevewBackColor];
}


-(void)setCurrentModel:(JSNewsModel *)currentModel{
    
    if (_currentModel != currentModel) {
    
    _currentModel = currentModel;

    JSNewsFrameModel *model = [[JSNewsFrameModel alloc] initWithModel:self.currentModel];
    
    self.model = model;
    
    NSMutableDictionary *infoDic =[NSMutableDictionary dictionary];
    
    infoDic[@"loginName"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"loginName"];
    
    
    infoDic[@"token"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
    
    infoDic[@"id"] = self.currentModel.num;
    
    
    [[INetworking shareNet] GET:DetailNews withParmers:infoDic do:^(id returnObject, BOOL isSuccess) {
        
        if (isSuccess) {
            self.model.commentNum = [NSString stringWithFormat:@"评论 %@",returnObject[@"countPage"]];
            self.model.likeNum = [NSString stringWithFormat:@"赞 %@",returnObject[@"zanCount"]];
            self.model.commentArray = returnObject[@"list"];
            self.model.isLike = [returnObject[@"msg"]isEqualToString:@"您已经点过赞"];
            
            
            
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:nil];
            
        }
    }];
    }
}

-(void)setUpTablevewBackColor{
    UIImageView *backrounView = [[UIImageView alloc] init];
    
    [backrounView setFrame:CGRectMake(0, 0, self.view.width, JSFrame.size.height)];
    
    backrounView.image = [UIImage imageNamed:@"底色"];
    
    [self.tableView setValue:backrounView forKeyPath:@"backgroundView"];
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
