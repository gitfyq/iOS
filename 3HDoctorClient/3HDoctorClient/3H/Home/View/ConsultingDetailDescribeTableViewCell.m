//
//  ConsultingDetailDescribeTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ConsultingDetailDescribeTableViewCell.h"

@implementation ConsultingDetailDescribeTableViewCell

- (void)customView{
    [self.contentView addSubview:self.labTitle];
    
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, DeviceSize.width -20, 0)];
        _labTitle.textColor = [UIColor colorWithHEX:0x999999];
        _labTitle.font = [UIFont systemFontOfSize:13];
        _labTitle.numberOfLines = 0;
    }
    return _labTitle;
}

//赋值
- (CGFloat)confingWithModel:(NSDictionary *)dic{
    self.labTitle.text = @"预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50预约时间:2015-10-11 12:50";
    [self.labTitle sizeToFit];
    self.labTitle.top = 10;
    return self.labTitle.bottom +10;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
