//
//  ConsultingUnFinishedDetailToolView.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ConsultingUnFinishedDetailToolView.h"

@implementation ConsultingUnFinishedDetailToolView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.btnReply];
        [self addSubview:self.btnTransferred];
        
    }
    return self;
}

- (UIButton *)btnReply{
    if (!_btnReply) {
        _btnReply = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnReply.frame = CGRectMake(10, 10, (DeviceSize.width -30)/2, 45);
        _btnReply.layer.masksToBounds = YES;
        _btnReply.layer.cornerRadius = 5;
        _btnReply.backgroundColor = AppDefaultColor;
        [_btnReply setTitle:@"回复" forState:UIControlStateNormal];
        _btnReply.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnReply setTitleColor:[UIColor colorWithHEX:0xffffff] forState:UIControlStateNormal];
        [_btnReply addTarget:self action:@selector(btnReplyAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnReply;
}

- (void)btnReplyAction{
    if (self.replyBlock) {
        self.replyBlock();
    }
}

- (UIButton *)btnTransferred{
    if (!_btnTransferred) {
        _btnTransferred = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnTransferred.frame = CGRectMake(self.btnReply.right +10, 10, (DeviceSize.width -30)/2, 45);
        _btnTransferred.layer.masksToBounds = YES;
        _btnTransferred.layer.cornerRadius = 5;
        _btnTransferred.backgroundColor = self.backgroundColor;
        [_btnTransferred setTitle:@"转助理" forState:UIControlStateNormal];
        _btnTransferred.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnTransferred setTitleColor:AppDefaultColor forState:UIControlStateNormal];
        _btnTransferred.layer.borderColor = AppDefaultColor.CGColor;
        _btnTransferred.layer.borderWidth = 1;
        [_btnTransferred addTarget:self action:@selector(btnTransferredAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnTransferred;
}

- (void)btnTransferredAction{
    if (self.transferredBlock) {
        self.transferredBlock();
    }
}

- (void)changeTransferredTitle:(NSString *)title{
    
    if ([title isEqualToString:@"转助理"]) {
        self.btnReply.userInteractionEnabled = YES;
    }else{
        self.btnReply.userInteractionEnabled = NO;
    }
    [self.btnTransferred setTitle:title forState:UIControlStateNormal];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
