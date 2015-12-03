//
//  RegisteredDetailViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "RegisteredDetailViewController.h"
#import "BookDetailHeadTableViewCell.h"
#import "BookDetailTimeTableViewCell.h"
#import "BookDetailDescribeTableViewCell.h"
//toolView
#import "BookDetailToolView.h"
//成功成功接受预约
#import "BookSuccessViewController.h"
//预约拒绝理由
#import "BookRefuseReasonViewController.h"

@interface RegisteredDetailViewController ()
//描述cell的高度
@property (nonatomic, assign) CGFloat cellHeigth;

@property (nonatomic, strong) BookDetailToolView *toolView;

@end

@implementation RegisteredDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    self.tableView.height = self.tableView.height - 65;
    [self.view addSubview:self.toolView];
    //显示同意和拒绝按钮
    [self.toolView changeViewHide:BookDetailToolViewTypeIsUp andTitle:@""];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UI

- (BookDetailToolView *)toolView{
    WeakSelf(RegisteredDetailViewController);
    if (!_toolView) {
        _toolView = [[BookDetailToolView alloc] initWithFrame:CGRectMake(0, self.tableView.bottom, DeviceSize.width, 65)];
        _toolView.backgroundColor = self.view.backgroundColor;
        //同意
        [_toolView setAgreedBlock:^{
            
            UIAlertView * uploadView = [[UIAlertView alloc]initWithTitle:@"" message:@"确定要同意患者李可的挂号预约吗?" delegate:weakSelf cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
            [uploadView show];
            
        }];

        //拒绝
        [_toolView setRefusedBlock:^{
            BookRefuseReasonViewController *bookRefuseReasonVc = [[BookRefuseReasonViewController alloc] init];
            [bookRefuseReasonVc setBookRefuseReasonBlock:^{
                [weakSelf.toolView changeViewHide:BookDetailToolViewTypeIsDown andTitle:@"已拒绝"];
            }];
            [weakSelf.navigationController pushViewController:bookRefuseReasonVc animated:YES];
        }];
        
    }
    return _toolView;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        
    }else{
        WeakSelf(RegisteredDetailViewController);
        BookSuccessViewController *bookSuccessVc = [[BookSuccessViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
        [bookSuccessVc setBookSuccessBlock:^{
            [weakSelf.toolView changeViewHide:BookDetailToolViewTypeIsDown andTitle:@"已同意"];
        }];
        [self.navigationController pushViewController:bookSuccessVc animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *identifier = @"idertifier";
        BookDetailHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BookDetailHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell confingWithModel:nil];
        return cell;
    }else if (indexPath.section == 1){
        static NSString *identifier = @"idertifier";
        BookDetailTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BookDetailTimeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell confingWithModel:nil];
        return cell;
    }else{
        static NSString *identifier = @"idertifier";
        BookDetailDescribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[BookDetailDescribeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    }else if(indexPath.section == 1){
        return 44;
    }else{
        return self.cellHeigth;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (NSString *)title{
    return @"预约详情";
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
