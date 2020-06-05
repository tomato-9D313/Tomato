//
//  PageVC.h
//  TomatoOC
//
//  Created by 123 on 2020/6/5.
//  Copyright © 2020 master. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageVC : SFSafariViewController

- (id)setUpWithHttpSting:(NSString *)httpStr;

@end

NS_ASSUME_NONNULL_END
