//
//  ReviewViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ReviewViewController.h"
#import "PatientCenterNotCustomView.h"
#import "ReviewTableViewCell.h"
//复查添加
#import "ReviewAddViewController.h"
@interface ReviewViewController ()

@property (nonatomic, strong) PatientCenterNotCustomView *customView;
@end

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
   // self.navigationItem.rightBarButtonItem = [UIBarButtonItemExtension rightButtonItem:@selector(addAction) andTarget:self andImageName:@"首页-患者中心_添加"];
    [self.view addSubview:self.customView];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addAction{
    ReviewAddViewController *reviewAddVc = [[ReviewAddViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:reviewAddVc animated:YES];
}

#pragma mark - UI

- (PatientCenterNotCustomView *)customView{
    WeakSelf(ReviewViewController);
    if (!_customView) {
        _customView = [[PatientCenterNotCustomView alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, DeviceSize.height -self.frameTopHeight) LabText:@"您还没有添加任何复查提醒,请添加!" BtnText:@"添加复查"];
        _customView.backgroundColor = self.view.backgroundColor;
        [_customView setBtnBlock:^{
            ReviewAddViewController *reviewAddVc = [[ReviewAddViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
            [weakSelf.navigationController pushViewController:reviewAddVc animated:YES];
        }];
    }
    return _customView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"idertifier";
    ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ReviewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell confingWithModel:@""];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (NSString *)title{
    return @"复查提醒";
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
