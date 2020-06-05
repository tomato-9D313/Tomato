//
//  BaseTableViewVC.h
//  Study
//
//  Created by tomato on 2018/12/11.
//  Copyright © 2018 fan. All rights reserved.
//

#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewVC : BaseVC

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;//数据源



///UITableViewStyleGrouped 类型的tableView
- (void)createTableViewStyleGrouped;

///TableViewStylePlain 类型的tableView
- (void)createTableViewStylePlain;

//下拉加载更多
- (void)loadMoreDatas;

//上拉刷新
- (void)refreshData;


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
