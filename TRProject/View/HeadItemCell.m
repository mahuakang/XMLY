//
//  HeadItemCell.m
//  TRProject
//
//  Created by kfc on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadItemCell.h"
@interface HeadItemCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *cv;
@property (nonatomic,strong)UILabel *lab;
@property (nonatomic,strong)NSArray *tmpArr;
@end
@implementation HeadItemCell
#pragma mark - CollectionView 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoriesData.count+1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = kRGBColor(245, 245, 245, 1);
    
    if (indexPath.row == self.categoriesData.count) {//最后一个
        _lab = [UILabel new];
        [cell.contentView addSubview:_lab];
        [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
        _lab.text =@"更多";
        return cell;
    }
    
    //正常情况
    _lab = [UILabel new];
    [cell.contentView addSubview:_lab];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
    }];
    _lab.text = self.categoriesData[indexPath.row].name;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==self.categoriesData.count) {
        
    }
}
#pragma mark -  初始化
- (instancetype)initWithList:(RadioModelData *)data{
    self = [super init];
    if (self) {
        _categoriesData = data.categories;
        _tmpArr = data.categories;
        [self cv];
    }
    return self;
}

#pragma mark - 懒加载
- (UICollectionView *)cv {
    if(_cv == nil) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        
        flowLayout.minimumLineSpacing =2;
        flowLayout.minimumInteritemSpacing =2;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        CGFloat width =([UIScreen mainScreen].bounds.size.width -20 - 2*3)/4;
        CGFloat height = 40;
        flowLayout.itemSize = CGSizeMake(width, height);
        flowLayout.scrollDirection =UICollectionViewScrollDirectionVertical;
        
        _cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.contentView addSubview:_cv];
        _cv.delegate=self;
        _cv.dataSource=self;
        _cv.scrollEnabled =NO;
        _cv.backgroundColor = [UIColor whiteColor];
        [_cv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_cv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
    return _cv;
}

@end
