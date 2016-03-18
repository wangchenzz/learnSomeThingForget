//
//  test.m
//  CNS
//
//  Created by Mac on 16/3/17.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "testViewController.h"

#import "StroopTests.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    StroopTests *test = [StroopTests test];
    
    [self.view addSubview:test];

}
@end
