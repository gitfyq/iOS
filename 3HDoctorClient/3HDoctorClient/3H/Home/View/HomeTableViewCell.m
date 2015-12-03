//
//  HomeTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)customView{
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.imgLogo];
    [self.contentView addSubview:self.labTitle];
    [self.backView addSubview:self.imgArrow];
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, DeviceSize.width -20, 55 +12)];
        _backView.backgroundColor = [UIColor colorWithHEX:0xffffff];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 5;
        _backView.layer.borderColor = [UIColor colorWithHEX:0xcccccc].CGColor;
        _backView.layer.borderWidth = 0.5;
    }
    return _backView;
}

- (UIImageView *)imgLogo{
    if (!_imgLogo) {
        _imgLogo = [[UIImageView alloc] initWithFrame:CGRectMake(20, 6, 55, 55)];
        
    }
    return _imgLogo;
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.imgLogo.right +10, 6, 80, self.imgLogo.height)];
        _labTitle.textColor = [UIColor colorWithHEX:0x555555];
        _labTitle.font = [UIFont systemFontOfSize:17];
    }
    return _labTitle;
}

- (UIImageView *)imgArrow{
    if (!_imgArrow) {
        _imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(self.backView.width - 19/2 - 10, (self.backView.height - 34/2)/2, 19/2, 34/2)];
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
