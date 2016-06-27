//
//  JSRefreshTableViewController.h
//  CNS
//
//  Created by Mac on 16/6/1.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSRefreshTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) NSMutableArray *dataSourceArray;

@property (nonatomic,strong) NSMutableDictionary *dataSourceDic;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,assign) NSInteger curpage;

@property (nonatomic,assign) BOOL isRefreshHeader;

@property (nonatomic,assign) BOOL isRefreshFooter;

@property (nonatomic,assign) BOOL isShowNoDataImage;

/**
 *  下拉刷新方法
 */
-(void)tableViewRefreshHeader;

/**
 *  上拉刷新方法
 */
-(void)tableViewRefreshFooter;

/**
 *  显示数据方法
 *
 *  @param isHeader 是否是下拉刷新
 *  @param load     是否马上刷新
 */
-(void)tableViewDidFinshRefresh:(BOOL)isHeader reload:(BOOL)load;

/**
 *  显示无数据时候的方法
 */
-(void)showNoDataImage;

/**
 *  隐藏无数据图片
 */
-(void)hideNoDataImage;

@end
