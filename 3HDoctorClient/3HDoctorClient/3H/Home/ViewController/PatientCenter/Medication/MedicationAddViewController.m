//
//  MedicationAddViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "MedicationAddViewController.h"
#import "MedicationAddHeadTableViewCell.h"
#import "MedicationAddTableViewCell.h"
@interface MedicationAddViewController ()

@property (nonatomic, strong) UIButton *btn;
@end

@implementation MedicationAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray arrayWithArray:@[@{@"title":@"药物名称",@"detail":@"未选择"},
  @{@"title":@"剂量",@"detail":@"未选择"},
  @{@"title":@"次数",@"detail":@"未选择"},
  @{@"title":@"用药时间",@"detail":@"未选择"},
  @{@"title":@"用药途径",@"detail":@"未选择"},
  @{@"title":@"开始时间",@"detail":@"未选择"},
  @{@"title":@"结束时间",@"detail":@"未选择"}]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];

    self.tableView.height = self.tableView.height -65;
    [self.view addSubview:self.btn];
    
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -ui

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(12, self.tableView.bottom +10, DeviceSize.width - 24, 45);
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_btn setTitle:@"提交" forState:UIControlStateNormal];
        _btn.layer.masksToBounds = YES;
        _btn.layer.cornerRadius = 5;
        _btn.backgroundColor = [UIColor colorWithHEX:0x008aff];
        
        [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)btnAction{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"idertifier";
    MedicationAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MedicationAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell confingWithModel:self.dataArray[indexPath.section]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (NSString *)title{
    return @"添加用药";
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
