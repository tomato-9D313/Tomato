//
//  KVOStudyVC.m
//  TomatoOC
//
//  Created by 123 on 2020/6/6.
//  Copyright © 2020 master. All rights reserved.
//

#import "KVOStudyVC.h"
#import "XiaoMing.h"

@interface KVOStudyVC ()

@property(nonatomic , strong) XiaoMing *xiaoming1;


@end

@implementation KVOStudyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self jibenshiyong];
   
    
}

#pragma mark - 🍎基本使用
-(void)jibenshiyong{
    
    self.xiaoming1 = [[XiaoMing alloc] init];
    self.xiaoming1.age = 16;
    self.xiaoming1.height = 180;
    
    //给XiaoMing对象添加KVO监听
    
    [self.xiaoming1 addObserver:self //本控制器来监听
                    forKeyPath:@"age"//监听xiaoming1 age 的变化
                       options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld//通常选这2个，下面会解释
                       context:@""];//下面会演示
    
    [self.xiaoming1 addObserver:self //本控制器来监听
                     forKeyPath:@"height"//监听xiaoming1 age 的变化
                        options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld//通常选这2个，下面会解释
                        context:@"height备注"];//下面会演示
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.xiaoming1.age = 18;//点击屏幕改变xiaoming1年龄
    self.xiaoming1.height = 185;
}

//当监听对象的属性值发生改变时，就会调用
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    NSLog(@"监听到=%@的属性值=%@发生改变了-%@-%@",object,keyPath,change,context);
//    监听到=<XiaoMing: 0x6000034fe070>的属性值=age发生改变了-{
//        kind = 1;
//        new = 18;
//        old = 16;
//    }-
//    监听到=<XiaoMing: 0x6000034fe070>的属性值=height发生改变了-{
//        kind = 1;
//        new = 185;
//        old = 180;
//    }-height备注
    
}

//移除监听
-(void)dealloc{
    
    [self.xiaoming1 removeObserver:self forKeyPath:@"age"];
    [self.xiaoming1 removeObserver:self forKeyPath:@"height"];
}

#pragma mark - 🍎本质



@end
