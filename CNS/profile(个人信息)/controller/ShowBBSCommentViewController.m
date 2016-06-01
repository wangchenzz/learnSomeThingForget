//
//  ShowBBSCommentViewController.m
//  CNS
//
//  Created by Mac on 16/5/30.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "ShowBBSCommentViewController.h"



@interface ShowBBSCommentViewController ()



@end

@implementation ShowBBSCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    //
    NSString *zuqiu = @"http://9138b6ddfcfc.ih5.cn/idea/qMF0Jzh";
    
    NSString *twelveone = @"http://e198c68ea3ab.ih5.cn/idea/RDos5Ox";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:zuqiu]];
    
    [self.view addSubview:webview];
    
    [webview loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
