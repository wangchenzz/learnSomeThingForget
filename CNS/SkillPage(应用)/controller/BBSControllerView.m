//
//  BBSControllerView.m
//  CNS
//
//  Created by Mac on 16/5/19.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "BBSControllerView.h"

#import "BBSInfoListCell.h"

#import "DetailBBSController.h"

@interface BBSControllerView ()

@property (nonatomic,assign) NSInteger currentPage;

@property (nonatomic,retain) NSMutableArray *dataSourceModelArray;

@property (nonatomic,assign) BOOL isLoading;


@end

@implementation BBSControllerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentPage = 1;
    
    self.dataSourceModelArray = [NSMutableArray array];
    
    
    [self setUpTablevewBackColor];
    
    
    [self loadBBSInfo];
    
//    self.tableView.tableHeaderView = self.headerView;
}

-(instancetype)initWithType:(NSInteger)typeNum{

    if (self = [super init]) {
        self.BBSType = typeNum;
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_dataSourceModelArray.count == 0&&!_isLoading) {
        [self loadBBSInfo];
    }

}



-(void)loadBBSInfo{
    
    self.isLoading = YES;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"curPage"] = [NSString stringWithFormat:@"%ld",self.currentPage];
    dic[@"type"] = @"1";
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    
    [[INetworking shareNet] GET:getCard withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        
        if (!isSuccess) {
            
            [MBProgressHUD showError:@"链接失败"];
            self.isLoading = NO;
            return ;
        }
    
        NSArray *listArray = returnObject[@"list"];
        for (NSDictionary *dic in listArray) {
            
//            NSLog(@"%@",dic);
            JSBbsInfoModel *model = [[JSBbsInfoModel alloc] init];
            
            model.loginName = dic[@"loginName"];
            model.createtime = dic[@"createtime"];
            model.ctr = dic[@"ctr"];
            model.headerImageUrlStr = dic[@"img"];
            model.type = dic[@"type"];
            model.num = dic[@"id"];
            model.title = dic[@"title"];
            model.content = dic[@"content"];
            model.pCount = dic[@"pCount"];
            [self.dataSourceModelArray addObject:model];
        }
        
        [self.tableView reloadData];
        
        self.isLoading = NO;
        
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceModelArray.count;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BBSInfoListCell *cell = [BBSInfoListCell cellForTableview:tableView];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    BBSInfoListCell *cel = (BBSInfoListCell *)cell;
    
    cel.model = self.dataSourceModelArray[indexPath.row];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailBBSController *dc = [[DetailBBSController alloc] init];
    [self.navi pushViewController:dc animated:YES];
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 116;
}

@end
