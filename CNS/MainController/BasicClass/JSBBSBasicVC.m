//
//  JSBBSBasicVC.m
//  CNS
//
//  Created by Mac on 16/6/1.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSBBSBasicVC.h"

#import "detailInfoCell.h"

@implementation JSBBSBasicVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.isRefreshFooter = YES;
    
    self.isRefreshHeader = YES;
    
    self.curpage = 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    detailInfoCell *cell = [detailInfoCell cellForTableview:tableView];
    

    
    if ([self.dataSourceArray count] <= indexPath.row) {
        return cell;
    }
    
    detailBBSmodel *model = [self.dataSourceArray objectAtIndex:indexPath.row];
    cell.obj = model;

    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_delegate && [_delegate respondsToSelector:@selector(JSBBSBasicVC:didSelectedBBSModel:)]) {
        detailBBSmodel *model = [self.dataSourceArray objectAtIndex:indexPath.row];
        [_delegate JSBBSBasicVC:self didSelectedBBSModel:model];
    }
//    else {
//        EaseConversationModel *model = [self.dataArray objectAtIndex:indexPath.row];
//        EaseMessageViewController *viewController = [[EaseMessageViewController alloc] initWithConversationChatter:model.conversation.conversationId conversationType:model.conversation.type];
//        viewController.title = model.title;
//        [self.navigationController pushViewController:viewController animated:YES];
//    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        EaseConversationModel *model = [self.dataArray objectAtIndex:indexPath.row];
//        [[EMClient sharedClient].chatManager deleteConversation:model.conversation.conversationId deleteMessages:YES];
//        [self.dataArray removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

#pragma mark - data


- (void)tableViewRefreshHeader
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"loginName"] = [[NSUserDefaults standardUserDefaults] valueForKey:@"loginName"];
    
    dic[@"token"] = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    
//    dic[@"id"] = self.basicModel.num;
    
    dic[@"curPage"] = @"1";
    
    [[INetworking shareNet] GET:getCardById withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        
        if (!isSuccess) {
            [MBProgressHUD showError:@"连接失败"];
            return ;
        }
        
        self.dataSourceArray = [@[] mutableCopy];
        
        NSArray *answers = returnObject[@"list"];
        
        for (NSDictionary *dic in answers) {
            answerModel *model = [[answerModel alloc] init];
            
            model.commentContent = dic[@"content"];
            
            model.commentCreattime = dic[@"createtime"];
            
            model.commentLoginName = dic[@"nickName"];
            
            model.answerContent = dic[@"r_content"];
            
            model.answerLoginName = dic[@"r_nickName"];
            
            model.answerCreatTime = dic[@"r_creattime"];
            
            model.commentHeaderImageSStr = dic[@"img"];
            
            model.commentID = dic[@"id"];
            
            [model getFrame];
            
            [self.dataSourceArray addObject:model];
        }
        
        [self tableViewDidFinshRefresh:YES reload:YES];
        
    }];
 
}

-(void)tableViewRefreshFooter{


    
    [self tableViewDidFinshRefresh:NO reload:YES];
}


@end
