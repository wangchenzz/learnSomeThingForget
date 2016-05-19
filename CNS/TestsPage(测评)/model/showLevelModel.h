//
//  showLevelModel.h
//  CNS
//
//  Created by Mac on 16/5/18.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface showLevelModel : NSObject


@property (nonatomic,assign) NSInteger TestType;


@property (nonatomic,copy) NSString *testTitle;

@property (nonatomic,copy) NSString *diffLevel;

@property (nonatomic,copy) NSString *testId;

@property (nonatomic,copy) NSString *testTime;

@property (nonatomic,retain) NSArray *nameArray;

@property (nonatomic,retain) NSArray *valueArray;

@end
