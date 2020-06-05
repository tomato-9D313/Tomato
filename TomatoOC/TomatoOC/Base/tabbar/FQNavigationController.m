//
//  FQNavigationController.m
//  Study
//
//  Created by duan on 2017/11/30.
//  Copyright © 2017年 fan. All rights reserved.
//

#import "FQNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface FQNavigationController ()

@end

@implementation FQNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    [self baseSetting];
}

#pragma mark - 基本配置

-(void)baseSetting{
    
    //如果滑动移除的功能失效，清空代理，实现不能进行手势右划返回的问题
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //如果不想影响其他页面的导航透明度，viewWillDisappear将其设置为nil即可:
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:navigationBarColor]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
//    去掉下面的线
    [self.navigationBar setShadowImage:[UIImage new]];
    
    //改变透明
    self.navigationBar.translucent = NO;
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//  NSLog(@"%lu %@",(unsigned long)self.viewControllers.count,viewController);
    
    if (self.viewControllers.count >0) {
      
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem CreateItemWithTarget:self ForAction:@selector(back) WithImage:@"nav_back_n" WithHighlightImage:@"nav_back_h"];
       
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
   
    [self popViewControllerAnimated:YES];
}
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:animated];
    
    if (self.viewControllers.count == 2) {
        
    }
    return self;
}
@end
