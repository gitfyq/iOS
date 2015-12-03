//
//  PatientDetailTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "PatientDetailTableViewCell.h"

@implementation PatientDetailTableViewCell

- (void)customView{
    [self.contentView addSubview:self.imgLogo];
    [self.contentView addSubview:self.labTitle];
    [self.contentView addSubview:self.imgArrow];
}

- (UIImageView *)imgLogo{
    if (!_imgLogo) {
        _imgLogo = [[UIImageView alloc] initWithFrame:CGRectMake(10, (45 -16)/2, 16, 16)];
        
    }
    return _imgLogo;
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.imgLogo.right +8, 0, DeviceSize.width/2, 45)];
        _labTitle.textColor = [UIColor colorWithHEX:0x333333];
        _labTitle.font = [UIFont systemFontOfSize:15];
    }
    return _labTitle;
}

- (UIImageView *)imgArrow{
    if (!_imgArrow) {
        _imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(DeviceSize.width - 19/2 - 10, (45 - 34/2)/2, 19/2, 34/2)];
        _imgArrow.image = [UIImage imageNamed:@"3H-首页_键"];
        
    }
    return _imgArrow;
}

//赋值
- (void)confingWithModel:(NSDictionary *)dic{
    self.labTitle.text = dic[@"title"];
    self.imgLogo.image = [UIImage imageNamed:dic[@"img"]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
