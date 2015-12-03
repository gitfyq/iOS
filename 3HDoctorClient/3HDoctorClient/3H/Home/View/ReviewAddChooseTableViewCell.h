//
//  ReviewAddChooseTableViewCell.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ReviewAddChooseTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *labTitle;
//上午
@property (nonatomic, strong) UILabel *labUp;
@property (nonatomic, strong) UIButton *btnUp;

//下午
@property (nonatomic, strong) UILabel *labDown;
@property (nonatomic, strong) UIButton *btnDown;
//1 代表上午 2代表下午
@property (nonatomic,copy) void(^btnBlock)(NSInteger index);


@end
