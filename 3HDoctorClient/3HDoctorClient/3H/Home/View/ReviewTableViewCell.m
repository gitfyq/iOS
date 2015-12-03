//
//  ReviewTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ReviewTableViewCell.h"

@implementation ReviewTableViewCell


- (void)customView{
    [self.contentView addSubview:self.labTitle];
    [self.contentView addSubview:self.labDetail];
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, DeviceSize.width -20, 15)];
        _labTitle.textColor = [UIColor colorWithHEX:0x333333];
        _labTitle.font = [UIFont systemFontOfSize:15];
    }
    return _labTitle;
}

- (UILabel *)labDetail{
    if (!_labDetail) {
        _labDetail = [[UILabel alloc] initWithFrame:CGRectMake(10, 55 -10 -12, DeviceSize.width -20, 12)];
        _labDetail.textColor = [UIColor colorWithHEX:0x999999];
        _labDetail.font = [UIFont systemFontOfSize:12];

    }
    return _labDetail;
}

//赋值
- (void)confingWithModel:(NSString *)model{
    self.labTitle.text = @"血常规";
    self.labDetail.text = @"请于2015-11-14上午到我院进行门诊随诊";
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
