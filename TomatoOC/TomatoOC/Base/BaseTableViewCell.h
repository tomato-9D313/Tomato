//
//  BaseTableViewCell.h
//  Study
//
//  Created by tomato on 2018/12/12.
//  Copyright © 2018 fan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell


///详细的tableViewCell
+ (instancetype _Nullable )createCellWithStyle:(UITableViewCellStyle)style
                               reuseIdentifier:(NSString *_Nullable)reuseIdentifier
                                 WithTableView:(UITableView *_Nullable)tableView;

//子类reWrite - 设置控件布局
- (void)createControls;
- (void)setupControls;


@end

NS_ASSUME_NONNULL_END
