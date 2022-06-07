//
//  NSString+Verify.m
//  nooie-home-ios
//
//  Created by 原鹏飞 on 2022/1/6.
//  Copyright © 2022 Apeman. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)

- (NSString *)mk_removeAllWhitespace {
    return [self mk_removeWhitespace:MKCharacterAtAll];
}

- (NSString *)mk_removeAllNewline {
    return [self mk_removeNewline:MKCharacterAtAll];
}

- (NSString *)mk_removeAllWhitespaceAndNewline {
    return [self mk_removeWhitespaceAndNewline:MKCharacterAtAll];
}

- (NSString *)mk_removeWhitespace:(MKCharacterAt)characterAt {
    NSString *str = self;
    if (characterAt == MKCharacterAtBeginningAndEnd) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    } else if (characterAt == MKCharacterAtAll) {
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return str;
}

- (NSString *)mk_removeNewline:(MKCharacterAt)characterAt {
    NSString *str = self;
    if (characterAt == MKCharacterAtBeginningAndEnd) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    } else if (characterAt == MKCharacterAtAll) {
        str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return str;
}

- (NSString *)mk_removeWhitespaceAndNewline:(MKCharacterAt)characterAt {
    NSString *str = self;
    if (characterAt == MKCharacterAtBeginningAndEnd) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    } else if (characterAt == MKCharacterAtAll) {
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return str;
}

#pragma mark - Format Verification

- (BOOL)mk_verifyFormatEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9._%+-]+\\.[A-Za-z0-9_%+-]{2,12}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

@end
