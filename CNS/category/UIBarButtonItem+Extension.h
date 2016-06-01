//
//  UIBarButtonItem+Extension.h
//  1.5-2015
//
//  Created by Mac on 16/1/7.
//  Copyright © 2016年 竞思. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  生成 barbuttonItem
 *
 *  @param title         <#title description#>
 *  @param imageStr      <#imageStr description#>
 *  @param targat        <#targat description#>
 *  @param action        <#action description#>
 *  @param controlEvents <#controlEvents description#>
 *
 *  @return <#return value description#>
 */
+(instancetype)itemWithTitle:(NSString *)title andImage:(NSString *)imageStr targat:(id)targat action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
