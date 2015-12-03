//
//  BookDetailTimeTableViewCell.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BookDetailTimeTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *labTitle;
//赋值
- (void)confingWithModel:(NSDictionary *)dic;

@end
