//
//  BaseTableViewCell.m
//  Study
//
//  Created by tomato on 2018/12/12.
//  Copyright © 2018 fan. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


+ (instancetype)createCellWithStyle:(UITableViewCellStyle)style
                    reuseIdentifier:(NSString *)reuseIdentifier
                      WithTableView:(UITableView *_Nullable)tableView
{
    
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        
        cell = [[self alloc]initWithStyle:style
                          reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //1.创建控件
        [self createControls];
        
        //2.设置样式
        [self setupControls];
    }
    return self;
}

- (void)createControls{
    
}

- (void)setupControls{
    
}


@end
