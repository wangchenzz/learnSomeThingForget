//
//  DiamandsView.m
//  CNS
//
//  Created by Mac on 16/3/9.
//  Copyright © 2016年 竞思教育. All rights reserved.
//

#import "DiamandsView.h"

@implementation DiamandsView


+(instancetype)getView{

    DiamandsView *vi = [[NSBundle mainBundle]loadNibNamed:@"diamondsXib" owner:nil options:nil].firstObject;
    
    vi.symbolView.layer.borderColor = [[UIColor blackColor]CGColor];
    
    vi.symbolView.layer.borderWidth = 1.0;
    vi.digitView.layer.borderColor = [[UIColor blackColor]CGColor];
    
    vi.digitView.layer.borderWidth = 1.0;
    
    UIView *v = [[UIView alloc] initWithFrame:vi.bounds];
    
    [vi addSubview:v];
    
    return vi;
}




@end
