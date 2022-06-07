//
//  UIView+MKCategory.h
//  Miku
//
//  Created by 原鹏飞 on 16/6/6.
//  Copyright © 2016年 MikuKit. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MKCategory)

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)mk_removeAllSubviews;

/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;

/**
 * @brief 从子视图往上查找父视图，直至找到UITableViewCell返回
 * @return 返回一个UITableViewCell对象，如果没有则返回nil
 */
- (UITableViewCell *)tableViewCell;

/**
 *  从子视图往上查找父视图，直至找到UITableView返回
 *
 *  @return UITableView对象，若是没有则返回nil
 */
- (UITableView *)tableView;

/**
 *@breif 动画的显示阴影
 *@note  原理是在当前视图的layer层改变view的背景色
 */
- (void)animatedShowShadow;

/**
 *  layer层改变某个背景颜色到另外一种背景颜色
 *
 *  @param color   源背景色
 *  @param toColor 目标背景色
 */
- (void)backgroundColorAnimationOnlayerColor:(UIColor *)color toColor:(UIColor *)toColor;

@property (nonatomic, copy) NSObject *attachment; //在视图中附加一个绑定数据

#pragma mark - Border

/// 添加边框（DEBUG & RELEASE）
/// @param color 边框颜色
/// @param width 边框宽度
- (void)mk_borderWithColor:(UIColor *)color
                     width:(CGFloat)width;

/// 添加调试边框
/// @param color 边框颜色
/// @param width 边框宽度
- (void)mk_debugBorderWithColor:(UIColor *)color
                          width:(CGFloat)width;

/// 添加调试边框：红色
- (void)mk_debugBorderRed;

/// 添加调试边框：绿色
- (void)mk_debugBorderGreen;

/// 添加调试边框：蓝色
- (void)mk_debugBorderBlue;

#pragma mark - Round Corner

/// 快速切指定半径圆角
/// （注意！仅适用于固定size视图，变化的视图使用时可能造成约束错误，例如自适应行高的TBCell的colorBG）
/// @param corners 圆角半径
/// @param radius 圆角方位的位移枚举
- (void)mk_resetRoundCorner:(UIRectCorner)corners
                     radius:(CGFloat)radius;

/// 快速切全圆角
- (void)mk_resetAllRoundCorner;

/// 快速切指定半圆角（左上、左下、右下、右上、全部）
/// @param corners 圆角方位的位移枚举
- (void)mk_resetRoundCorner:(UIRectCorner)corners;

#pragma mark - Others

/// 重设视图可见性
/// @param visible 是否可见
- (void)mk_resetVisible:(BOOL)visible;

/// 返回视图所属的控制器
- (UIViewController *)mk_currentVC;

/// 快速添加单击手势
/// @param target 响应者
/// @param action 响应方法
- (void)mk_addTapGestureWithTarget:(nullable id)target
                            action:(nullable SEL)action;

/// 在view上画虚线（CAShapeLayer）
/// @param targetView 目标视图
/// @param length 线条长度
/// @param spacing 线条点距
/// @param color 线条颜色
/// @param isHorizonal 水平/垂直
- (void)mk_drawDottedLineOnTargetView:(UIView *)targetView
                               length:(int)length
                              spacing:(int)spacing
                                color:(UIColor *)color
                            direction:(BOOL)isHorizonal;

@end

NS_ASSUME_NONNULL_END
