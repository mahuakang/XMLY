//
//  SpecialListCell.m
//  TRProject
//
//  Created by kfc on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SpecialListCell.h"
#import "ListenListTableViewController.h"
/*===============================specialCell begin======================*/

@implementation specialCell
#pragma mark - 懒加载
- (UILabel *)bottomLab {
    if(_bottomLab == nil) {
        _bottomLab = [[UILabel alloc] init];
        [self.contentView addSubview:_bottomLab];
        _bottomLab.textColor = [UIColor grayColor];
        [_bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topLab);
            make.bottom.equalTo(self.imagev);
        }];
    }
    return _bottomLab;
}

- (UILabel *)midLab {
    if(_midLab == nil) {
        _midLab = [[UILabel alloc] init];
        [self.contentView addSubview:_midLab];
        _midLab.numberOfLines=1;
        _midLab.textColor = [UIColor grayColor];
        [_midLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topLab);
            make.right.equalTo(-5);
            make.top.equalTo(self.topLab.mas_bottom).equalTo(5);
        }];
    }
    return _midLab;
}

- (UILabel *)topLab {
    if(_topLab == nil) {
        _topLab = [[UILabel alloc] init];
        [self.contentView addSubview:_topLab];
        _topLab.numberOfLines=1;
        [_topLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imagev.mas_right).equalTo(10);
            make.right.equalTo(-5);
            make.top.equalTo(self.imagev);
        }];
    }
    return _topLab;
}

- (UIImageView *)imagev {
    if(_imagev == nil) {
        _imagev = [[UIImageView alloc] init];
        [self.contentView addSubview:_imagev];
        [_imagev mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(80);
            make.top.left.equalTo(5);
        }];
        _imagev.contentMode = UIViewContentModeScaleToFill;
    }
    return _imagev;
}
@end
/*================================   specialCell end=======================*/
@interface SpecialListCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *cellHeadView;
@property (nonatomic,strong)UITableView *tv;
@end

@implementation SpecialListCell
#pragma mark - tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    specialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"specialCell" forIndexPath:indexPath];
    [cell.imagev setImageURL:self.specialColumn.list[indexPath.row].coverPath.yx_URL];
    cell.topLab.text=self.specialColumn.list[indexPath.row].title;
    cell.midLab.text = self.specialColumn.list[indexPath.row].subtitle;
    cell.bottomLab.text  = self.specialColumn.list[indexPath.row].footnote;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListenListTableViewController *lltvc = [[ListenListTableViewController alloc]initWithList:self.specialColumn.list[indexPath.row].specialId statMoudle:self.specialColumn.title pageType:@"发现_推荐"];
    [self.viewController.navigationController pushViewController:lltvc animated:YES];
}
#pragma mark - LifeCycle 生命周期
- (instancetype)initWithColumn:(RecommendModelSpecialcolumn *)specialcColumn{
    self = [super init];
    if (self) {
        _specialColumn = specialcColumn;
        [self tv];
        [self cellHeadView];
    }
    return self;
}

#pragma mark - 懒加载
- (UIView *)cellHeadView {
    if(_cellHeadView == nil) {
        _cellHeadView = [[UIView alloc] init];
        [self.contentView addSubview:_cellHeadView];
        [_cellHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(5);
            make.height.equalTo(40);
        }];
        UILabel *titlelab = [UILabel new];
        [_cellHeadView addSubview:titlelab];
        titlelab.text = self.specialColumn.title;
        [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(20);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cellHeadView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.centerY.equalTo(0);
        }];
        [button setTitle:@"更多" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button bk_addEventHandler:^(id sender) {
            NSLog(@"q");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _cellHeadView;
}

- (UITableView *)tv {
    if(_tv == nil) {
        _tv = [[UITableView alloc] init];
        [self.contentView addSubview:_tv];
        _tv.delegate = self;
        _tv.dataSource=self;
        _tv.scrollEnabled=NO;
        [_tv registerClass:[specialCell class] forCellReuseIdentifier:@"specialCell"];
        [_tv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellHeadView.mas_bottom);
            make.left.right.bottom.equalTo(0);
            
        }];
    }
    return _tv;
    
}



@end
