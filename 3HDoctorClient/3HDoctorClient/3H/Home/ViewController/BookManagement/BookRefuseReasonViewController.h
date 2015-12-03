//
//  BookRefuseReasonViewController.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BaseViewController.h"

@interface BookRefuseReasonViewController : BaseViewController

//拒绝提交完拒绝理由后回调
@property (nonatomic,copy) void(^bookRefuseReasonBlock)();
@end
