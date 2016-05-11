//
//  loginViewController.m
//  CNS
//
//  Created by Mac on 16/4/25.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "loginViewController.h"

#define loginUrl @"http://xxlccw.cn/SSM/user/getLogin"

@interface loginViewController ()<UITextFieldDelegate>

@property (nonatomic,retain) UITextField *nameText;

@property (nonatomic,retain) UITextField *passCodeText;

@property (nonatomic,retain) UILabel *tipsLabel;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *backRound = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backRound.image = [UIImage imageNamed:@"faceImage2"];
    [self.view addSubview:backRound];
    
    [self setUpTextF];
    
    [self setTips];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [super touchesBegan: touches withEvent:event];
    
    [self.view endEditing:YES];
    
}

-(void)setUpTextF{

    UITextField *name = [[UITextField alloc] init];
    
    name.height = self.view.height * .08;
    name.width = self.view.width * .7;
    
    name.centerX = self.view.centerX;
    name.centerY = self.view.height * .44;
    
    name.textColor = [UIColor whiteColor];
    
    name.textAlignment = NSTextAlignmentCenter;
    
    name.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    
    [self.view addSubview:name];
    
    name.placeholder = @"账号";
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(name.x, CGRectGetMaxY(name.frame), name.width, 1)];
    
    [lineView setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    
    [self.view addSubview:lineView];
    
    
//    UIImageView *leftPic = [[UIImageView alloc] init];
//    
//    leftPic.height = leftPic.width = name.height *.3;
    
    /**
     *  左侧图标
     */
//    leftPic.image = [UIImage imageNamed:@"visualImage1"];
    
//    leftPic.backgroundColor = [UIColor redColor];
//    name.leftViewMode = UITextFieldViewModeAlways;
//    name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    name.leftView = leftPic;
    
    self.nameText = name;
    
    self.nameText.delegate = self;
    
    UITextField *pwd = [[UITextField alloc] init];
    
    pwd.height = self.view.height * .08;
    pwd.width = self.view.width * .7;
    
    pwd.centerX = self.view.centerX;
    pwd.centerY = self.view.height * .53;
    
    pwd.placeholder = @"密码";
    pwd.textColor = [UIColor whiteColor];
    
    pwd.textAlignment = NSTextAlignmentCenter;
    
    pwd.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    
    [self.view addSubview:pwd];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(pwd.x, CGRectGetMaxY(pwd.frame)-1, pwd.width, 1)];
    
    [lineView2 setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    
    [self.view addSubview:lineView2];
    
    
//    UIImageView *leftPic2 = [[UIImageView alloc] init];
//    
//    leftPic2.height = leftPic2.width = pwd.height *.3;
    /**
     *  右侧图标
     */
//    leftPic2.image = [UIImage imageNamed:@"visualImage1"];
    
//    leftPic2.backgroundColor = [UIColor redColor];
//    
//    pwd.leftViewMode = UITextFieldViewModeAlways;
//    
    pwd.secureTextEntry = YES;
//
//    pwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    pwd.leftView = leftPic2;

    self.passCodeText = pwd;
    
    self.passCodeText.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.height = self.view.height * .07;
    button.width = self.view.width * .7;
    
    button.centerX = self.view.centerX;
    button.centerY = self.view.height * .7;
    
    [button setTitle:@"登录" forState: UIControlStateNormal];
    
    button.titleLabel.textColor = [UIColor whiteColor];
    
    button.backgroundColor = JSColor(246, 133, 69);
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(loginIn) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setTips{

    UILabel *label = [[UILabel alloc] init];
    
    label.textColor = [UIColor whiteColor];
    
    label.height = self.view.height *.05;
    
    label.width = self.view.width;
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    
    label.font = JSFont(14);
    
    label.centerY = self.view.height *.62;
    label.centerX = self.view.centerX;
    
    self.tipsLabel = label;
    
    
    
//    self.tipsLabel.text = @"你的密码输入错误!";
}

-(void)loginIn{
    
    [MBProgressHUD showMessage:@"正在登陆"];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"loginName"] = self.nameText.text;
    
    dic[@"password"] = self.passCodeText.text;
    
    [[INetworking shareNet] GET:loginUrl withParmers:dic do:^(id returnObject, BOOL isSuccess) {
        
        if (isSuccess&&returnObject[@"msg"]) {
            self.tipsLabel.text = returnObject[@"msg"];
            self.passCodeText.text = @"";
            [MBProgressHUD hideHUD];
        }else if (isSuccess&&returnObject[@"token"]){
            NSString *personToken = returnObject[@"token"];
            NSString *loginName = returnObject[@"loginName"];
            
            
            
            [[NSUserDefaults standardUserDefaults] setObject:personToken forKey:@"token"];
            [[NSUserDefaults standardUserDefaults] setObject:loginName forKey:@"loginName"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [MBProgressHUD hideHUD];
            
            /**
             *  这里进行跳转
             */
            
            
            [self.tabBarController setSelectedIndex:1];
            
        }else{
            
            [MBProgressHUD hideHUD];
            [self.tipsLabel setText:@"登陆失败"];
            
        }
    }];
    
}


#pragma mark - textFieldDelegate;

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.nameText) {
        [self.passCodeText becomeFirstResponder];
    }else{
        [self.passCodeText resignFirstResponder];       }

    return YES;
}

@end
