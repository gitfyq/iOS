//
//  LaboratoryTestsAddViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/12/2.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "LaboratoryTestsAddViewController.h"
#import "LaboratoryTestsAddTableViewCell.h"
#import "LaboratoryTestsAddPhotoTableViewCell.h"
@interface LaboratoryTestsAddViewController ()

@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation LaboratoryTestsAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [UIBarButtonItemExtension rightButtonItem:@selector(finishAction) andTarget:self andButtonTitle:@"完成"];
    self.dataArray = [NSMutableArray arrayWithArray:@[@{@"title":@"名称:",@"detail":@"未选择"},
                                                      @{@"title":@"医院:",@"detail":@"未选择"},
                                                      @{@"title":@"时间:",@"detail":@"未选择"}]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)finishAction{
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==3 ) {
        static NSString *identifier = @"idertifier";
        LaboratoryTestsAddPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[LaboratoryTestsAddPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.cellHeight = [cell confingWithModel:nil];
        return cell;
    }else{
        static NSString *identifier = @"idertifier";
        LaboratoryTestsAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[LaboratoryTestsAddTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    return self.dataArray.count +1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 3) {
        return self.cellHeight;
    }else{
        return 45;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

- (NSString *)title{
    if (self.index == 1) {
        return @"化验";
    }else{
        return @"检查";
    }
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
