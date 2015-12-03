//
//  AssistantDoctorTableViewCell.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface AssistantDoctorTableViewCell : BaseTableViewCell

//助理头像
@property (nonatomic, strong) UIImageView *imgAssistant;
//助理名字
@property (nonatomic, strong) UILabel *labAssistant;
//赋值
- (void )confingWithModel:(NSDictionary *)dic;
@end
