//
//  PerfectInformationViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "PerfectInformationViewController.h"
#import "PerfectInformationTableViewCell.h"
//输入名字
#import "NameInputViewController.h"
//医院名称
#import "HospitalInputViewController.h"
#import "AppDelegate.h"
//所在城市
#import "CityListFirstLevelViewController.h"

@interface PerfectInformationViewController ()
//友情提示
@property (nonatomic, strong) UILabel *labPrompt;
//提交
@property (nonatomic, strong) UIButton *btnSubmit;
@end

@implementation PerfectInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    self.dataArray = [NSMutableArray arrayWithArray:@[@"您的姓名",@"所在城市",@"您的职称",@"医院名称",@"科室名称",@"门诊时间"]];
    self.tableView.top = self.labPrompt.bottom;
    self.tableView.height = DeviceSize.height - self.frameTopHeight - self.labPrompt.height - 45 -20 - 15;
    self.tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:self.labPrompt];
    
    [self.view addSubview:self.btnSubmit];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -UI

- (UILabel *)labPrompt{
    if (!_labPrompt) {
        _labPrompt = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, 40)];
        _labPrompt.backgroundColor = [UIColor orangeColor];
        _labPrompt.font = [UIFont systemFontOfSize:15];
        _labPrompt.textAlignment = NSTextAlignmentCenter;
        _labPrompt.textColor = [UIColor colorWithHEX:0xffffff];
        _labPrompt.text = @"请填写您的真实信息,以便我们提供更好的服务!";
    }
    return _labPrompt;
}

- (UIButton *)btnSubmit{
    if (!_btnSubmit) {
        _btnSubmit = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnSubmit.frame = CGRectMake(12, self.tableView.bottom +20, DeviceSize.width - 24, 45);
        [_btnSubmit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnSubmit.titleLabel.font = [UIFont systemFontOfSize:17];
        [_btnSubmit setTitle:@"提交" forState:UIControlStateNormal];
        _btnSubmit.layer.masksToBounds = YES;
        _btnSubmit.layer.cornerRadius = 5;
        _btnSubmit.backgroundColor = [UIColor colorWithHEX:0x008aff];
        
        [_btnSubmit addTarget:self action:@selector(btnSubmitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnSubmit;
}

- (void)btnSubmitAction{
    [(AppDelegate*)[UIApplication sharedApplication].delegate setWindowRootViewControllerIsTabBar];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"idertifier";
    PerfectInformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[PerfectInformationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell confingWithModel:self.dataArray[indexPath.row]];
    return cell;

}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count ;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45 +10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf(PerfectInformationViewController);
    if (indexPath.row == 0) {//您的姓名
        
        NameInputViewController *nameInputVc = [[NameInputViewController alloc] init];
        
        [nameInputVc setNameBlock:^(NSString *str) {
            [weakSelf.dataArray replaceObjectAtIndex:indexPath.row withObject:str];
            [weakSelf.tableView reloadData];
        }];
        
        [self.navigationController  pushViewController:nameInputVc animated:YES];
        
    }else if (indexPath.row == 1){//所在城市
        
        CityListFirstLevelViewController *cityListFirstLevelVc= [[CityListFirstLevelViewController alloc] init];
        [cityListFirstLevelVc setCityListBlock:^(NSString *name, NSString *ids, NSString *parent_id) {
            [weakSelf.dataArray replaceObjectAtIndex:indexPath.row withObject:name];
            [weakSelf.tableView reloadData];
        }];
        
        [self.navigationController pushViewController:cityListFirstLevelVc animated:YES];
        
    }else if (indexPath.row == 2){//您的职称
        
    }else if (indexPath.row == 3){//医院名称
        
        HospitalInputViewController *hospitalInputVc = [[HospitalInputViewController alloc] init];
        
        [hospitalInputVc setHospitalBlock:^(NSString *str) {
            [weakSelf.dataArray replaceObjectAtIndex:indexPath.row withObject:str];
            [weakSelf.tableView reloadData];
        }];
        
        [self.navigationController pushViewController:hospitalInputVc animated:YES];
        
    }else if (indexPath.row == 4){//科室名称
        
    }else if (indexPath.row == 5){//门诊时间
        
    }
    
}



- (NSString *)title{
    return @"完善资料";
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
