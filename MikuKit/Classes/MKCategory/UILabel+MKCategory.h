//
//  UILabel+MKCategory.h
//  MotionCamera
//
//  Created by Kimee on 2018/10/27.
//  Copyright © 2018 Galanz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (MKCategory)

/// 快速创建类方法
/// @param text 文字
/// @param textColor 文字颜色
/// @param font 字体
+ (instancetype)mk_labelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font;

/// 快速创建类方法
/// @param text 文字
/// @param hexStr 文字颜色（十六进制字符串）
/// @param size 文字字号（regular字体）
+ (instancetype)mk_labelWithText:(NSString *)text
                 textColorHexStr:(NSString *)hexStr
                        fontSize:(CGFloat)size;

/// 快速创建类方法
/// @param text 文字
/// @param color 文字颜色
/// @param size 文字字号
+ (instancetype)mk_labelWithText:(nullable NSString * )text
                       textColor:(UIColor *)color
                        fontSize:(CGFloat)size;

/// 快速创建类方法
/// @param text 文字
/// @param hexStr 文字颜色（十六进制字符串）
/// @param fontName 字体名称
/// @param fontSize 字体字号
+ (instancetype)mk_labelWithText:(nullable NSString * )text
                 textColorHexStr:(NSString *)hexStr
                        fontName:(NSString *)fontName
                        fontSize:(CGFloat)fontSize;

/// 快速创建类方法
/// @param text 文字
/// @param hexStr 文字颜色（十六进制字符串）
/// @param fontName 字体名称
/// @param fontSize 字体字号
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
+ (instancetype)mk_labelWithText:(nullable NSString * )text
                 textColorHexStr:(NSString *)hexStr
                        fontName:(NSString *)fontName
                        fontSize:(CGFloat)fontSize
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderColor;



/// 重置文字对齐方式：两边对齐
- (void)mk_resetTextAlignmentRightandLeft;

/// 重置文字对齐方式：两边对齐，特定行距
/// @param lineSpacing 行距
- (void)mk_resetTextAlignmentLeftRightWithlineSpacing:(CGFloat)lineSpacing;


///**
// 左上对齐
// */
//- (void)gp_textAlignmentLeftTop;


@end

NS_ASSUME_NONNULL_END
