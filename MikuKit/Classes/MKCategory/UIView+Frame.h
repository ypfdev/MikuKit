//
//  UIView+Frame.h
//  JinQianDun
//
//  Created by Kitty on 17/6/9.
//  Copyright © 2017年 Mr.xie clothing Company.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

#pragma mark - frame.origin

/// 位置
@property (nonatomic, assign) CGPoint mk_origin;
/// x
@property (nonatomic, assign) CGFloat mk_x;
/// y
@property (nonatomic, assign) CGFloat mk_y;

#pragma mark - frame.size

/// 大小
@property (nonatomic, assign) CGSize mk_size;
/// 宽度
@property (nonatomic, assign) CGFloat mk_width;
/// 高度
@property (nonatomic, assign) CGFloat mk_height;

#pragma mark - 扩展

/// 顶 (top = frame.origin.y)
@property (nonatomic, readwrite, assign) CGFloat mk_top;
/// 左 (left = frame.origin.x)
@property (nonatomic, readwrite, assign) CGFloat mk_left;
/// 底 (bottom = frame.origin.y + fram.size.height)
@property (nonatomic, readwrite, assign) CGFloat mk_bottom;
/// 右 (right = frame.origin.x + frame.size.width)
@property (nonatomic, readwrite, assign) CGFloat mk_right;
/// 水平中心
@property (nonatomic, assign) CGFloat mk_centerX;
/// 垂直中心
@property (nonatomic, assign) CGFloat mk_centerY;

@end
