//
//  ConsultingCompleteDetailViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ConsultingCompleteDetailViewController.h"
#import "ConsultingDetailHeadTableViewCell.h"
#import "ConsultingDetailDescribeTableViewCell.h"

@interface ConsultingCompleteDetailViewController ()
//描述cell的高度
@property (nonatomic, assign) CGFloat cellHeigth;
//查看咨询
@property (nonatomic, strong) UIButton *btnLookConsulting;
@end

@implementation ConsultingCompleteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    self.tableView.height = self.tableView.height - 65;
   // [self.view addSubview:self.toolView];
//    //显示同意和拒绝按钮
//    [self.toolView changeViewHide:BookDetailToolViewTypeIsUp andTitle:@""];
    [self.view addSubview:self.btnLookConsulting];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UI
- (UIButton *)btnLookConsulting{
    if (!_btnLookConsulting) {
        _btnLookConsulting = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnLookConsulting.frame = CGRectMake(10, DeviceSize.height -self.frameTopHeight -45 -10, DeviceSize.width -20, 45);
        _btnLookConsulting.layer.masksToBounds = YES;
        _btnLookConsulting.layer.cornerRadius = 5;
        _btnLookConsulting.backgroundColor = AppDefaultColor;
        [_btnLookConsulting setTitle:@"查看咨询" forState:UIControlStateNormal];
        _btnLookConsulting.titleLabel.font = [UIFont systemFontOfSize:15];
        [_btnLookConsulting setTitleColor:[UIColor colorWithHEX:0xffffff] forState:UIControlStateNormal];
        [_btnLookConsulting addTarget:self action:@selector(btnLookConsultingAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnLookConsulting;
}

- (void)btnLookConsultingAction{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *identifier = @"idertifier";
        ConsultingDetailHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[ConsultingDetailHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell confingWithModel:nil];
        return cell;
    }else{
        static NSString *identifier = @"idertifier";
        ConsultingDetailDescribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[ConsultingDetailDescribeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.cellHeigth = [cell confingWithModel:nil];
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return self.cellHeigth;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (NSString *)title{
    return @"咨询详情";
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
