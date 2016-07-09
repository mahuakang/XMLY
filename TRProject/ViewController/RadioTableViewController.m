//
//  RadioTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RadioTableViewController.h"
#import "RadioModel.h"
#import "ListCell.h"
#import "HeadItemCell.h"
#import "NetManager.h"
@interface RadioTableViewController()
@property (nonatomic,strong)RadioModelData *data;
@end

@implementation RadioTableViewController
#pragma mark - TableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        HeadItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadItemCell" forIndexPath:indexPath];
        cell = [cell initWithList:self.data];
        return cell;
    }else{
        ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
        cell = [cell initWithList:self.data currentSection:indexPath.section];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?200:340;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //不知道为什么不能设置成0
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[HeadItemCell class] forCellReuseIdentifier:@"HeadItemCell"];
    [self.tableView registerClass:[ListCell class] forCellReuseIdentifier:@"ListCell"];
    [NetManager getRadioList:^(RadioModel *model, NSError *error) {
        self.data = model.data;
        [self.tableView reloadData];
    }];
}

@end
