//
//  BookDetailToolView.h
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BookDetailToolViewType) {
    
    BookDetailToolViewTypeIsUp      = 1,     //显示up
    BookDetailToolViewTypeIsDown    = 2,     //显示down

    
    
};
@interface BookDetailToolView : UIView
//上层的view
@property (nonatomic, strong) UIView *upView;
//同意
@property (nonatomic, strong) UIButton *btnAgreed;
//拒绝
@property (nonatomic, strong) UIButton *btnRefused;
//下层的view
@property (nonatomic, strong) UIView *downView;
//公共按钮
@property (nonatomic, strong) UIButton *btnPublic;
//同意回调
@property (nonatomic,copy) void(^agreedBlock)();
//拒绝回调
@property (nonatomic,copy) void(^refusedBlock)();
//打电话
@property (nonatomic,copy) void(^callPhoneBlock)();
//改变函数
- (void)changeViewHide:(BookDetailToolViewType)toolViewType andTitle:(NSString *)title;

@end
