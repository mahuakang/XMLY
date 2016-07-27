//
//  FocusimageModel.m
//  TRProject
//
//  Created by kfc on 16/7/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FocusimageModel.h"

@implementation FocusimageModel

@end
@implementation FocusimageModelFocusimages
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[FocusimageModelFocusimagesList class]};
}
@end


@implementation FocusimageModelFocusimagesList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end




