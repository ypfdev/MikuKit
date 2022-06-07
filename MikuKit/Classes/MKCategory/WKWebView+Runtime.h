//
//  WKWebView+Runtime.h
//  Nooie
//
//  Created by 原鹏飞 on 2022/2/11.
//  Copyright © 2022 Apeman. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (Runtime)

@property (nonatomic, assign) BOOL keyboardDisplayRequiresUserAction;

+ (void)allowDisplayingKeyboardWithoutUserAction;

@end

NS_ASSUME_NONNULL_END
