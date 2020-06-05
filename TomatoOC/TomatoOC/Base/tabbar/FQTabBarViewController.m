//
//  FQTabBarViewController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "FQTabBarViewController.h"
#import "FQTabBar.h"
#import "FQNavigationController.h"

#import "JiChuVC.h"
#import "DemoVC.h"
#import "GongJuVC.h"
#import "GeRenVC.h"


@interface FQTabBarViewController ()<FQTabBarDelegate>

@end

@implementation FQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabbar];
    [self initTabBarController];//加载子控制器
    
   
}
-(void)initTabbar{

    FQTabBar *tabBar = [[FQTabBar alloc] init];
    tabBar.delegate = self;
    [[FQTabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [self setValue:tabBar forKey:@"tabBar"];
    

}
-(void)initTabBarController{
    
    JiChuVC *jcVC = [[JiChuVC alloc] init];
    [self createChildVCWithVC:jcVC Title:@"OC基础" Image:@"tabbar_home_n" SelectedImage:@"tabbar_home_h"];

    DemoVC *demoVC = [[DemoVC alloc] init];
    [self createChildVCWithVC:demoVC Title:@"Demo" Image:@"tabbar_mycity_n" SelectedImage:@"tabbar_mycity_h"];

    GongJuVC *gjVC = [[GongJuVC alloc] init];
    [self createChildVCWithVC:gjVC Title:@"工具" Image:@"tabbar_message_n" SelectedImage:@"tabbar_message_h"];

    GeRenVC *grVC = [[GeRenVC alloc] init];
    [self createChildVCWithVC:grVC Title:@"个人" Image:@"tabbar_account_n" SelectedImage:@"tabbar_account_h"];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUInteger count = self.tabBar.subviews.count;
    for (int i = 0; i<count; i++) {
        UIView *child = self.tabBar.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = self.tabBar.width / count;
        }
    }
}

-(void)createChildVCWithVC:(UIViewController *)childVC
                     Title:(NSString *)title
                     Image:(NSString *)image
             SelectedImage:(NSString *)selectedimage
{
    //设置子控制器的文字
    // childVC.tabBarItem.title =title;
    // childVC.navigationItem.title =title;
    //等价于
    childVC.title = title;//同时设置tabbar和navigation的标题
    //设置文字的样式
    NSMutableDictionary *textAttrs = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *selectedtextAttrs = [[NSMutableDictionary alloc]init];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectedtextAttrs[NSForegroundColorAttributeName] = navigationBarColor;
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    //设置子控制器的图片
    childVC.tabBarItem.image =[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //这句话的意思是声明这张图片按照原始的样子显示出来，不要自动渲染成其他颜色
    
    //给子控制器包装导航控制器
    FQNavigationController *nav = [[FQNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}
#pragma mark - tabbar代理方法
-(void)tabBarDidClickPlusButton:(FQTabBar *)tabBar
{
    
    
}

@end
