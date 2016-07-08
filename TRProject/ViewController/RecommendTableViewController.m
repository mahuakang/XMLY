//
//  RecommendTableViewController.m
//  TRProject
//
//  Created by kfc on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RecommendTableViewController.h"
#import "Horizontal3on1Cell.h"
#import "RecommendModel.h"
#import "NetManager.h"
@interface RecommendTableViewController()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)UIPageControl *pc;
@property (nonatomic,strong)RecommendModel *recommendModel;
@property (nonatomic,strong)RecommendModelList *recommendModelList;
@end
@implementation RecommendTableViewController
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.recommendModel.focusImages.list.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:carousel.bounds];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        imageView.tag=100;
        imageView.contentMode = UIViewContentModeScaleToFill;
    }
    UIImageView *uv = [view viewWithTag:100];
    [uv setImageURL:self.recommendModel.focusImages.list[index].pic.yx_URL];
    return view;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = _ic.currentItemIndex;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (value == iCarouselOptionWrap) {
        value =YES;
    }
    return value;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[Horizontal3on1Cell class] forCellReuseIdentifier:@"3on1"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getRecommendList:^(id model, NSError *error) {
            _recommendModel =model;
            self.tableView.tableHeaderView=self.ic;
            
        } listcompletionHandler:^(id model, NSError *error) {
            _recommendModelList =model;
            [self.tableView reloadData];
        }];
        [self.tableView.mj_header endRefreshing];
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - 懒加载
- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, 0, kScreenW/2)];
        _ic.delegate=self;
        _ic.dataSource=self;
        _ic.type=0;
        
        _pc =[UIPageControl new];
        _pc.numberOfPages=self.recommendModel.focusImages.list.count;
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.centerX.equalTo(0);
        }];
        
    }
    return _ic;
}

@end
