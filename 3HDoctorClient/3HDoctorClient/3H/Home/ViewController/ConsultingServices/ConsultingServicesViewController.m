//
//  ConsultingServicesViewController.m
//  3HDoctorClient
//
//  Created by 范英强 on 15/11/30.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import "ConsultingServicesViewController.h"
#import "ConsultingServicesTopView.h"
//已回复
#import "ConsultingCompleteViewController.h"
//未回复
#import "ConsultingUnFinishedViewController.h"

@interface ConsultingServicesViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) ConsultingServicesTopView *topView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) ConsultingUnFinishedViewController *consultingUnFinishedVc;

@property (nonatomic, strong) ConsultingCompleteViewController *consultingCompleteVc;

@end

@implementation ConsultingServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItemExtension leftBackButtonItem:@selector(backAction) andTarget:self];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.scrollView];
    [self customAddChildVc];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UI

- (ConsultingServicesTopView *)topView{
    WeakSelf(ConsultingServicesViewController);
    if (!_topView) {
        _topView = [[ConsultingServicesTopView alloc] initWithFrame:CGRectMake(0, 0, DeviceSize.width, 44)];
        _topView.backgroundColor = [UIColor colorWithHEX:0xffffff];
        __weak ConsultingServicesTopView *weakTopView = _topView;
        
        [weakTopView setBtnClickBlock:^(NSInteger index) {
            [weakTopView topButtonMenuSelectForIndex:index];
            
            [weakSelf.scrollView setContentOffset:CGPointMake(DeviceSize.width *index, 0) animated:YES];
        }];
        //  默认选中第一个
        [weakTopView topButtonMenuSelectForIndex:0];
    }
    return _topView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.topView.bottom, DeviceSize.width, DeviceSize.height - self.frameTopHeight - self.topView.height)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(DeviceSize.width * 2, DeviceSize.height - self.frameTopHeight -self.topView.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

- (ConsultingUnFinishedViewController *)consultingUnFinishedVc{
    if (!_consultingUnFinishedVc) {
        _consultingUnFinishedVc = [[ConsultingUnFinishedViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    }
    return _consultingUnFinishedVc;
}

- (ConsultingCompleteViewController *)consultingCompleteVc{
    if (!_consultingCompleteVc) {
        _consultingCompleteVc = [[ConsultingCompleteViewController alloc] initWithTableViewStyle:UITableViewStyleGrouped];
    }
    return _consultingCompleteVc;
}

- (void)customAddChildVc{
    [self addChildViewController:self.consultingUnFinishedVc];
    [self addChildViewController:self.consultingCompleteVc];
    
    
    [self.consultingUnFinishedVc willMoveToParentViewController:self];
    self.consultingUnFinishedVc.view.height = self.scrollView.contentSize.height;
    self.consultingUnFinishedVc.view.left = DeviceSize.width *0;
    self.consultingUnFinishedVc.view.height = DeviceSize.height -self.frameTopHeight -self.topView.height;
    [self.scrollView addSubview:self.consultingUnFinishedVc.view];
    [self.consultingUnFinishedVc didMoveToParentViewController:self];
    
    [self.consultingCompleteVc willMoveToParentViewController:self];
    self.consultingCompleteVc.view.height = self.scrollView.contentSize.height;
    self.consultingCompleteVc.view.left = DeviceSize.width *1;
    self.consultingCompleteVc.view.height = DeviceSize.height -self.frameTopHeight -self.topView.height;
    [self.scrollView addSubview:self.consultingCompleteVc.view];
    [self.consultingCompleteVc didMoveToParentViewController:self];
    
}


#pragma mark scollview手滑动停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger pageIndex = scrollView.contentOffset.x / DeviceSize.width;
    [self.topView topButtonMenuSelectForIndex:pageIndex];
    
}
#pragma mark scrollview改变contentOffset停止
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;{
    
    NSInteger pageIndex = scrollView.contentOffset.x / DeviceSize.width;
    [self.topView topButtonMenuSelectForIndex:pageIndex];
}

- (NSString *)title{
    return @"咨询服务";
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
