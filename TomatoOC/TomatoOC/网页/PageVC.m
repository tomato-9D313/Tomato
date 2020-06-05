//
//  PageVC.m
//  TomatoOC
//
//  Created by 123 on 2020/6/5.
//  Copyright © 2020 master. All rights reserved.
//

#import "PageVC.h"

@interface PageVC ()<SFSafariViewControllerDelegate>

@property (nonatomic, copy) NSString *httpStr;

@end

@implementation PageVC 

- (id)setUpWithHttpSting:(NSString *)httpStr{
    
    self.httpStr = httpStr;
    return self;
}

- (void)viewDidLoad{
    
   NSString *urlStr = self.httpStr;
   NSURL *url = [NSURL URLWithString:urlStr];
   dispatch_async(dispatch_get_main_queue(), ^{
           
        PageVC *pageVC = [self initWithURL:url];
        pageVC.delegate = self;
    });
}

- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller{
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
