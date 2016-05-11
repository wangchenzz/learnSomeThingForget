
//
//  JSNewsModel.m
//  CNS
//
//  Created by Mac on 16/5/11.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "JSNewsModel.h"

@implementation JSNewsModel


-(void)setValue:(id)value forKey:(NSString *)key{

    if ([key isEqualToString:@"id"]) {
        [super setValue:value forKey:@"num"];
    }else{
        [super setValue:value forKey:key];
    }
}


-(void)setValue:(id)value forKeyPath:(NSString *)keyPath{

    if ([keyPath isEqualToString:@"id"]) {
        [super setValue:value forKeyPath:@"num"];
    }else{
        [super setValue:value forKeyPath:keyPath];
    }

}

@end
