//
//  CategoryCell.m
//  TRProject
//
//  Created by kfc on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CategoryCell.h"
#import "CategoryDetialPageController.h"
#import "NetManager.h"
#import "WMPageNumModel.h"
/*==============================ItemCell begin=========================*/
@interface ItemCell : UICollectionViewCell
@property (nonatomic,strong)UILabel *ItemLab;
@property (nonatomic,strong)UIImageView *imageV;

@end
@implementation ItemCell
#pragma mark - 懒加载
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.height.width.equalTo(20);
            make.centerY.equalTo(0);
        }];
        _imageV.contentMode=UIViewContentModeScaleToFill;
    }
    return _imageV;
}

- (UILabel *)ItemLab {
    if(_ItemLab == nil) {
        _ItemLab = [[UILabel alloc] init];
        [self.contentView addSubview:_ItemLab];
        [_ItemLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right).equalTo(20);
            make.top.equalTo(self.imageV);
            
        }];
        
    }
    return _ItemLab;
}
@end
/*=============================    ItemCell end==========================*/
@interface CategoryCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *cv;
@property (nonatomic,strong)WMPageNumModel *mod;
@end
@implementation CategoryCell
#pragma mark - collectionView 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemDetial.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath:indexPath];
    [cell.imageV setImageURL:self.itemDetial[indexPath.row].coverPath.yx_URL];
    cell.ItemLab.text = self.itemDetial[indexPath.row].title;
    cell.backgroundColor= [ UIColor whiteColor];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoryDetialPageController *wmpage = [[CategoryDetialPageController alloc]initWithId:self.itemDetial[indexPath.row].Id statMoudle:self.itemDetial[indexPath.row].title pageType:@""];
    [self.viewController.navigationController pushViewController:wmpage animated:YES];
    
}
#pragma mark -  初始化
- (instancetype)initWithList:(NSArray<CategoryModelList *> *)itemDetial{
    self = [super init];
    if (self) {
        _itemDetial=itemDetial;
        [self cv];
    }
    return self;
}
#pragma mark - 懒加载
- (UICollectionView *)cv {
    if(_cv == nil) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing =0.5;
        flowLayout.minimumInteritemSpacing =0.3;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        CGFloat width =[UIScreen mainScreen].bounds.size.width /2-0.25;
        CGFloat height = 50;
        flowLayout.itemSize = CGSizeMake(width, height);
        flowLayout.scrollDirection =UICollectionViewScrollDirectionVertical;
        _cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.contentView addSubview:_cv];
        _cv.delegate=self;
        _cv.dataSource=self;
        _cv.scrollEnabled =NO;
        _cv.backgroundColor = kRGBColor(230, 230, 230, 1);
        [_cv registerClass:[ItemCell class] forCellWithReuseIdentifier:@"ItemCell"];
        [_cv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _cv;
}



@end
