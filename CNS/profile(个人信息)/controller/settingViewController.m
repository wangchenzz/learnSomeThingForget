

//
//  settingViewController.m
//  CNS
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "settingViewController.h"
#import "loginViewController.h"

@interface settingViewController ()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic,strong) UITableView *tableView;

@end

@implementation settingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpTablevewBackColor];
    
//    UIColor *color = [UIColor colorWithRed:170/255.0 green:60/255.0 blue:99/255.0 alpha:1];
//    UIImage *image = [UIImage imageWithBgColor:color];
//    
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"setting"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"setting"];
        
        UILabel *quieLabel =[[UILabel alloc] init];
        
        quieLabel.frame = CGRectMake(0, 0, self.view.width, 50);
        
        quieLabel.textAlignment = NSTextAlignmentCenter;
        
        
        [cell.contentView addSubview:quieLabel];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        quieLabel.tag = 1;
    }
    
    UILabel *la = [cell viewWithTag:1];
    
    la.text = @"退出登录";
    
    return cell;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIAlertController *quitControl = [UIAlertController alertControllerWithTitle:@"退出当前账号" message:@"请注意,一旦退出登录,你将无法再进行任何操作" preferredStyle:UIAlertControllerStyleAlert];
    
    quitControl.title = @"退出登录!";
    quitControl.message = @"请注意,一旦退出登录,你将无法再进行任何操作";
    
    UIAlertAction *action1 =[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确认退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        [self ntmgtc];
        
        
        
    }];
    
    [quitControl addAction:action1];
    
    [quitControl addAction:action2];
    
//    quitControl.preferredAction = action1;
    
    [self presentViewController:quitControl animated:YES completion:nil];
    
}


-(void)ntmgtc{

    NSString*appDomain = [[NSBundle mainBundle]bundleIdentifier];
    
    [[NSUserDefaults standardUserDefaults]removePersistentDomainForName:appDomain];
    
    loginViewController *lc = [[loginViewController alloc] init];
    
    self.view.window.rootViewController = lc;
    
    [self.view.window makeKeyAndVisible];

    
    
}


@end
