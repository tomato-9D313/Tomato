//
//  KVCStudyVC.m
//  TomatoOC
//
//  Created by 123 on 2020/6/9.
//  Copyright © 2020 master. All rights reserved.
//

#import "KVCStudyVC.h"

#import "XiaoMing.h"

@interface KVCStudyVC ()

@end

@implementation KVCStudyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XiaoMing *xiaoming = [[XiaoMing alloc] init];
    [xiaoming setValue:@10 forKey:@"age"];
    NSLog(@"age==%@",[xiaoming valueForKey:@"age"]);
}
 
@end
