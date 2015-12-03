//
//  BookRefuseReasonViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "BookRefuseReasonViewController.h"

@interface BookRefuseReasonViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIView *viewBack;
@property (nonatomic, strong) UITextView *txtView;
@property (nonatomic, strong) UIButton *btnSubmit;
@end

@implementation BookRefuseReasonViewController

- (void)loadView{
    [super loadView];
    self.view = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, DeviceSize.width, DeviceSize.height)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    [self.view addSubview:self.viewBack];
    [self.viewBack addSubview:self.txtView];
    [self.view addSubview:self.btnSubmit];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UI

- (UIView *)viewBack{
    if (!_viewBack) {
        _viewBack = [[UIView alloc] initWithFrame:CGRectMake(10, 10, DeviceSize.width -20, DeviceSize.width-20)];
        _viewBack.backgroundColor = [UIColor colorWithHEX:0xffffff];
        _viewBack.layer.borderColor = [UIColor colorWithHEX:0xcccccc].CGColor;
        _viewBack.layer.borderWidth = 0.5;
        _viewBack.layer.masksToBounds = YES;
        _viewBack.layer.cornerRadius = 3;
    }
    return _viewBack;
}

- (UITextView *)txtView{
    if (!_txtView) {
        _txtView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, self.viewBack.width - 20, self.viewBack.height -20)];
//        _txtView.backgroundColor = [UIColor grayColor];
        _txtView.delegate = self;
        _txtView.font = [UIFont systemFontOfSize:13];
        _txtView.textColor = [UIColor colorWithHEX:0x333333];
    }
    return _txtView;
}

- (UIButton *)btnSubmit{
    if (!_btnSubmit) {
        _btnSubmit = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnSubmit.frame = CGRectMake(10, DeviceSize.height -self.frameTopHeight -45 -10, DeviceSize.width -20, 45);
        _btnSubmit.layer.masksToBounds = YES;
        _btnSubmit.layer.cornerRadius = 5;
        _btnSubmit.backgroundColor = AppDefaultColor;
        [_btnSubmit setTitle:@"提交" forState:UIControlStateNormal];
        _btnSubmit.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnSubmit setTitleColor:[UIColor colorWithHEX:0xffffff] forState:UIControlStateNormal];
        [_btnSubmit addTarget:self action:@selector(btnSubmitAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnSubmit;
}

- (void)btnSubmitAction{
    if (self.bookRefuseReasonBlock) {
        self.bookRefuseReasonBlock();
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (NSString *)title{
    return @"拒绝理由";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
