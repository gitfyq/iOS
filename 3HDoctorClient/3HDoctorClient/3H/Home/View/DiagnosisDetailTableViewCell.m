//
//  DiagnosisDetailTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "DiagnosisDetailTableViewCell.h"

@implementation DiagnosisDetailTableViewCell

- (void)customView{
    [self.contentView addSubview:self.labTitle];
    [self.contentView addSubview:self.labLine];
    [self.contentView addSubview:self.labDetail];
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, DeviceSize.width/2, 35)];
        _labTitle.textColor = [UIColor colorWithHEX:0x333333];
        _labTitle.font = [UIFont systemFontOfSize:15];
        _labTitle.text = @"病情描述:";
    }
    return _labTitle;
}

- (UILabel *)labLine{
    if (!_labLine) {
        _labLine = [[UILabel alloc] initWithFrame:CGRectMake(10, self.labTitle.bottom, DeviceSize.width -20, 0.5)];
        _labLine.backgroundColor = [UIColor colorWithHEX:0xcccccc];
    }
    return _labLine;
}

- (UILabel *)labDetail{
    if (!_labDetail) {
        _labDetail = [[UILabel alloc] initWithFrame:CGRectMake(10, self.labLine.bottom +10, DeviceSize.width -20, 0)];
        _labDetail.textColor = [UIColor colorWithHEX:0x999999];
        _labDetail.font = [UIFont systemFontOfSize:13];
        _labDetail.numberOfLines = 0;
    }
    return _labDetail;
}



//赋值
- (CGFloat)confingWithModel:(NSDictionary *)model{
    self.labDetail.text = @"赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值值赋值赋值赋值赋值赋值赋值值赋值赋值赋值赋值赋值赋值值赋值赋值赋值赋值赋值赋值值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值赋值";
    [self.labDetail sizeToFit];
    self.labDetail.top = self.labLine.bottom +10;
    return self.labDetail.bottom +10;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
