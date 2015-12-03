//
//  ConsultingUnFinishedDetailToolView.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultingUnFinishedDetailToolView : UIView

//回复
@property (nonatomic, strong) UIButton *btnReply;
//专至到哪里
@property (nonatomic, strong) UIButton *btnTransferred;
//回复回调
@property (nonatomic,copy) void(^replyBlock)();
//专至到哪里回调
@property (nonatomic,copy) void(^transferredBlock)();

//改变函数
- (void)changeTransferredTitle:(NSString *)title;

@end
