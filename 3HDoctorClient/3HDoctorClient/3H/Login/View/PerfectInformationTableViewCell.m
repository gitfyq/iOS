//
//  PerfectInformationTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "PerfectInformationTableViewCell.h"

@implementation PerfectInformationTableViewCell

- (void)customView{
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.labTitle];
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(12, 10, DeviceSize.width - 24, 45)];
        _backView.backgroundColor = [UIColor colorWithHEX:0xffffff];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 5;
        _backView.layer.borderWidth = 0.5;
        _backView.layer.borderColor = [UIColor colorWithHEX:0xcccccc].CGColor;
    }
    return _backView;
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(24, 10, DeviceSize.width/2, 45)];
        _labTitle.textColor = [UIColor colorWithHEX:0x888888];
        _labTitle.font = [UIFont systemFontOfSize:15];
    }
    return _labTitle;
}

- (void)confingWithModel:(NSString *)string{
    self.labTitle.text = string;
    self.labTitle.textColor = [UIColor colorWithHEX:0x666666];
    NSArray *arr = @[@"您的姓名",@"所在城市",@"您的职称",@"医院名称",@"科室名称",@"门诊时间"];
    for (NSString *newString in arr) {
        if ([string isEqualToString:newString]) {
            self.labTitle.textColor = [UIColor colorWithHEX:0x888888];
            return;
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
