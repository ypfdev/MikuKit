//
//  UIView+MKCategory.h
//  Miku
//
//  Created by 原鹏飞 on 16/6/6.
//  Copyright © 2016年 MikuKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SDWebCircleImage)

- (void)loadImageUrlStr:(NSString *)urlStr
   placeHolderImageName:(NSString *)placeHolderStr
                 radius:(CGFloat)radius
              useCached:(BOOL)useCached;
- (void)loadImageUrlStr:(NSString *)urlStr
                 radius:(CGFloat)radius;
- (void)loadImageUrlStr:(NSString *)urlStr;

@end
