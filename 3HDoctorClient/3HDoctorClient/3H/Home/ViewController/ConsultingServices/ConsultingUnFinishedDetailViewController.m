//
//  ConsultingUnFinishedDetailViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/1.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ConsultingUnFinishedDetailViewController.h"
#import "ConsultingDetailHeadTableViewCell.h"
#import "ConsultingDetailDescribeTableViewCell.h"
//toolView
#import "ConsultingUnFinishedDetailToolView.h"
//转到助理
#import "TransferredAssistantViewController.h"
@interface ConsultingUnFinishedDetailViewController ()
//描述cell的高度
@property (nonatomic, assign) CGFloat cellHeigth;
//toolView
@property (nonatomic, strong) ConsultingUnFinishedDetailToolView *toolView;
@end

@implementation ConsultingUnFinishedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    self.tableView.height = self.tableView.height - 65;

    [self.view addSubview:self.toolView];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UI
- (ConsultingUnFinishedDetailToolView *)toolView{
    WeakSelf(ConsultingUnFinishedDetailViewController);
    if (!_toolView) {
        _toolView = [[ConsultingUnFinishedDetailToolView alloc] initWithFrame:CGRectMake(0, self.tableView.bottom, DeviceSize.width, 65)];
        //回复
        [_toolView setReplyBlock:^{
            
        }];
        
        //转助理
        [_toolView setTransferredBlock:^{
            TransferredAssistantViewController *transferredAssistantVc = [[TransferredAssistantViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
            [weakSelf.navigationController pushViewController:transferredAssistantVc animated:YES];
        }];
    }
    return _toolView;
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
