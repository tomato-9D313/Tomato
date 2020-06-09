//
//  KVOStudyVC.m
//  TomatoOC
//
//  Created by 123 on 2020/6/6.
//  Copyright © 2020 master. All rights reserved.
//

#import "KVOStudyVC.h"
#import "XiaoMing.h"

#import <objc/runtime.h>

@interface KVOStudyVC ()

@property(nonatomic , strong) XiaoMing *xiaoming1;
@property(nonatomic , strong) XiaoMing *xiaoming2;

@end

@implementation KVOStudyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self jibenshiyong];
    [self benzhitangjiu];
    
}

#pragma mark - 🍎基本使用
-(void)jibenshiyong{
    
    self.xiaoming1 = [[XiaoMing alloc] init];
    self.xiaoming1.age = 16;
//    self.xiaoming1.height = 180;
    
    //给XiaoMing对象添加KVO监听
    
    [self.xiaoming1 addObserver:self //本控制器来监听
                    forKeyPath:@"age"//监听xiaoming1 age 的变化
                       options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld//通常选这2个，下面会解释
                       context:@""];//下面会演示
    
//    [self.xiaoming1 addObserver:self //本控制器来监听
//                     forKeyPath:@"height"//监听xiaoming1 age 的变化
//                        options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld//通常选这2个，下面会解释
//                        context:@"height备注"];//下面会演示
}

#pragma mark - 🍎本质

-(void)benzhitangjiu{
    
    self.xiaoming1 = [[XiaoMing alloc] init];
    self.xiaoming1.age = 1;
    
    self.xiaoming2 = [[XiaoMing alloc] init];
    self.xiaoming2.age = 2;
    
//    NSLog(@"🍎监听之前--xiaoming1的类对象：%@-xiaoming2的类对象：%@",object_getClass(self.xiaoming1),
//                                                      object_getClass(self.xiaoming2));
    
//    NSLog(@"🍎监听之前--方法实现：%p-%p",[self.xiaoming1 methodForSelector:@selector(setAge:)],
//          [self.xiaoming2 methodForSelector:@selector(setAge:)]);
    
//    NSLog(@"🍎监听之前--方法实现：%p-%p",[self.xiaoming1 methodForSelector:@selector(setAge:)],
//              [self.xiaoming2 methodForSelector:@selector(setAge:)]);
    
    [self.xiaoming1 addObserver:self //本控制器来监听
                       forKeyPath:@"age"//监听xiaoming1 age 的变化
                          options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld//通常选这2个，下面会解释
                          context:@""];//下面会演示
    
//    NSLog(@"🍎监听之后--xiaoming1的类对象：%@-xiaoming2的类对象：%@",object_getClass(self.xiaoming1),
//    object_getClass(self.xiaoming2));
    
//    NSLog(@"🍎监听之后--方法实现：%p-%p",[self.xiaoming1 methodForSelector:@selector(setAge:)],
//    [self.xiaoming2 methodForSelector:@selector(setAge:)]);
    
    
//     NSLog(@"🍎xiaoming1:类对象-%@,元类对象-%@",object_getClass(self.xiaoming1),object_getClass(object_getClass(self.xiaoming1)));
//     NSLog(@"🍎xiaoming2:类对象-%@,元类对象-%@",object_getClass(self.xiaoming2),object_getClass(object_getClass(self.xiaoming2)));
    
//    [self dayiidaoyongdefangfa:object_getClass(self.xiaoming1)];
//    [self dayiidaoyongdefangfa:object_getClass(self.xiaoming2)];
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.xiaoming1.age = 18;//点击屏幕改变xiaoming1年龄
    self.xiaoming1.height = 185;
    
//   self.xiaoming1.isa ：  NSKVONotifying_XiaoMing
//   self.xiaoming2.isa ：  XiaoMing
    
//     [self.xiaoming1 setAge:8];
//     [self.xiaoming2 setAge:9];
//
    
//    [self.xiaoming1 willChangeValueForKey:@"age"];
//    [self.xiaoming1 didChangeValueForKey:@"age"];
    
}

//当监听对象的属性值发生改变时，就会调用
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    NSLog(@"监听到=%@的属性值=%@发生改变了-%@-%@",object,keyPath,change,context);
}

//移除监听
-(void)dealloc{
    
    [self.xiaoming1 removeObserver:self forKeyPath:@"age"];
//    [self.xiaoming1 removeObserver:self forKeyPath:@"height"];
}


//打印类调用的方法
-(void)dayiidaoyongdefangfa:(Class)cls{
  
    unsigned int count;
    
    //获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    //存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    //遍历所有的方法
    for (int i=0; i<count; i++) {
        
        //获得方法
        Method method =  methodList[i];
        //获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        //拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@",  "];
    }
    
    //释放
    free(methodList);
    
    //打印方法名
    NSLog(@"%@ , %@",cls , methodNames);
    
}

@end
