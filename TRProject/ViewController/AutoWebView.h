//
//  AutoWebView.h
//  TRProject
//
//  Created by kfc on 16/7/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoWebView : UIViewController
@property (nonatomic,copy)NSString *url;
- (instancetype)initWithUrl:(NSString*)url;
@end
