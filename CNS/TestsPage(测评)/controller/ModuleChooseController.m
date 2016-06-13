//
//  ModuleChooseController.m
//  CNS
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "ModuleChooseController.h"

#import "TestRoomController.h"

@interface ModuleChooseController ()

@property (nonatomic,retain) NSArray *nameArray;

@property (nonatomic,retain) NSArray *imageArray;

@end

@implementation ModuleChooseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = NO;
    
    [self setUpTablevewBackColor];
    
    self.title = @"模块测试";
    
    _nameArray = @[@"语言注意力测试",@"视觉注意力测试",@"手指点击测试",@"符号位数测试",@"颜色反差测试",@"注意力转移测试",@"持续注意力测试"];
    _imageArray = @[@"ceshi1",@"ceshi2",@"ceshi3",@"ceshi4",@"ceshi5",@"ceshi6",@"ceshi7"];
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
    return _nameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ModuleCell *cell = [ModuleCell cellForTableview:tableView];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    ModuleCell *rail = (ModuleCell *)cell;
    
    rail.nameLabel.text = _nameArray[indexPath.row];
    
    rail.mainImage.image = [UIImage imageNamed:_imageArray[indexPath.row]];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (self.view.width - 16)/3 + 8;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TestRoomController *rom = [[TestRoomController alloc] initWithStyle:UITableViewStyleGrouped];
    
    rom.type = indexPath.row+1;
    
    [self.navigationController pushViewController:rom  animated:YES];
}

@end
