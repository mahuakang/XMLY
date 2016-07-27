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
#import "SpecialListCell.h"
#import "HorizontalItemCell.h"
#import "PlayerViewController.h"
#import "ListenListTableViewController.h"
#import "AlbumTableViewController.h"
#import "FocusimageModel.h"

@interface RecommendTableViewController()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)UIPageControl *pc;
@property (nonatomic,strong)RecommendModel *recommendModel;
@property (nonatomic,strong)RecommendModelList *recommendModelList;
@property (nonatomic,strong)FocusimageModel *focuimageModel;
@end
@implementation RecommendTableViewController{
    NSTimer *timer;
}
#pragma mark - ICarousel 代理方法
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.focuimageModel.focusImages.list.count;
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
    [uv sd_setImageWithURL:self.focuimageModel.focusImages.list[index].pic.yx_URL];
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
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    if (self.focuimageModel.focusImages.list[index].type==9) {
        ListenListTableViewController *lltvc = [[ListenListTableViewController alloc]initWithList:693 statMoudle:self.focuimageModel.focusImages.list[index].shortTitle pageType:@"发现_推荐"];
        [self.navigationController pushViewController:lltvc animated:YES];
    }else if(self.focuimageModel.focusImages.list[index].type==2){
        AlbumTableViewController *atvc = [[AlbumTableViewController alloc]initWithList:self.focuimageModel.focusImages.list[index].albumId statMoudle:@"听单详情" pageType:@"q"];
        [self.navigationController pushViewController:atvc animated:YES];
    }
}
#pragma mark - Tableview 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3+self.recommendModelList.hotRecommends.list.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            HorizontalItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
            cell = [cell initWithArr:self.recommendModel.discoveryColumns.list];
            return cell;
        }
        case 2:
        {
            SpecialListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"specialList" forIndexPath:indexPath];
            if (self.recommendModel.specialColumn.list.firstObject) {
                cell = [cell initWithColumn:self.recommendModel.specialColumn];
            }
            return cell;
        }
        default:
        {
            Horizontal3on1Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"3on1Cell" forIndexPath:indexPath];
            cell = [cell initWithList:self.recommendModelList.hotRecommends.list[indexPath.section==1?0:indexPath.section-3] andEdit:self.recommendModel.editorRecommendAlbums andCuccentSession:indexPath.section];
            return cell;
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 100;
        case 2:
            if (self.recommendModel.specialColumn.list.firstObject) {
                return 240;
            }
            return 0;
        default:
            return 230;
    }
}
//调整section间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section==0?0:10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[Horizontal3on1Cell class] forCellReuseIdentifier:@"3on1Cell"];
    [self.tableView registerClass:[HorizontalItemCell class] forCellReuseIdentifier:@"itemCell"];
    [self.tableView registerClass:[SpecialListCell class] forCellReuseIdentifier:@"specialList"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getfocusimagecompletionHandler:^(id model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                self.focuimageModel = model;
                self.tableView.tableHeaderView=self.ic;
                [self.tableView reloadData];
            }
        }];
        [NetManager getRecommendList:^(id model, NSError *error) {
            if (error) {
                NSLog(@"网络请求出错，请重新刷新");
            }else{
                self.recommendModel =model;
                [self.tableView reloadData];
            }
        } listcompletionHandler:^(id model, NSError *error) {
            if (error) {
                NSLog(@"网络请求出错，请重新刷新");
            }else{
                self.recommendModelList =model;
                [self.tableView reloadData];
            }
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
        _pc.numberOfPages=self.focuimageModel.focusImages.list.count;
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-5);
            make.centerX.equalTo(0);
        }];
        
        [timer invalidate];
        timer =nil;
        
        timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    return _ic;
}

@end
