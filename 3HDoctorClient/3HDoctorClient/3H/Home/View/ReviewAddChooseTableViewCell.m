//
//  ReviewAddChooseTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ReviewAddChooseTableViewCell.h"

@implementation ReviewAddChooseTableViewCell

- (void)customView{
    [self.contentView addSubview:self.labTitle];
    [self.contentView addSubview:self.btnUp];
    [self.contentView addSubview:self.labUp];
    [self.contentView addSubview:self.btnDown];
    [self.contentView addSubview:self.labDown];
    
    if (self.btnBlock) {
        self.btnBlock(1);
    }

}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 70, 45)];
        _labTitle.textColor = [UIColor colorWithHEX:0x333333];
        _labTitle.font = [UIFont systemFontOfSize:15];
        _labTitle.text = @"复查时段:";
        [_labTitle sizeToFit];
        _labTitle.top = (45 -_labTitle.height)/2;
        
    }
    return _labTitle;
}

- (UIButton *)btnUp{
    if (!_btnUp) {
        _btnUp = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnUp.frame =CGRectMake(self.labTitle.right +10, (45 -30)/2, 30, 30);
        [_btnUp setImage:[UIImage imageNamed:@"首页-患者中心-患者详情-复查提醒-添加复查_未选中"] forState:UIControlStateNormal];
        [_btnUp setImage:[UIImage imageNamed:@"首页-患者中心-患者详情-复查提醒-添加复查_选中"] forState:UIControlStateSelected];
        _btnUp.selected = YES;
        [_btnUp addTarget:self action:@selector(btnUpAction) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _btnUp;
}

- (void)btnUpAction{
    self.btnUp.selected = YES;
    self.btnDown.selected = NO;
    if (self.btnBlock) {
        self.btnBlock(1);
    }
}


- (UILabel *)labUp{
    if (!_labUp) {
        _labUp = [[UILabel alloc] initWithFrame:CGRectMake(self.btnUp.right +10, self.btnUp.right +10, 70, 45)];
        _labUp.textColor = [UIColor colorWithHEX:0x333333];
        _labUp.font = [UIFont systemFontOfSize:15];
        _labUp.text = @"上午";
        [_labUp sizeToFit];
        _labUp.top = (45 -_labUp.height)/2;
        
    }
    return _labUp;
}

- (UIButton *)btnDown{
    if (!_btnDown) {
        _btnDown = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnDown.frame =CGRectMake(self.labUp.right +30, (45 -30)/2, 30, 30);
        [_btnDown setImage:[UIImage imageNamed:@"首页-患者中心-患者详情-复查提醒-添加复查_未选中"] forState:UIControlStateNormal];
        [_btnDown setImage:[UIImage imageNamed:@"首页-患者中心-患者详情-复查提醒-添加复查_选中"] forState:UIControlStateSelected];
        _btnDown.selected = NO;
        [_btnDown addTarget:self action:@selector(btnDownAction) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _btnDown;
}

- (void)btnDownAction{
    self.btnUp.selected = NO;
    self.btnDown.selected = YES;
    if (self.btnBlock) {
        self.btnBlock(2);
    }
}

- (UILabel *)labDown{
    if (!_labDown) {
        _labDown = [[UILabel alloc] initWithFrame:CGRectMake(self.btnDown.right +10, 0, 70, 45)];
        _labDown.textColor = [UIColor colorWithHEX:0x333333];
        _labDown.font = [UIFont systemFontOfSize:15];
        _labDown.text = @"下午";
        [_labDown sizeToFit];
        _labDown.top = (45 -_labDown.height)/2;
        
    }
    return _labDown;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
