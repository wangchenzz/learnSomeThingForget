//
//  testPViewController.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "testPViewController.h"

#import "buttonView.h"

#import "ModuleChooseController.h"


/**
 *  显示标准测试结果.
 */
#import "normalShowLevelController.h"

/**
 *  显示2种查询信息和模块测试结果..
 */
#import "showLevelController.h"


#import "FirstViewController.h"

@interface testPViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) UITableView  *tableView;




@end

@implementation testPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUi];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    
}


-(void)setUpUi{
    
    UITableView *tableView = [[UITableView alloc] init];
    
    tableView.frame =CGRectMake(0, 0, JSFrame.size.width, 120 * 3);
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:tableView.frame];
    
    backView.image = [UIImage imageNamed:@"kuang-sy"];
    
    self.tableView = tableView;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:backView];
    
    [self.view addSubview:tableView];
    
    tableView.scrollEnabled = NO;
    
    [ self . tableView setSeparatorColor : JSLineColor];
    //    [self.tableView.backgroundView addSubview:backView];
    
    //    self.view1 = [buttonView viewWithTile:@"标准测试" withHeadImage:@"s" withIntroduce:@"系统的测试各项模块" withEnglishStr:@"Standard Assessment"] ;
    //    self.view1.width = JSFrame.size.width - 30;
    //    self.view1.height = self.view.height * .15;
    //
    //    self.view1.centerX = self.view.centerX;
    //
    //    self.view1.centerY = self.view.height * .2;
    //
    //    [self.view addSubview:self.view1];
    //
    //    self.view2 = [buttonView viewWithTile:@"模块测试" withHeadImage:@"e" withIntroduce:@"自选模块,专项训练" withEnglishStr:@"Evaluation Module"];
    //    self.view2.width = JSFrame.size.width - 30;
    //    self.view2.height = self.view.height * .15;
    //
    //    self.view2.centerX = self.view.centerX;
    //
    //    self.view2.centerY = self.view.height * .4;
    //
    //    [self.view addSubview:self.view2];
    //
    //
    //    self.view3 = [buttonView viewWithTile:@"记录查询" withHeadImage:@"r" withIntroduce:@"查看更多历史测评记录" withEnglishStr:@"Records Check"] ;
    //    self.view3.width = JSFrame.size.width - 30;
    //    self.view3.height = self.view.height * .15;
    //
    //    self.view3.centerX = self.view.centerX;
    //
    //    self.view3.centerY = self.view.height * .6;
    //
    //    [self.view addSubview:self.view3];
    //
    //
    //    _tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBut:)];
    //    _tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBut:)];
    //    _tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBut:)];
    //
    //
    //    [self.view1 addGestureRecognizer:_tap1];
    //
    //    [self.view2 addGestureRecognizer:_tap2];
    //
    //    [self.view3 addGestureRecognizer:_tap3];
}


//-(void)clickBut:(UITapGestureRecognizer *)tap{
//    if (tap == _tap1) {
//        /**
//         *标准测试
//         */
//        FirstViewController *fc = [[FirstViewController alloc] init];
//
//        [self.navigationController pushViewController:fc animated:YES];
//
//
//    }else if(tap == _tap2){
//        /**
//         *模块测试
//         */
//        ModuleChooseController *vc = [[ModuleChooseController alloc] init];
//
//        vc.hidesBottomBarWhenPushed = YES;
//
//        [self.navigationController pushViewController:vc animated:YES];
//
//
//
//        JSLog(@"2");
//    }else if (tap == _tap3){
//
//        showLevelController *level = [[showLevelController alloc] init];
//
//        [self.navigationController pushViewController:level animated:YES];
//
//    }
//}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testPView"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testPView"];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.frame = CGRectMake(15, 10, 120, 100);
    
    UILabel *TitlLabels = [[UILabel alloc] init];
    
    TitlLabels.textColor = JSTitleColor;
    
    TitlLabels.font = JSFont(19);
    
    TitlLabels.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 15, JSFrame.size.width * .6, 30);
    
    TitlLabels.textAlignment = NSTextAlignmentLeft;
    
    UILabel *InfoLabel = [[UILabel alloc] init];
    
    InfoLabel.textColor = JSContentDescColor;
    
    InfoLabel.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, CGRectGetMaxY(TitlLabels.frame)+4, JSFrame.size.width * .6, 30);
    InfoLabel.font = JSFont(14);
    
    InfoLabel.textAlignment = NSTextAlignmentLeft;
    [cell.contentView addSubview:imageView];
    
    [cell.contentView addSubview:TitlLabels];
    
    [cell.contentView addSubview:InfoLabel];
    
    if (indexPath.row == 0) {
        imageView.image = [UIImage imageNamed:@"biaozhun"];
        TitlLabels.text = @"标准测试";
        InfoLabel.text = @"系统的测试各项模块";
    }
    if (indexPath.row == 1) {
        
        imageView.image = [UIImage imageNamed:@"mokuai"];
        TitlLabels.text = @"模块测试";
        InfoLabel.text = @"自选模块,专项训练";
    }
    if (indexPath.row == 2) {
        
        imageView.image = [UIImage imageNamed:@"jilu"];
        TitlLabels.text = @"记录查询";
        InfoLabel.text = @"查看更多历史测评记录";
    }
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 120;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row  == 0) {
        /**
         *标准测试
         */
        FirstViewController *fc = [[FirstViewController alloc] init];
        
        [self.navigationController pushViewController:fc animated:YES];
        
        
    }else if(indexPath.row  == 1){
        /**
         *模块测试
         */
        ModuleChooseController *vc = [[ModuleChooseController alloc] init];
        
        vc.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:vc animated:YES];
        
        
        
        JSLog(@"2");
    }else if (indexPath.row  == 2){
        
        showLevelController *level = [[showLevelController alloc] init];
        
        [self.navigationController pushViewController:level animated:YES];
        
    }
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
    
    self.navigationController.navigationBar.hidden = NO;
    
}



@end
