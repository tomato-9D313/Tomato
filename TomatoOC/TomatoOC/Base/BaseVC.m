//
//  FQBaseVC.m
//  Study
//
//  Created by duan on 2017/11/30.
//  Copyright © 2017年 fan. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self baseSetting];
    
    
}

#pragma mark - baseSetting

- (void)baseSetting{

    self.view.backgroundColor = [UIColor whiteColor];
    /*
     当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
     当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算
     */
   self.navigationController.navigationBar.translucent = NO;
    
}

@end
