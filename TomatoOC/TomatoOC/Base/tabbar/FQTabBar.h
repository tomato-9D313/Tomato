//
//  FQTabBar.h
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FQTabBar;

@protocol FQTabBarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickPlusButton:(FQTabBar *)tabBar;
@end

@interface FQTabBar : UITabBar
@property (nonatomic,weak) id<FQTabBarDelegate> delegate;
@end
