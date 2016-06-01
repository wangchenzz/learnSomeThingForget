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

#import "newsDetailController.h"


@interface MainPageViewController ()

@property (nonatomic,strong) NSMutableArray *newsInfoArray;


@property (nonatomic,strong) NSMutableArray *ary;

@property (nonatomic,assign) NSInteger currentPage;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.newsInfoArray = [NSMutableArray array];
    
    self.ary = [NSMutableArray array];
    
    self.currentPage = 1;
    
    [self loadInfo];
    
    [self setUpScrollView];
    

    [self setUpTablevewBackColor];

    self.tabBarController.tabBar.hidden = NO;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadInfo)];
    JSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).lastObject);
}



-(void)loadInfo{

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"curPage"] = [NSString stringWithFormat:@"%ld",self.currentPage];
    dic[@"type"] = @"1";
//    dic[@"loginName"] = ec8a48252a6f3e0b49435a22d843862a;
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    
    [[INetworking shareNet] GET:newsUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        NSArray *infoAry;
        if (isSuccess) {
            infoAry = returnObject[@"list"];
        }
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
    
    [imaegView setFrame:CGRectMake(0, 0, self.view.width,self.view.height * .4)];
    
    imaegView.delegate = self;
    
    self.tableView.tableHeaderView = (UIView *)imaegView;
    
    [imaegView showAnimation];
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppearviewDidAppearviewDidAppearviewDidAppearviewDidAppearviewDidAppear");
}


#pragma mark - animationScrollDelegate

-(void)animationScroll:(animationScroll *)scroll didClickInIndex:(NSInteger)index{
    JSLog(@"%ld",index);
}


-(UIImage *)animationScroll:(animationScroll *)scroll imageForIndex:(NSInteger)index{

    return [UIImage imageNamed:@"banner"];
}

-(NSString *)animationScroll:(animationScroll *)scroll textForIndex:(NSInteger)index{

        return @"全球注意力训练,学习能力专家.";

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
    
    if (![_ary containsObject:@(indexPath.row)]) {
        CATransform3D rotation;//3D旋转
        
        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
        //    rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转
        
        rotation = CATransform3DScale(rotation, 0.9, .9, 1);
        
        rotation.m34 = 1.0/ -800;
        
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        //        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        
        [UIView beginAnimations:@"rotation" context:NULL];
        //旋转时间
        [UIView setAnimationDuration:1];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        [UIView commitAnimations];
    }
    
    [_ary addObject:@(indexPath.row)];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}

/**
 *  跳转页面展示新闻
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JSNewsModel *currentModel = self.newsInfoArray[indexPath.row];
    
    newsDetailController *newVC = [[newsDetailController alloc] init];
    
   newVC.hidesBottomBarWhenPushed = YES;
    
    newVC.currentModel = currentModel;
    
    [self.navigationController pushViewController:newVC animated:YES];

}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *view =[[UIView alloc] init];
    
    [view setBackgroundColor:[UIColor clearColor]];
    
    UIView *backView =[[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.width, 38)];
    
    backView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.3];
    [view addSubview:backView];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 24, 24)];
    imageview.image = [UIImage imageNamed:@"new"];
    
    UILabel *titleLbale =[[UILabel alloc] init];
    
    titleLbale.frame = CGRectMake(38, 3, 140, 32);
    
    titleLbale.font = [UIFont boldSystemFontOfSize:20];
    
    titleLbale.textColor = [UIColor whiteColor];
    
    titleLbale.text = @"竞思新闻";
    
    [backView addSubview:imageview];
    
    [backView addSubview:titleLbale];
    
    return view;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50;
}

@end
