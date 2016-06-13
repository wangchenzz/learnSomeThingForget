//
//  JSTabBarController.m
//  1.5-2015
//
//  Created by Mac on 16/1/4.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import "JSTabBarController.h"

#import "MainPageViewController.h"

#import "testPViewController.h"

#import "BBSControllerView.h"

#import "profileViewController.h"

#import "pageViewsController.h"

#import "BBSControllerView.h"

/**
 *  测试的控制器
 *
 *  @param void ..
 *
 *  @return 0..
 */

@interface JSTabBarController ()

@end

@implementation JSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tabbar 主题；
    
    //设置tabbar item 的颜色；
    self.tabBar.barTintColor = [UIColor colorWithWhite:1 alpha:1];
    
    
    //设置普通状态下的tabbaritem字体；
    //tintcolor 即是字体选中颜色；未设置情况下。
    self.tabBar.tintColor = [UIColor orangeColor];
    
    //
    //    loginViewController *view = [[loginViewController alloc] init];
    //
    //
    //    [self addJSChildViewController:view withNormalImage:nil selectImage:nil title:@"登陆界面"];
    
    MainPageViewController*v = [[MainPageViewController alloc] init];
    
    [self addJSChildViewController:v withNormalImage:@"shouye1" selectImage:@"shouye2" title:@"首页"];
    
    testPViewController *t = [[testPViewController alloc] init];
    
    [self addJSChildViewController:t withNormalImage:@"cep1" selectImage:@"cep2" title:@"测评"];
    
//    pageViewsController *pgc = [[pageViewsController alloc] init];
    BBSControllerView *pgc = [[BBSControllerView alloc] initWithType:1];
    //
    [self addJSChildViewController:pgc withNormalImage:@"luntan1" selectImage:@"luntan2" title:@"论坛"];
    
    profileViewController *pvc = [[profileViewController alloc] init];
    
    [self addJSChildViewController:pvc withNormalImage:@"wode1" selectImage:@"wode2" title:@"我"];
    
}

/**
 *  添加试图控制器
 *
 *  @param childController 创建好的试图控制器
 */

-(void)addJSChildViewController:(UIViewController *)childController withNormalImage:(NSString *)nname selectImage:(NSString *)sname title:(NSString *)title{
    
    childController.title = title;
    
    NSMutableDictionary *normalAttri = [NSMutableDictionary dictionary];
    
    normalAttri[NSFontAttributeName] = JSFont(12);
    
    normalAttri[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //设置选中状态下的tabbaritem的字体；
    NSMutableDictionary *selectAttri = [NSMutableDictionary dictionary];
    
    selectAttri[NSFontAttributeName] = JSFont(12);
    
    selectAttri[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    
    //此处预留的设置选中和普通状态的图片
    
    childController.tabBarItem.image = [UIImage imageNamed:nname];
    
//    childController.tabBarItem.selectedImage = [UIImage imageWithRenderNamed:sname];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:sname];
    //设置tabbar 的item的字体。
    
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttri forState:UIControlStateNormal];
    
    
    /**
     *  导航栏主题
     */
    
    //设置导航栏title 字体颜色；
    NSMutableDictionary *navigationTitle = [NSMutableDictionary dictionary];
    
    navigationTitle[NSFontAttributeName] = JSFont(23);
    
    navigationTitle[NSForegroundColorAttributeName] = [UIColor whiteColor];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:childController];
    
    [navi.navigationBar setTitleTextAttributes:navigationTitle];
    
    /**
     *  导航栏返回键颜色
     */
    
    [navi.navigationBar setTintColor:[UIColor whiteColor]];
    
    //设置导航栏 主体颜色；
    //    [navi.navigationBar setBarTintColor:JSCOLOR];
    
    /**
     *  这里修改了导航栏的背景颜色
     */
    
    UIImage *image = [UIImage imageNamed:@"dise"];
    //
    //    UIColor *diseColor = [image imageToColor];
    //
    //    UIImage *ima = [UIImage imageWithBgColor:diseColor];
    UIImage *scaleImage = [image scaleSize:CGSizeMake(navi.navigationBar.frame.size.width, navi.navigationBar.frame.size.height + JSStatusRect.size.height)];
    
    [navi.navigationBar setBackgroundImage:scaleImage forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [navi.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    //修改状态栏主题
    [navi.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    [self addChildViewController:navi];
}


@end
