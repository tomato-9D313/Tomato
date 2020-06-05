//
//  JiChuCell.m
//  TomatoOC
//
//  Created by 123 on 2020/6/5.
//  Copyright © 2020 master. All rights reserved.
//

#import "JiChuCell.h"

@implementation JiChuCell

-(void)createControls{
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

-(void)setJichuDic:(NSDictionary *)jichuDic{
    
   self.textLabel.text = jichuDic[@"title"];

}

@end
