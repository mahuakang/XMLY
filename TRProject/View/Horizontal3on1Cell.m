//
//  Horizontal3on1Cell.m
//  TRProject
//
//  Created by kfc on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "Horizontal3on1Cell.h"
/*=============ThreeCell begin======================*/
@interface ThreeCell :UICollectionViewCell
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *subLab;
@end
@implementation ThreeCell
#pragma mark - 懒加载
- (UIImageView *)imageview {
    if(_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageview];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(self.imageview.mas_width);
        }];
        _imageview.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageview;
}

- (UILabel *)titleLab {
    if(_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLab];
        _titleLab.numberOfLines=2;
        _titleLab.font = [UIFont  systemFontOfSize:14];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.imageview);
            make.top.equalTo(self.imageview.mas_bottom);
        }];
    }
    return _titleLab;
}

- (UILabel *)subLab {
    if(_subLab == nil) {
        _subLab = [[UILabel alloc] init];
        [self.contentView addSubview:_subLab];
        _subLab.numberOfLines = 1;
        _subLab.font = [UIFont  systemFontOfSize:12];
        _subLab.textColor = [UIColor grayColor];
        [_subLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.titleLab);
            make.top.equalTo(self.titleLab.mas_bottom);
        }];
    }
    return _subLab;
}
@end
/*=============ThreeCell end======================*/

@interface Horizontal3on1Cell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UIView *cellHeadView;
@property (nonatomic,strong)UICollectionView *cv;
@end
@implementation Horizontal3on1Cell
#pragma mark - UICollectionView 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThreeCell" forIndexPath:indexPath];
    if (_currentSession==1) {
        RecommendModeleditorRecommendAlbumsList *list = self.editorRecommend.list[indexPath.row];
        _titleLab.text =self.editorRecommend.title;
        [cell.imageview setImageURL:list.coverLarge.yx_URL];
        cell.titleLab.text = list.trackTitle;
        cell.subLab.text = list.title;
    }else{
        RecommendModelListHotrecommendsListList *list =self.listDetial.list[indexPath.row];
        _titleLab.text = self.listDetial.title;
        [cell.imageview setImageURL:list.coverLarge.yx_URL];
        cell.titleLab.text =list.trackTitle;
        cell.subLab.text = list.title;
    }
    return cell;
}
#pragma mark -  初始化
- (instancetype)initWithList:(RecommendModelListHotrecommendsList  *)listDetial andEdit:(RecommendModelEditorrecommendalbums *)editorRecommend andCuccentSession:(NSInteger)currentSession;{
    self = [super init];
    if (self) {
        _editorRecommend = editorRecommend;
        _listDetial = listDetial;
        _currentSession = currentSession;
        [self cellHeadView];
        [self cv];
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
        _titleLab = [UILabel new];
        [_cellHeadView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (UICollectionView *)cv {
    if(_cv == nil) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing =0;
        flowLayout.minimumInteritemSpacing =10;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width =([UIScreen mainScreen].bounds.size.width -40)/3;
        CGFloat height = width+80;
        flowLayout.itemSize = CGSizeMake(width, height);
        flowLayout.scrollDirection =UICollectionViewScrollDirectionVertical;
        _cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.contentView addSubview:_cv];
        _cv.delegate=self;
        _cv.dataSource=self;
        _cv.scrollEnabled =NO;
        _cv.backgroundColor = [UIColor whiteColor];
        [_cv registerClass:[ThreeCell class] forCellWithReuseIdentifier:@"ThreeCell"];
        [_cv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellHeadView.mas_bottom);
            make.left.right.bottom.equalTo(0);
            
        }];
        
    }
    return _cv;
}



@end

