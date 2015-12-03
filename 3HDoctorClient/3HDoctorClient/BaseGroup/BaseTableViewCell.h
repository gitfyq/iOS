//
//  BaseTableViewCell.h
//  OC_Project
//
//  Created by 范英强 on 15/11/28.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell


/**
 *  父类。。。子类继承后直接调用函数入口
 */
- (void)customView;

@end
