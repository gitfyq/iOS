//
//  AssistantDoctorTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "AssistantDoctorTableViewCell.h"

@implementation AssistantDoctorTableViewCell


- (void)customView{
    [self.contentView addSubview:self.imgAssistant];
    [self.contentView addSubview:self.labAssistant];
}

- (UIImageView *)imgAssistant{
    if (!_imgAssistant) {
        _imgAssistant = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _imgAssistant.layer.masksToBounds = YES;
        _imgAssistant.layer.cornerRadius = 25;
        _imgAssistant.backgroundColor = [UIColor grayColor];
    }
    return _imgAssistant;
}

- (UILabel *)labAssistant{
    if (!_labAssistant) {
        _labAssistant = [[UILabel alloc] initWithFrame:CGRectMake(self.imgAssistant.right +10, 0, 100, 70)];
        _labAssistant.textColor = [UIColor colorWithHEX:0x333333];
        _labAssistant.font = [UIFont systemFontOfSize:15];
        
    }
    return _labAssistant;
}

//赋值
- (void )confingWithModel:(NSDictionary *)dic{
    self.labAssistant.text = @"欧阳吹雪";
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
