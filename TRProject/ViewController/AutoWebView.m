//
//  AutoWebView.m
//  TRProject
//
//  Created by kfc on 16/7/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AutoWebView.h"

@implementation AutoWebView
#pragma mark -  初始化
- (instancetype)initWithUrl:(NSString *)url{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tabBarController hidesBottomBarWhenPushed];
    UIWebView *webv = [[UIWebView alloc]init];
    [self.view addSubview:webv];
    [webv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [webv loadRequest:[NSURLRequest requestWithURL:self.url.yx_URL]];
}
@end
