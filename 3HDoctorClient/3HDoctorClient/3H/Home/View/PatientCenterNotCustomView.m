//
//  PatientCenterNotCustomView.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "PatientCenterNotCustomView.h"
@interface PatientCenterNotCustomView()

@property (nonatomic, copy) NSString *labText;
@property (nonatomic, copy) NSString *btnText;

@end
@implementation PatientCenterNotCustomView

- (instancetype)initWithFrame:(CGRect)frame LabText:(NSString *)labText BtnText:(NSString *)btnText
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labText = labText;
        self.btnText = btnText;
        [self addSubview:self.labTitle];
        [self addSubview:self.btn];
    }
    return self;
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle =[[UILabel alloc] initWithFrame:CGRectMake(0, 50, DeviceSize.width, 15)];
        _labTitle.textColor = [UIColor colorWithHEX:0X999999];
        _labTitle.font = [UIFont systemFontOfSize:15];
        _labTitle.textAlignment = NSTextAlignmentCenter;
        _labTitle.text = self.labText;
    }
    return _labTitle;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(12, self.labTitle.bottom +25, DeviceSize.width - 24, 45);
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_btn setTitle:self.btnText forState:UIControlStateNormal];
        _btn.layer.masksToBounds = YES;
        _btn.layer.cornerRadius = 5;
        _btn.backgroundColor = [UIColor colorWithHEX:0x008aff];
        
        [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)btnAction{
    if (self.btnBlock) {
        self.btnBlock();
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
