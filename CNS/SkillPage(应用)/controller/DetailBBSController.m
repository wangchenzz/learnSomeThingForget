//
//  DetailBBSController.m
//  CNS
//
//  Created by Mac on 16/5/24.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "DetailBBSController.h"

@interface DetailBBSController ()<UITableViewDelegate,UITableViewDataSource,addCommentControllerDelegate>

@property (nonatomic,retain) NSMutableArray *answerArray;

@property (nonatomic,retain) UIButton *commentButton;

@property (nonatomic,assign) BOOL isAdding;

@property (nonatomic,retain) detailBBSmodel *impModel;

@property (nonatomic,assign,getter=isAdmin) BOOL admin;




@end

@implementation DetailBBSController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.answerArray = [NSMutableArray array];
    
    [self setUpTableView];
    
    [self setUpBBSInfo];
    
//    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.impModel = [[detailBBSmodel alloc] init];
    
    self.impModel.basicModel = self.basicModel;
    
    [self setComentButtonUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)isAdmin{

    return [[[NSUserDefaults standardUserDefaults]valueForKey:@"loginName"] isEqualToString:self.basicModel.loginName];

}

-(void)setUpTableView{
    
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.frame = CGRectMake(0, 0, self.view.width,self.view.height);
    
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    

    
    UIImageView *backrounView = [[UIImageView alloc] init];
    
    [backrounView setFrame:CGRectMake(0, 0, self.view.width, JSFrame.size.height)];
    
    backrounView.image = [UIImage imageNamed:@"底色"];
    
    [self.tableView setValue:backrounView forKeyPath:@"backgroundView"];
}

-(void)setUpBBSInfo{

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults] valueForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    
    dic[@"id"] = self.basicModel.num;
    
    dic[@"curPage"] = @"1";
    
    [[INetworking shareNet] GET:getCardById withParmers:dic do:^(id returnObject, BOOL isSuccess) {
    
        if (!isSuccess) {
            [MBProgressHUD showError:@"连接失败"];
            return ;
        }
        
        NSLog(@"%@",returnObject);
        
        NSArray *answers = returnObject[@"list"];
        
        for (NSDictionary *dic in answers) {
            answerModel *model = [[answerModel alloc] init];
            
            model.commentContent = dic[@"content"];
            
            model.commentCreattime = dic[@"createtime"];
            
            model.commentLoginName = dic[@"loginName"];
            
            model.answerContent = dic[@"r_content"];
            
            model.answerLoginName = dic[@"r_loginName"];
            
            model.answerCreatTime = dic[@"r_creattime"];
            
            [model getFrame];
            
            [self.answerArray addObject:model];
        }
        
        [self.tableView reloadData];
        
    }];
}


-(void)setComentButtonUp{

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageNamed:@"addComment"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(writeComment:) forControlEvents:UIControlEventTouchUpInside];
    
    button.width = button.height = 40;
    
    button.layer.cornerRadius = 20;
    
    button.layer.masksToBounds = YES;
    
    button.centerX = self.view.width * .85;
    
    button.centerY = self.view.height * .8;
    
    [self.view addSubview:button];
    
    
    self.commentButton = button;

}

-(void)writeComment:(UIButton *)but{
    if (!_isAdding) {
        
        _isAdding = YES;
        
        UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [commentButton setTag:2];
        
        
        commentButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [commentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        [commentButton setTitle:@"添加评论" forState: UIControlStateNormal];
        
        [commentButton setBackgroundColor:JSCOLOR];
        
        
        
        [commentButton sizeToFit];
        
        commentButton.layer.cornerRadius = 5;
        
        commentButton.layer.masksToBounds = YES;
        
        commentButton.centerX = but.centerX;
        
        commentButton.centerY = but.centerY - 60;
        
        [self.view addSubview:commentButton];
        
        
        [commentButton addTarget:self action:@selector(clickPushToComment) forControlEvents:UIControlEventTouchUpInside];
        
        
        commentButton.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
        
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            but.transform = CGAffineTransformMakeRotation(M_PI+M_PI_4);
            
            /**
             制造蒙版
             */
            
            UIView *menban = [[UIView alloc] initWithFrame:self.view.bounds];
            
            menban.tag = 1;
            
            [self.view addSubview:menban];
            
            [self.view insertSubview:menban belowSubview:but];
            
            menban.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0];
            
            menban.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.7];
            
            /**
             *  按钮donghua
             */
            commentButton.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            /**
             *  动画完成
             */
            
            
        }];
    }else if(_isAdding){
        [UIView animateWithDuration:0.4 animations:^{
            
            but.transform = CGAffineTransformIdentity;
            
            UIView *v = [self.view viewWithTag:1];
            
            v.alpha = 0;
            
            
            UIView *b = [self.view viewWithTag:2];
            
            b.transform = CGAffineTransformMakeScale(0.01, 0.01);
            
            
        } completion:^(BOOL finished) {
            UIView *v = [self.view viewWithTag:1];
            
            [v removeFromSuperview];
            
            v = nil;
            
            
            UIView *b = [self.view viewWithTag:2];

            
            [b removeFromSuperview];
            
            b = nil;
            
            NSLog(@"%@",v);
            
            
            _isAdding = NO;
            
        }];

        
        
    }
}


-(void)clickPushToComment{
    
    addCommentController *vc = [[addCommentController alloc] init];
    
    vc.BBSid = self.impModel.basicModel.num;
    
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    [self writeComment:self.commentButton];


}


#pragma mark - delegate;

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return self.impModel.totalHeight;
    }else{
        answerModel *model = self.answerArray[indexPath.row - 1];
        
        return model.commentTotalHeight + model.answerTotalHeight;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    detailInfoCell *cell = [detailInfoCell cellForTableview:tableView];
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   return self.answerArray.count + 1;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    detailInfoCell *ce = (detailInfoCell *)cell;
    
    if (indexPath.row == 0) {
        ce.obj = self.impModel;
    }else{
        ce.obj = self.answerArray[indexPath.row - 1];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    answerModel *model = self.answerArray[indexPath.row - 1];
    
    if (!_admin || model.isAnswer) {
        return;
    }
    
    


}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    static BOOL isAnimation;
    static BOOL isHidden;
    
    if (scrollView.contentOffset.y > 10&&!isAnimation&&!isHidden) {
        
        
        NSLog(@"1");
        
        isAnimation = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(JSNavigationBounds));
            self.navigationController.navigationBar.alpha = 0.5;
        } completion:^(BOOL finished) {
            isAnimation = NO;
            isHidden = YES;
        }];
    }else if(scrollView.contentOffset.y < 10&&!isAnimation&&isHidden){
        NSLog(@"2");
        isAnimation = YES;
        [UIView animateWithDuration:0.5 animations:^{
            self.navigationController.navigationBar.transform = CGAffineTransformIdentity;

            self.navigationController.navigationBar.alpha = 1;
        } completion:^(BOOL finished) {
            isAnimation = NO;
            isHidden = NO;
        }];
    }
}


#pragma mark - vcdelegate

-(void)addCommentController:(addCommentController *)comment didSendComment:(NSMutableDictionary *)dic{

    answerModel *model = [[answerModel alloc] init];
    
    model.commentContent = dic[@"content"];
    
    
    model.commentLoginName = dic[@"loginName"];
    
    
    model.commentCreattime = @"刚刚";
    
    model.answerLoginName = (NSString *)[NSNull null];
    
    

    [model getFrame];
    
    [self.answerArray insertObject:model atIndex:0];
    

    [self.tableView reloadData];
    
}


@end
