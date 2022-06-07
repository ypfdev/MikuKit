//
//  WKWebView+ClearCache.h
//  nooie-home-ios
//
//  Created by 原鹏飞 on 2021/11/29.
//  Copyright © 2021 Apeman. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (ClearCache)

/// 清除全部缓存
/// @param completion 完成回调
+ (void)mk_clearAllCacheCompletion:(void(^ __nullable)(void))completion;

/// 清除指定类型的缓存（>= iOS9）
/// WKWebsiteDataTypeFetchCache,                    // ios(11.3) On-disk Fetch caches.
/// WKWebsiteDataTypeDiskCache,                     // ios(9.0)  On-disk caches.
/// WKWebsiteDataTypeMemoryCache,                   // ios(9.0)  In-memory caches.
/// WKWebsiteDataTypeOfflineWebApplicationCache,    // ios(9.0)  HTML offline web application caches.
/// WKWebsiteDataTypeCookies,                       // ios(9.0)  Cookies.
/// WKWebsiteDataTypeSessionStorage,                // ios(9.0)  HTML session storage.
/// WKWebsiteDataTypeLocalStorage,                  // ios(9.0)  HTML local storage.
/// WKWebsiteDataTypeWebSQLDatabases,               // ios(9.0)  WebSQL databases.
/// WKWebsiteDataTypeIndexedDBDatabases,            // ios(9.0)  ndexedDB databases.
/// WKWebsiteDataTypeServiceWorkerRegistrations,    // ios(11.3) Service worker registrations.
/// @param cacheTypes 缓存类型数组（WKWebsiteDataRecord定义的缓存类型，使用前建议跳进去查看是否有更新）
/// @param completion 完成回调
+ (void)mk_clearCacheWithCacheTypes:(NSArray<NSString *> *)cacheTypes
                         completion:(void(^ __nullable)(void))completion;

/// 清除缓存（<= iOS9）
+ (void)mk_clearCacheBeforeIOS9;

@end

NS_ASSUME_NONNULL_END
