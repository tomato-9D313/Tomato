//
//  BaseTableViewVC.m
//  Study
//
//  Created by tomato on 2018/12/11.
//  Copyright © 2018 fan. All rights reserved.
//

#import "BaseTableViewVC.h"

@interface BaseTableViewVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableViewVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self dataArr];//初始化数组
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"父类cellForRow");
    return [UITableViewCell new];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - 加载TableView

- (void)createTableViewStyleGrouped{
    
    [self createTableViewWithStyle:UITableViewStyleGrouped];
}

- (void)createTableViewStylePlain{
    
    [self createTableViewWithStyle:UITableViewStylePlain];
}

- (void)createTableViewWithStyle:(UITableViewStyle)style{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-kTopHeight) style:style];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;//不显示cell的分割线
    [self.view addSubview:self.tableView];
    
    [self addMJRefshControls];
    
}

#pragma mark - 刷新
- (void)addMJRefshControls{
    
    
    
}

//下拉加载更多
- (void)loadMoreDatas{
    
    
    
}

//上拉刷新
- (void)refreshData{
    
   
}

#pragma mark - 懒加载数组
-(NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
