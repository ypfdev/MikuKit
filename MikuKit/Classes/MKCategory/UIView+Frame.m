//
//  UIView+Frame.m
//  JinQianDun
//
//  Created by Kitty on 17/6/9.
//  Copyright © 2017年 Mr.xie clothing Company.. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - frame.origin

- (void)setMk_x:(CGFloat)mk_x {
    CGRect frame = self.frame;
    frame.origin.x = mk_x;
    self.frame = frame;
}

- (CGFloat)mk_x {
    return self.frame.origin.x;
}

- (void)setMk_y:(CGFloat)mk_y {
    CGRect frame = self.frame;
    frame.origin.y = mk_y;
    self.frame= frame;
}

- (CGFloat)mk_y {
    return self.frame.origin.y;
}

- (void)setMk_origin:(CGPoint)mk_origin {
    CGRect frame = self.frame;
    frame.origin = mk_origin;
    self.frame = frame;
}

- (CGPoint)mk_origin {
    return self.frame.origin;
}

#pragma mark - frame.size

- (void)setMk_width:(CGFloat)mk_width {
    CGRect frame = self.frame;
    frame.size.width = mk_width;
    self.frame = frame;
}

- (CGFloat)mk_width {
    return self.frame.size.width;
}

- (void)setMk_height:(CGFloat)mk_height {
    CGRect frame = self.frame;
    frame.size.height = mk_height;
    self.frame = frame;
}

- (CGFloat)mk_height {
    return self.frame.size.height;
}

- (void)setMk_size:(CGSize)mk_size {
    CGRect frame = self.frame;
    frame.size = mk_size;
    self.frame = frame;
}

- (CGSize)mk_size {
    return self.frame.size;
}

#pragma mark - 扩展

- (void)setMk_top:(CGFloat)mk_top {
    CGRect frame = self.frame;
    frame.origin.y = mk_top;
    self.frame = frame;
}

- (CGFloat)mk_top {
    return self.frame.origin.y;
}

- (void)setMk_left:(CGFloat)mk_left {
    CGRect frame = self.frame;
    frame.origin.x = mk_left;
    self.frame = frame;
}

- (CGFloat)mk_left {
    return self.frame.origin.x;
}

- (void)setMk_bottom:(CGFloat)mk_bottom {
    CGRect frame = self.frame;
    frame.origin.y = mk_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)mk_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMk_right:(CGFloat)mk_right {
    CGRect frame = self.frame;
    frame.origin.x = mk_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)mk_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMk_centerX:(CGFloat)mk_centerX {
    CGPoint center = self.center;
    center.x = mk_centerX;
    self.center = center;
}

- (CGFloat)mk_centerX {
    return self.center.x;
}

- (void)setMk_centerY:(CGFloat)mk_centerY {
    CGPoint center = self.center;
    center.y = mk_centerY;
    self.center = center;
}

- (CGFloat)mk_centerY {
    return self.center.y;
} 

@end
