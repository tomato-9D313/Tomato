//
//  UIBarButtonItem+Extension.m
//  weibo
//
//  Created by ZpyZp on 15/3/16.
//  Copyright (c) 2015年 Zpy. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)CreateItemWithTarget:(id)target ForAction:(SEL)action WithImage:(NSString *)Image WithHighlightImage :(NSString *)highlightImage
{
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setBackgroundImage:[UIImage imageNamed:Image] forState:UIControlStateNormal];
    [Btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted] ;
    [Btn addTarget:target action:action  forControlEvents:UIControlEventTouchUpInside];
    //设置尺寸
    Btn.size = Btn.currentBackgroundImage.size;
    
    //注：一个控件出不来两个原因：1.没设置尺寸，2.没设置图片
    return [[UIBarButtonItem alloc] initWithCustomView:Btn];
}

@end
