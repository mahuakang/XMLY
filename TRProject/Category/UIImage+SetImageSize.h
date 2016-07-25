//
//  UIImage+SetImageSize.h
//  TRProject
//
//  Created by kfc on 16/7/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SetImageSize)
- (UIImage*)setSelfSize:(CGSize)size;
- (UIImage*)cutImageWithRadius:(int)radius;
@end
