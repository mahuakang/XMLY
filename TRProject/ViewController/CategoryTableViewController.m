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
#import "CategoryDetialPageController.h"
@interface CategoryTableViewController()
@property (nonatomic,strong)UIButton *headView;
@property (nonatomic,strong)UIImageView *headImage;
@property (nonatomic)NSMutableArray <CategoryModelList *>*list;
@end
@implementation CategoryTableViewController
#pragma mark - tableView 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    long num = self.list.count;
    return num%6==0?num/6:num/6+1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    [self.headImage setImageURL:self.list.firstObject.coverPath.yx_URL];
    NSMutableArray *list =[NSMutableArray new];
    if (self.list.firstObject) {
        long num = indexPath.section*6;
        if (self.list.count-num>6) {
            for (long i=num; i<num+6; i++) {
                [list addObject:self.list[i+1]];
            }
        }else{
            for (long i =num; i<num+(self.list.count-num)-1; i++) {
                [list addObject:self.list[i+1]];
            }
        }
    }
    cell = [cell initWithList:list];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    long num = indexPath.section*6;
    if (self.list.count-num>6) {
        return 150;
    }else{
        return 100;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self headView];
    [self.tableView registerClass:[CategoryCell class] forCellReuseIdentifier:@"CategoryCell"];
    [NetManager getCategoryList:^(CategoryModel * model, NSError *error) {
        if (error) {
            NSLog(@"网络请求出错，请重新刷新");
        }else{
            [self.list addObjectsFromArray:model.list];
            self.tableView.tableHeaderView =_headView;
            [self.tableView reloadData];
        }
    }];
    
}
#pragma mark - 懒加载
- (UIButton *)headView {
    if(_headView == nil) {
        _headView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(kScreenW);
            make.height.equalTo(kScreenW/2);
            make.top.left.equalTo(0);
        }];
        [_headView bk_addEventHandler:^(id sender) {
            CategoryDetialPageController *wmpage = [[CategoryDetialPageController alloc]initWithId:self.list[0].Id statMoudle:self.list[0].title pageType:@"发现_分类"];
            [self.navigationController pushViewController:wmpage animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        
        _headImage = [UIImageView new];
        [_headView addSubview:_headImage];
        [_headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _headImage.contentMode = UIViewContentModeScaleToFill;
        
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
