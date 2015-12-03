//
//  ConsultingDynamicViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ConsultingDynamicViewController.h"
#import "ConsultingDynamicHeadView.h"
#import "ConsultingDynamicTableViewCell.h"
//医疗资讯
#import "DynamicDetailViewController.h"
@interface ConsultingDynamicViewController ()

@property (nonatomic, strong) ConsultingDynamicHeadView *headView;
@end

@implementation ConsultingDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    self.tableView.tableHeaderView = self.headView;
    [self.headView confingWithModel:nil];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (ConsultingDynamicHeadView *)headView{
    if (!_headView) {
        _headView = [[ConsultingDynamicHeadView alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, 150)];
    }
    return _headView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"idertifier";
    ConsultingDynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ConsultingDynamicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell confingWithModel:nil];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DynamicDetailViewController *dynamicDetailVc = [[DynamicDetailViewController alloc] init];
    [self.navigationController pushViewController:dynamicDetailVc animated:YES];
}
- (NSString *)title{
    return @"资讯动态";
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
