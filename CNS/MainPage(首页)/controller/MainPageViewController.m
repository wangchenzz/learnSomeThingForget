//
//  MainPageViewController.m
//  CNS
//
//  Created by Mac on 16/4/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "MainPageViewController.h"

#import "NewsCell.h"

#import "JSNewsModel.h"

#define newsUrl @"http://xxlccw.cn/SSM/news/getNewsByType"

@interface MainPageViewController ()

@property (nonatomic,strong) NSMutableArray *newsInfoArray;

@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsInfoArray = [NSMutableArray array];
    
    self.currentPage = 1;
    
    [self loadInfo];
    
    [self setUpScrollView];

    self.tabBarController.tabBar.hidden = NO;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadInfo)];
    
}

-(void)loadInfo{

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"curPage"] = [NSString stringWithFormat:@"%ld",self.currentPage];
    dic[@"type"] = @"1";
//    dic[@"loginName"] = ec8a48252a6f3e0b49435a22d843862a;
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    
    [[INetworking shareNet] GET:newsUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        NSArray *infoAry = returnObject[@"list"];
        if (isSuccess && infoAry.count != 0) {
            
            for (NSDictionary *dic in infoAry) {
                JSNewsModel *model = [[JSNewsModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.newsInfoArray addObject:model];
            }
            
            self.currentPage++;
            [self.tableView.mj_footer endRefreshing];
            [self.tableView reloadData];
        }
        else{
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }];
}

/**
 *  创建 scrollview
 */
-(void)setUpScrollView{
    
    animationScroll *imaegView = [animationScroll getScroll];
    
    [imaegView setFrame:CGRectMake(0, 0, self.view.width,self.view.height * .33)];
    
    imaegView.delegate = self;
    
    self.tableView.tableHeaderView = (UIView *)imaegView;
    
    [imaegView showAnimation];
    
}


#pragma mark - animationScrollDelegate

-(void)animationScroll:(animationScroll *)scroll didClickInIndex:(NSInteger)index{
    JSLog(@"%ld",index);
}


-(UIImage *)animationScroll:(animationScroll *)scroll imageForIndex:(NSInteger)index{

    if (index / 2 == 1) {
        return [UIImage imageNamed:@"visualImage1"];
    }else{
        return [UIImage imageNamed:@"visualImage2"];
    }
    
}

-(NSString *)animationScroll:(animationScroll *)scroll textForIndex:(NSInteger)index{

    if (index == 1) {
        return @"123";
    }else{
        return @"志宰";
    }

}

-(NSInteger)numberOfImageInScrollView:(animationScroll *)scroll{

    return 4;

}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsInfoArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cell = [NewsCell cellForTableview:tableView];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cel  =  (NewsCell *)cell;
    cel.model = self.newsInfoArray[indexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}


@end
