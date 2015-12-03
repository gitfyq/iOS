//
//  PerfectInformationTableViewCell.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface PerfectInformationTableViewCell : BaseTableViewCell
//背景
@property (nonatomic, strong) UIView *backView;
//标题
@property (nonatomic, strong) UILabel *labTitle;
//箭头
@property (nonatomic, strong) UIImageView *imgArrow;

//赋值
- (void)confingWithModel:(NSString *)string;
@end
