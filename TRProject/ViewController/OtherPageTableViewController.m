//
//  OtherPageTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "OtherPageTableViewController.h"
#import "NetManager.h"
#import "WMOtherPageModel.h"
#import "ListenListListCell.h"
@interface OtherPageTableViewController()

@end

@implementation OtherPageTableViewController

#pragma mark -  初始化
- (instancetype)initWithId:(NSInteger)Id tagName:(NSString *)tagName{
    self = [super init];
    if (self) {
        _Id = Id;
        _tagName = tagName;
        
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    
}
@end
