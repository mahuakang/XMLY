#import "HorizontalItemCell.h"
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