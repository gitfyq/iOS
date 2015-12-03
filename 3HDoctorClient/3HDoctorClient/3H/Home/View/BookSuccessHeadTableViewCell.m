//
//  BookSuccessHeadTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BookSuccessHeadTableViewCell.h"

@implementation BookSuccessHeadTableViewCell

- (void)customView{
    [self.contentView addSubview:self.imgLogo];
    [self.contentView addSubview:self.labTitle];
}

- (UIImageView *)imgLogo{
    if (!_imgLogo) {
        _imgLogo = [[UIImageView alloc] initWithFrame:CGRectMake((DeviceSize.width -50)/2, 25, 50, 50)];
        _imgLogo.image = [UIImage imageNamed:@"首页-预约管理-电话预约-预约详情-同意-成功接受_图标"];
        
    }
    return _imgLogo;
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imgLogo.bottom +15, DeviceSize.width, 17)];
        _labTitle.font = [UIFont systemFontOfSize:17];
        _labTitle.textColor = [UIColor colorWithHEX:0x86d77a];
        _labTitle.textAlignment = NSTextAlignmentCenter;
        _labTitle.text = @"成功接受预约";
    }
    return _labTitle;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
