//
//  TestRoomController.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "TestRoomController.h"

#import "questionModel.h"

#import "questionTypeCell.h"

#import "FirstViewController.h"

@interface TestRoomController ()

@property (nonatomic,retain) NSMutableArray *modelArray;

@end

@implementation TestRoomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelArray = [NSMutableArray array];
    
    self.title = @"难度选择";
    
    [self setUpTablevewBackColor];
    
    [self loadQ];
    
}

-(void)loadQ{

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"type"] = @(_type);
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"loginName"];
    dic[@"token"] = [[NSUserDefaults standardUserDefaults]valueForKey:@"token"];
    
    [[INetworking shareNet] GET:getQustType withParmers:dic do:^(id returnObject, BOOL isSuccess) {
       
        if (isSuccess) {
            NSArray *ary = returnObject[@"list"];
            
            for (NSDictionary *dic in ary) {
                questionModel *model = [[questionModel alloc] init];
                model.title = dic[@"title"];
                model.num = dic[@"id"];
                model.type = [NSString stringWithFormat:@"%ld",self.type];
                model.diffcult = dic[@"difficulty"];
                model.subject = dic[@"subject"];

                [self.modelArray addObject:model];
            }
            
            
            if (ary.count == 0) {
                JSTestCurrentState stated;
                switch (_type) {
                    case 1:
                        stated = JSTestCurrentLanguageShow;
                        break;
                    case 2:
                        stated = JSTestCurrentVisualShow;
                        break;
                    case 3:
                        stated = JSTestCurrentClickTestLeft;
                        break;
                    case 4:
                        stated = JSTestCurrentSymbolTest;
                        break;
                    case 5:
                        stated = JSTestCurrentSimplifyStroopTests;
                        break;
                    case 6:
                        stated = JSTestCurrentShiftingAttentionTests;
                        break;
                    case 7:
                        stated = JSTestCurrentContinuousPerformanceTests;
                        break;
                        
                    default:
                        break;
                }
                
                FirstViewController *first = [[FirstViewController alloc]initWithIsModule:YES andWithState:stated andWithArray:nil andWithdifcultLevel:0];
                
                first.ModuleType = self.type;
                
                [self.navigationController pushViewController:first animated:YES];
            }
            
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:nil];
        }else{
            /**
             *  在这里直接进行测试.进行调用本地的题目.
             */
        
        
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    questionTypeCell *cell = [questionTypeCell cellForTableview:tableView];
    
    questionModel *model = self.modelArray[indexPath.row];
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%@",model.num];
    
    cell.titleLabel.text = model.title;
    
    cell.difficuleStar.starValue = [model.diffcult integerValue];
    
    [cell.beginButton addTarget:self action:@selector(beginT:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.beginButton setTag:indexPath.row];
    
    return cell;
}

-(void)beginT:(UIButton *)sender{
    questionModel *model = self.modelArray[sender.tag];
    
    NSInteger diflevel = [model.diffcult integerValue];
    
    NSArray *qArray = [model.subject componentsSeparatedByString:@","];
    JSTestCurrentState stated;
    if ([model.type isEqualToString:@"1"]) {
       stated  = JSTestCurrentLanguageShow;
    }else{
        stated = JSTestCurrentVisualShow;
    }
    
    FirstViewController *first = [[FirstViewController alloc]initWithIsModule:YES andWithState:stated andWithArray:qArray andWithdifcultLevel:diflevel];
    
    first.ModuleType = _type;
    
    first.ModuleQuesId = model.num;
    
    first.ModuleQyesDiff = model.diffcult;
    
    [self.navigationController pushViewController:first animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;

}
@end
