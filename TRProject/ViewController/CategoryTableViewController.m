//
//  CategoryTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "CategoryCell.h"
#import "CategoryModel.h"
#import "NetManager.h"
@interface CategoryTableViewController()
@property (nonatomic,strong)UIButton *headView;
@property (nonatomic)NSMutableArray <CategoryModelList *>*list;
@end
@implementation CategoryTableViewController
#pragma mark - tableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
    //return (self.list.count-1)%6==0?(self.list.count-1)/6:(self.list.count-1)/6+1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    NSMutableArray *list =[NSMutableArray new];
    //    if (self.list.count-indexPath.row*6>6) {
    //        for (long i=indexPath.row*6; i<indexPath.row*6+6; i++) {
    //            [list addObject:self.list[i]];
    //        }
    //    }else{
    //        for (int i =0; i<self.list.count-indexPath.row*6; i++) {
    //            [list addObject:self.list[i]];
    //        }
    //    }
    //    NSLog(@"%@",list);
    if (self.list.firstObject) {
        [list addObject:self.list[0]];
        [list addObject:self.list[1]];
        [list addObject:self.list[2]];
        [list addObject:self.list[3]];
        [list addObject:self.list[4]];
        [list addObject:self.list[5]];
    }
    cell = [cell initWithList:list];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[CategoryCell class] forCellReuseIdentifier:@"CategoryCell"];
    [NetManager getCategoryList:^(CategoryModel * model, NSError *error) {
        [self.list addObjectsFromArray:model.list];
        [self.tableView reloadData];
    }];
}
#pragma mark - 懒加载
- (UIButton *)headView {
    if(_headView == nil) {
        _headView = [UIButton buttonWithType:UIButtonTypeCustom];
        
    }
    return _headView;
}

- (NSMutableArray <CategoryModelList *> *)list {
    if(_list == nil) {
        _list = [[NSMutableArray <CategoryModelList *> alloc] init];
    }
    return _list;
}

@end
