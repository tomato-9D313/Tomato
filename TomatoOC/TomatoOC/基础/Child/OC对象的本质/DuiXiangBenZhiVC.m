//
//  DuiXiangBenZhiVC.m
//  TomatoOC
//
//  Created by 123 on 2020/6/5.
//  Copyright © 2020 master. All rights reserved.
//

#import "DuiXiangBenZhiVC.h"

#import <objc/runtime.h>

@interface DuiXiangBenZhiVC ()

@end

@implementation DuiXiangBenZhiVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //获取类对象的方法
    NSObject *obj = [[NSObject alloc] init];
    
    Class objectClass1 = [obj class];
    Class objectClass2 = object_getClass(obj);
    Class metaClass = object_getClass([NSObject class]);
    
    //判断是类对象还是元类对象
    class_isMetaClass(objectClass2);
    class_isMetaClass(metaClass);
    
}


@end
