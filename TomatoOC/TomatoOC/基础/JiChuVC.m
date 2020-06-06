//
//  JiChuVC.m
//  TomatoOC
//
//  Created by 123 on 2020/6/5.
//  Copyright © 2020 master. All rights reserved.
//

#import "JiChuVC.h"
#import "JiChuCell.h"
#import "PageVC.h"

@interface JiChuVC ()

@end

@implementation JiChuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableViewStylePlain];//加载TableView
    [self getData];
}

-(void)getData{
    
    [self getDic];
    
}

-(void)getDic{
    
    NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"jichu.json"]];
    NSDictionary *dic = [NSObject fq_dictionaryWithJSON:data];
    NSArray *dataArr = dic[@"dataList"];
    [self.dataArr addObjectsFromArray:dataArr];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JiChuCell *jcCell = [JiChuCell createCellWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"jcCell" WithTableView:tableView];
    jcCell.jichuDic = self.dataArr[indexPath.row];
    return jcCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSDictionary *dic = self.dataArr[indexPath.row];
    NSString *secondVCStr = dic[@"secondVC"];
    NSString *pageUrl  = dic[@"pageUrl"];
    NSString *title = dic[@"title"];
    if ([secondVCStr isEqualToString:@""]) {
        
        PageVC *pageVC = [[PageVC alloc] setUpWithHttpSting:pageUrl];
        pageVC.title = title;
        [self.navigationController pushViewController:pageVC animated:YES];
        
    }else{
        
        UIViewController *secondVC  =[[NSClassFromString(secondVCStr) alloc] init];
        secondVC.title = title;
        [self.navigationController pushViewController:secondVC animated:YES];
    }
    
}

@end
