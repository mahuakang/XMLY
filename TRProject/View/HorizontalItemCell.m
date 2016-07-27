#import "HorizontalItemCell.h"
#import "AutoWebView.h"
#import "CategoryDetialPageController.h"
#import "BangdanDetialTableviewController.h"
#define btnG 30

@interface HorizontalItemCell ()

@end
@implementation HorizontalItemCell
#pragma mark -  初始化
- (instancetype)initWithArr:(NSArray<RecommendModelDiscoverColumnList *> *)itemDetial{
    self= [super init];
    if (self ) {
        
        _itemDetial = itemDetial;
        UIScrollView *sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        [self.contentView addSubview:sc];
        sc.pagingEnabled =YES;
        sc.showsHorizontalScrollIndicator=NO;
        CGFloat btnW= kScreenW /7;
        for (int i=0;i<_itemDetial.count;i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [sc addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(10);
                make.left.equalTo((btnW+btnG)*i+10);
                make.width.height.equalTo(btnW);
            }];
            [btn bk_addEventHandler:^(id sender) {
                if (![_itemDetial[i].url isEqualToString:@""]) {
                    AutoWebView *awv = [[AutoWebView alloc]initWithUrl:_itemDetial[i].url];
                    awv.navigationItem.title = _itemDetial[i].title;
                    [self.viewController.navigationController pushViewController:awv animated:YES];
                }else{
                    if ([_itemDetial[i].contentType isEqualToString:@"album_category"]) {
                        CategoryDetialPageController *wmpage = [[CategoryDetialPageController alloc]initWithId:1 statMoudle:@"付费精品" pageType:@""];
                        [self.viewController.navigationController pushViewController:wmpage animated:YES];
                    }else if([_itemDetial[i].title isEqualToString:@"经典必听"]){
                        BangdanDetialTableviewController *bdtvc = [[BangdanDetialTableviewController alloc]initWithType:@"album"  key: @"1_21_ranking:album:subscribed:30:0"];
                        [self.viewController.navigationController pushViewController:bdtvc animated:YES];
                    }else if([_itemDetial[i].title isEqualToString:@"热门分享"]){
                        BangdanDetialTableviewController *bdtvc = [[BangdanDetialTableviewController alloc]initWithType:@"track"  key: @"1_54_ranking:track:shared:1:0"];
                        [self.viewController.navigationController pushViewController:bdtvc animated:YES];
                    }
                }
            } forControlEvents:UIControlEventTouchUpInside];
            
            UIImageView *imageV = [[UIImageView alloc]init];
            [btn addSubview:imageV];
            [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
            imageV.contentMode = UIViewContentModeScaleToFill;
            [imageV setImageURL:_itemDetial[i].coverPath.yx_URL];
            imageV.layer.cornerRadius = btnW/2;
            imageV.clipsToBounds = YES;
            
            UILabel *lab = [UILabel new];
            [sc addSubview:lab];
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(btn);
                make.top.equalTo(btn.mas_bottom).equalTo(10);
                make.width.equalTo(btn);
            }];
            lab.font = [UIFont systemFontOfSize:13];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.text = _itemDetial[i].title;
        }
        
        
        sc.contentSize = CGSizeMake((btnW+btnG)*(_itemDetial.count), 0);
    }
    
    return self;
}


@end