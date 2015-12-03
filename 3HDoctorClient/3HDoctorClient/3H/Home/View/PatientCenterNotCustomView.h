//
//  PatientCenterNotCustomView.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCenterNotCustomView : UIView
//提示文字
@property (nonatomic, strong) UILabel *labTitle;
//按钮
@property (nonatomic, strong) UIButton *btn;
//回调
@property (nonatomic,copy) void(^btnBlock)();

- (instancetype)initWithFrame:(CGRect)frame LabText:(NSString *)labText BtnText:(NSString *)btnText;

@end
