//
//  ReviewAddProjectTableViewCell.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ReviewAddProjectTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *labTitle;

@property (nonatomic, strong) UILabel *labLine1;
//门诊随诊
@property (nonatomic, strong) UILabel *labUp;
@property (nonatomic, strong) UIButton *btnUp;
@property (nonatomic, strong) UILabel *labLine2;

//手动输入复查项目
@property (nonatomic, strong) UILabel *labDown;
@property (nonatomic, strong) UIButton *btnDown;
@property (nonatomic, strong) UILabel *labLine3;

@property (nonatomic, strong) UIView *viewBack;
@property (nonatomic, strong) UITextField *txtField;

//1 代表门诊随诊 2代表手动输入复查项目 info 附加信息
@property (nonatomic,copy) void(^btnBlock)(NSInteger index ,NSString *info);

@end
