//
//  NSString+Verify.h
//  nooie-home-ios
//
//  Created by 原鹏飞 on 2022/1/6.
//  Copyright © 2022 Apeman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Verify)

/// 字符串中字符位置的枚举
typedef NS_ENUM(NSUInteger, MKCharacterAt) {
    MKCharacterAtBeginningAndEnd    = 0,    /// 字符串的首尾
//    MKCharacterAtBeginning,
//    MKCharacterAtMiddle,
//    MKCharacterAtEnd,
    MKCharacterAtAll,                       /// 整个字符串
};

#pragma mark - 去除字符串中的字符

#pragma mark 整个字符串

/// 去除字符串中全部的空格
- (NSString *)mk_removeAllWhitespace;

/// 去除字符串中全部的换行
- (NSString *)mk_removeAllNewline;

/// 去除字符串中全部的空格和换行
- (NSString *)mk_removeAllWhitespaceAndNewline;

#pragma mark 字符串的特定位置

/// 去除字符串中的空格
/// @param characterAt 字符串中的位置
- (NSString *)mk_removeWhitespace:(MKCharacterAt)characterAt;

/// 去除字符串中的换行
/// @param characterAt 字符串中的位置
- (NSString *)mk_removeNewline:(MKCharacterAt)characterAt;

/// 去除字符串中的空格和换行
/// @param characterAt 字符串中的位置
- (NSString *)mk_removeWhitespaceAndNewline:(MKCharacterAt)characterAt;

#pragma mark - Format Verification

/// 校验邮箱格式
- (BOOL)mk_verifyFormatEmail;

@end

NS_ASSUME_NONNULL_END
