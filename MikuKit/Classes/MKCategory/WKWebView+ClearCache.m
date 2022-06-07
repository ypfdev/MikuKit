//
//  WKWebView+ClearCache.m
//  nooie-home-ios
//
//  Created by 原鹏飞 on 2021/11/29.
//  Copyright © 2021 Apeman. All rights reserved.
//

#import "WKWebView+ClearCache.h"

@implementation WKWebView (ClearCache)

+ (void)mk_clearAllCacheCompletion:(void(^ __nullable)(void))completion {
    //allWebsiteDataTypes清除所有缓存
    NSSet *dataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:dataTypes
                                               modifiedSince:startDate
                                           completionHandler:^{
        if (completion) {
            completion();
        }
    }];
}

+ (void)mk_clearCacheWithCacheTypes:(NSArray<NSString *> *)cacheTypes
                         completion:(void(^ __nullable)(void))completion {
    NSSet *dataTypes= [NSSet setWithArray:cacheTypes];
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:dataTypes
                                               modifiedSince:startDate
                                           completionHandler:^{
        if (completion) {
            completion();
        }
    }];
    
}

+ (void)mk_clearCacheBeforeIOS9 {
    NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    NSString *bundleID  =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *webkitInLibPath = [NSString stringWithFormat:@"%@/WebKit", libraryDir];
    NSString *webKitInCachesPath = [NSString stringWithFormat:@"%@/Caches/%@/WebKit", libraryDir, bundleID];
    NSString *webKitInCachesfsPath = [NSString stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir, bundleID];

    NSError *error;
    /* iOS8.0 WebView Cache的存放路径 */
    [[NSFileManager defaultManager] removeItemAtPath:webkitInLibPath error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:webKitInCachesPath error:&error];
    /* iOS7.0 WebView Cache的存放路径 */
    [[NSFileManager defaultManager] removeItemAtPath:webKitInCachesfsPath error:&error];
}

@end
