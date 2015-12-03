//
//  HomeTableViewCell.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface HomeTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIImageView *imgLogo;

@property (nonatomic, strong) UILabel *labTitle;

@property (nonatomic, strong) UIImageView *imgArrow;
//赋值
- (void)confingWithModel:(NSDictionary *)dic;
@end
