//
//  BookDetailToolView.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BookDetailToolView.h"
@interface BookDetailToolView()

@property (nonatomic, copy) NSString *publicString;

@end
@implementation BookDetailToolView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.downView];
        [self.downView addSubview:self.btnPublic];
        [self addSubview:self.upView];
        [self.upView addSubview:self.btnAgreed];
        [self.upView addSubview:self.btnRefused];
        //默认都隐藏
        self.upView.hidden = YES;
        self.downView.hidden = YES;
        
    }
    return self;
}

- (UIView *)upView{
    if (!_upView) {
        _upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, 65)];
        _upView.backgroundColor = self.backgroundColor;
    }
    return _upView;
}

- (UIButton *)btnAgreed{
    if (!_btnAgreed) {
        _btnAgreed = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnAgreed.frame = CGRectMake(10, 10, (DeviceSize.width -30)/2, 45);
        _btnAgreed.layer.masksToBounds = YES;
        _btnAgreed.layer.cornerRadius = 5;
        _btnAgreed.backgroundColor = AppDefaultColor;
        [_btnAgreed setTitle:@"同意" forState:UIControlStateNormal];
        _btnAgreed.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnAgreed setTitleColor:[UIColor colorWithHEX:0xffffff] forState:UIControlStateNormal];
        [_btnAgreed addTarget:self action:@selector(btnAgreedAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnAgreed;
}

- (void)btnAgreedAction{
    if (self.agreedBlock) {
        self.agreedBlock();
    }
}

- (UIButton *)btnRefused{
    if (!_btnRefused) {
        _btnRefused = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnRefused.frame = CGRectMake(self.btnAgreed.right +10, 10, (DeviceSize.width -30)/2, 45);
        _btnRefused.layer.masksToBounds = YES;
        _btnRefused.layer.cornerRadius = 5;
        _btnRefused.backgroundColor = self.backgroundColor;
        [_btnRefused setTitle:@"拒绝" forState:UIControlStateNormal];
        _btnRefused.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnRefused setTitleColor:AppDefaultColor forState:UIControlStateNormal];
        _btnRefused.layer.borderColor = AppDefaultColor.CGColor;
        _btnRefused.layer.borderWidth = 1;
        [_btnRefused addTarget:self action:@selector(btnRefusedAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnRefused;
}

- (void)btnRefusedAction{
    if (self.refusedBlock) {
        self.refusedBlock();
    }
}

- (UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, 65)];
        _downView.backgroundColor = self.backgroundColor;
    }
    return _downView;
}

- (UIButton *)btnPublic{
    if (!_btnPublic) {
        _btnPublic = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnPublic.frame = CGRectMake(10, 10, DeviceSize.width -20, 45);
        _btnPublic.layer.masksToBounds = YES;
        _btnPublic.layer.cornerRadius = 5;
        _btnPublic.backgroundColor = AppDefaultColor;
        [_btnPublic setTitle:@"" forState:UIControlStateNormal];
        _btnPublic.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnPublic setTitleColor:[UIColor colorWithHEX:0xffffff] forState:UIControlStateNormal];
        [_btnPublic addTarget:self action:@selector(btnPublicAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnPublic;
}

- (void)btnPublicAction{
    if (self.callPhoneBlock) {
        self.callPhoneBlock();
    }
}

- (void)changeViewHide:(BookDetailToolViewType)toolViewType andTitle:(NSString *)title{
    if (toolViewType == BookDetailToolViewTypeIsUp) {
        self.upView.hidden = NO;
        self.downView.hidden = YES;
    }else{
        self.upView.hidden = YES;
        self.downView.hidden = NO;
    }
    [self.btnPublic setTitle:title forState:UIControlStateNormal];
    if ([title isEqualToString:@"打电话"]) {
        self.btnPublic.userInteractionEnabled = YES;
    }else{
        self.btnPublic.userInteractionEnabled = NO;
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
