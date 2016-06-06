//
//  showLevelController.h
//  CNS
//
//  Created by Mac on 16/5/18.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showLevelController : UITableViewController


@property (nonatomic,retain) NSMutableArray *modelArray;

/**
 *  要上传, 等同于是刚测试完毕.  这里写在一起其实是个错误;
 */
@property (nonatomic,assign) BOOL isUpload;

@end
