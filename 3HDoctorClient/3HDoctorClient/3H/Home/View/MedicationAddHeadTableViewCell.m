//
//  MedicationAddHeadTableViewCell.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "MedicationAddHeadTableViewCell.h"

@implementation MedicationAddHeadTableViewCell


- (void)customView{
    
}

- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, DeviceSize.width -20, 45)];
        _labTitle.font = [UIFont systemFontOfSize:15];
        _labTitle.textColor = [UIColor colorWithHEX:0x999999];
    }
    return _labTitle;
}

//赋值
- (void)confingWithModel:(NSDictionary *)model{
    if ([model[@"title"] isEqualToString:@"请输入药物名称"]) {
        self.labTitle.text = @"请输入药物名称";
        
    }else{
        self.labTitle.text = model[@"title"];
        self.labTitle.textColor = [UIColor colorWithHEX:0x333333];
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
