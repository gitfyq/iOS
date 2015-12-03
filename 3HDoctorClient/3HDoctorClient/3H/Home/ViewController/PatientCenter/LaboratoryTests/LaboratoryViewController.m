//
//  LaboratoryViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "LaboratoryViewController.h"
#import "PatientCenterNotCustomView.h"
#import "LaboratoryTestsTableViewCell.h"
#import "LaboratoryTestsAddViewController.h"
@interface LaboratoryViewController ()
@property (nonatomic, strong) PatientCenterNotCustomView *customView;
@end

@implementation LaboratoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.height = self.tableView.height - 44;
    // Do any additional setup after loading the view.
    [self.view addSubview:self.customView];
}
#pragma mark - UI

- (PatientCenterNotCustomView *)customView{
    WeakSelf(LaboratoryViewController);
    if (!_customView) {
        _customView = [[PatientCenterNotCustomView alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, DeviceSize.height -self.frameTopHeight) LabText:@"您还没有添加任何化验,请添加!" BtnText:@"添加化验"];
        _customView.backgroundColor = self.view.backgroundColor;
        [_customView setBtnBlock:^{
            LaboratoryTestsAddViewController *laboratoryTestsAddVc= [[LaboratoryTestsAddViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
            laboratoryTestsAddVc.index = 1;
            [weakSelf.navigationController pushViewController:laboratoryTestsAddVc animated:YES];
        }];
    }
    return _customView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"idertifier";
    LaboratoryTestsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[LaboratoryTestsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell confingWithModel:nil];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
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
