//
//  BaseNavigationController.h
//  OC_Project
//
//  Created by 范英强 on 15/11/28.
//  Copyright (c) 2015年 fyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController


//往右滑动pop
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated __attribute__((objc_requires_super));

@end
