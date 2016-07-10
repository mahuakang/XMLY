//
//  SubscibeController.m
//  TRProject
//
//  Created by kfc on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SubscibeController.h"

@implementation SubscibeController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_sound_n"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_sound_h"];
    }
    return self;
}
@end
