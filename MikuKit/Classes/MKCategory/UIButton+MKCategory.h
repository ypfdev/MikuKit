//
//  UIButton+MKCategory.h
//  MotionCamera
//
//  Created by 原鹏飞 on 2018/12/12.
//  Copyright © 2018 Galanz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (MKCategory)

/// 快速创建文字按钮
/// @param mormalTitle 标题文字
/// @param normalColor 标题颜色
+ (UIButton *)mk_buttonWithNormalTitle:(NSString *)mormalTitle
                           normalColor:(UIColor *)normalColor;

/// 快速创建文字按钮
/// @param mormalTitle 标题文字
/// @param normalTitleColor 标题颜色
/// @param normalBgColor 背景颜色
+ (UIButton *)mk_buttonWithNormalTitle:(NSString *)mormalTitle
                      normalTitleColor:(UIColor *)normalTitleColor
                         normalBgColor:(UIColor *)normalBgColor;

/// 快速创建文字按钮
/// @param title 文字内容
/// @param fontSize 文字大小
/// @param normalColor 正常状态文字颜色
/// @param selectedColor 选中状态文字颜色
+ (instancetype)mk_textButton:(NSString *)title
                     fontSize:(CGFloat)fontSize
                  normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor;

/// 快速创建文字按钮
/// @param font 标题字体
/// @param title 标题文字
/// @param titleColor 标题颜色
/// @param normalBGColor 正常背景颜色
/// @param disableBGColor 不可用状态背景颜色
+ (instancetype)mk_textButtonWithFont:(UIFont *)font
                                title:(NSString *)title
                           titleColor:(UIColor *)titleColor
                        normalBGColor:(UIColor *)normalBGColor
                       disableBGColor:(UIColor *)disableBGColor;

/// 快速创建文字按钮
/// @param font 标题字体
/// @param normalTitle 正常状态的标题
/// @param normalTitleColor 正常状态的标题颜色
/// @param normalBGColor 正常状态的背景颜色
/// @param disableTitle 不可用状态的标题
/// @param disableTitleColor 不可用状态的标题颜色
/// @param disableBGColor 不可用状态的背景颜色
+ (instancetype)mk_textButtonWithFont:(UIFont *)font
                          normalTitle:(NSString *)normalTitle
                     normalTitleColor:(UIColor *)normalTitleColor
                        normalBGColor:(UIColor *)normalBGColor
                         disableTitle:(NSString *)disableTitle
                    disableTitleColor:(UIColor *)disableTitleColor
                       disableBGColor:(UIColor *)disableBGColor;

/// 快速创建带边框的按钮
/// @param normalTitle 标题文字
/// @param normalColor 标题颜色
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
+ (UIButton *)mk_buttonWithNormalTitle:(NSString *)normalTitle
                           normalColor:(UIColor *)normalColor
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;

/// 快速创建选中文字变色的按钮
/// @param normalTitle 正常状态标题文字
/// @param normalColor 正常状态标题颜色
/// @param selectedTitle 选中状态标题文字
/// @param selectedColor 选中状态标题颜色
+ (UIButton *)mk_buttonWithNormalTitle:(NSString *)normalTitle
                           normalColor:(UIColor *)normalColor
                         selectedTitle:(NSString *)selectedTitle
                         selectedColor:(UIColor *)selectedColor;

/// 快速创建带边框的、选中文字变色的按钮
/// @param normalTitle 正常状态标题文字
/// @param normalColor 正常状态标题颜色
/// @param selectedTitle 选中状态标题文字
/// @param selectedColor 选中状态标题颜色
/// @param borderWidth 边框线条宽度
/// @param borderColor 边框线条颜色
+ (UIButton *)mk_buttonWithNormalTitle:(NSString *)normalTitle
                           normalColor:(UIColor *)normalColor
                         selectedTitle:(NSString *)selectedTitle
                         selectedColor:(UIColor *)selectedColor
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;

/// 扩大按钮的点击区域
/// @param size 扩大区域的径向长度
- (void)mk_enlargeEdge:(CGFloat)size;

/// 扩大按钮的点击区域（矩形）
/// @param top 顶部扩大范围
/// @param left 左边扩大范围
/// @param bottom 底部扩大范围
/// @param right 右边扩大范围
- (void)mk_enlargeEdgeWithTop:(CGFloat)top AndLeft:(CGFloat)left AndBottom:(CGFloat)bottom AndRight:(CGFloat)right;

@end

NS_ASSUME_NONNULL_END
