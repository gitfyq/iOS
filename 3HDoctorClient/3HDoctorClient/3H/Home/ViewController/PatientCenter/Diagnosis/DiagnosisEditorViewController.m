//
//  DiagnosisEditorViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "DiagnosisEditorViewController.h"
#import "DiagnosisEditorTableViewCell.h"
#import "DiagnosisDetailEditorTableViewCell.h"

@interface DiagnosisEditorViewController ()

@property (nonatomic, assign) CGFloat cellHeight;
@end

@implementation DiagnosisEditorViewController

- (void)loadView{
    [super loadView];
    self.view = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, DeviceSize.width, DeviceSize.height)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItemExtension rightButtonItem:@selector(rightAction) andTarget:self andButtonTitle:@"完成"];
    // [self.view addSubview:self.customView];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@{@"title":@"是否有过敏史:",@"detail":@"未选择"},@{@"title":@"血型:",@"detail":@"未选择"}]];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightAction{
    
}

#pragma mark - UI

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        static NSString *identifier = @"DiagnosisDetailTableViewCell";
        DiagnosisDetailEditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[DiagnosisDetailEditorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.cellHeight = [cell confingWithModel:nil];
        return cell;
    }else{
        static NSString *identifier = @"idertifier";
        DiagnosisEditorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[DiagnosisEditorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell confingWithModel:self.dataArray[indexPath.section]];
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return self.cellHeight;
    }else{
        return 245;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (NSString *)title{
    return @"病史";
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
