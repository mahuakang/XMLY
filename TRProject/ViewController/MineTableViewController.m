//
//  MineTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MineTableViewController.h"

@implementation MineTableViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_me_n"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_me_h"];
    }
    return self;
}
@end
