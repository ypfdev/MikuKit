//
//  NSString+Layout.h
//  nooie
//
//  Created by 原鹏飞 on 2021/10/19.
//  Copyright © 2021 apemans. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Layout)

/**
 调整行间距

 @param font 字体
 @param string 文本
 @param maxWidth 文本最大显示宽度
 @param lineSpace 行距
 @return 富文本
 */
+ (NSAttributedString *)mk_setLableLineMarginWithLableFont:(UIFont *)font andString:(NSString *)string maxWidth:(CGFloat)maxWidth lineSpace:(CGFloat)lineSpace;


/**
 调整行间距
 
 @param font 字体
 @param string 文本
 @param alignment 文本左对齐方式
 @param maxWidth 文本最大显示宽度
 @param lineSpace 行距
 @return 富文本
 */
+ (NSAttributedString *)mk_setLableLineMarginWithLableFont:(UIFont *)font andString:(NSString *)string alignment:(NSTextAlignment)alignment maxWidth:(CGFloat)maxWidth lineSpace:(CGFloat)lineSpace;

/**
 计算带有行间距的文本高度

 @param font 字体
 @param string 文本
 @param maxWidth 文本最大显示宽度
 @param lineSpace 行距
 @return 文本高度
 */
+ (CGFloat)mk_heightForLableTextAndLineSapceWithFont:(UIFont *)font string:(NSString *)string maxWidth:(CGFloat)maxWidth lineSpace:(CGFloat)lineSpace;

@end

NS_ASSUME_NONNULL_END
