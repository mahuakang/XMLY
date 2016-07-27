//
//  bangdanCell.m
//  TRProject
//
//  Created by kfc on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "bangdanCell.h"
#import "BangdanDetialTableviewController.h"
/*=====================bangdanListCell begin=============================*/
@interface bangdanListCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imagev;
@property (nonatomic,strong)UILabel *topLab;
@property (nonatomic,strong)UILabel *midLab;
@property (nonatomic,strong)UILabel *bottomLab;
@end
@implementation bangdanListCell
- (UILabel *)bottomLab {
    if(_bottomLab == nil) {
        _bottomLab = [[UILabel alloc] init];
        [self.contentView addSubview:_bottomLab];
        _bottomLab.numberOfLines=1;
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
            make.bottom.equalTo(self.bottomLab.mas_top).equalTo(-5);
        }];
    }
    return _midLab;
}

- (UILabel *)topLab {
    if(_topLab == nil) {
        _topLab = [[UILabel alloc] init];
        [self.contentView addSubview:_topLab];
        _topLab.numberOfLines=1;
        _topLab.font = [UIFont systemFontOfSize:20];
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
        
        UIView *topv=[UIView new];
        [_imagev addSubview:topv];
        topv.backgroundColor = kRGBColor(230, 230, 230, 1);
        [topv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(_imagev);
            make.height.equalTo(1);
        }];
        
        UIView *leftv=[UIView new];
        [_imagev addSubview:leftv];
        leftv.backgroundColor =  kRGBColor(230, 230, 230, 1);
        [leftv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(_imagev);
            make.width.equalTo(1);
        }];
        
        UIView *rightv=[UIView new];
        [_imagev addSubview:rightv];
        rightv.backgroundColor =  kRGBColor(230, 230, 230, 1);
        [rightv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.equalTo(_imagev);
            make.width.equalTo(1);
        }];
        
        UIView *bottonV=[UIView new];
        [_imagev addSubview:bottonV];
        bottonV.backgroundColor =  kRGBColor(230, 230, 230, 1);
        [bottonV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(_imagev);
            make.height.equalTo(1);
        }];
        
    }
    return _imagev;
}

@end
/*=====================bangdanListCell end==============================*/
@interface bangdanCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *cellHeadView;
@property (nonatomic,strong)UITableView *tv;
@end

@implementation bangdanCell
#pragma mark - TableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datas.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    bangdanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bangdanListCell" forIndexPath:indexPath];
    ListModelDatasList *list = self.datas.list[indexPath.row];
    [cell.imagev setImageURL:list.coverPath.yx_URL];
    cell.topLab.text = list.title;
    cell.midLab.text = [NSString stringWithFormat:@"1 %@",list.firstKResults[0].title];
    cell.bottomLab.text =[NSString stringWithFormat:@"2 %@",list.firstKResults[1].title];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_datas.title isEqualToString:@"主播榜单"]) {
        
    }else{
        
        BangdanDetialTableviewController *bdtvc = [[BangdanDetialTableviewController alloc]initWithType: self.datas.list[indexPath.row].contentType key: self.datas.list[indexPath.row].key];
        [self.viewController.navigationController pushViewController:bdtvc animated:YES];
    }
}
#pragma mark -  初始化
- (instancetype)initWithList:(ListModelDatas *)datas{
    self = [super init];
    if (self) {
        _datas=datas;
        [self cellHeadView];
        [self tv];
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
        
        //红色小三角
        UIImageView *imageV = [UIImageView new];
        [_cellHeadView addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
        imageV.image = [UIImage imageNamed:@"findsection_logo"];
        
        UILabel *titlelab = [UILabel new];
        [_cellHeadView addSubview:titlelab];
        titlelab.text = self.datas.title;
        [titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(imageV.mas_right).equalTo(10);
        }];
        
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
        [_tv registerClass:[bangdanListCell class] forCellReuseIdentifier:@"bangdanListCell"];
        [_tv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellHeadView.mas_bottom);
            make.left.right.bottom.equalTo(0);
            
        }];
    }
    return _tv;
    
}


@end
