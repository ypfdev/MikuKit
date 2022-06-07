//
//  NSDictionary+Exception.m
//  victure-ios
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 Victor. All rights reserved.
//

#import "NSDictionary+MKCategory.h"
#import <objc/runtime.h>

@implementation NSDictionary (MKCategory)

+ (void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSPlaceholderDictionary"), @selector(initWithObjects:forKeys:count:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSPlaceholderDictionary"), @selector(mk_initWithObjects:forKeys:count:));
    method_exchangeImplementations(fromMethod, toMethod);
}

+ (void)initialize {
    
}

/*
 @{} 字典创建方法会走下面方法
 **/
- (instancetype)mk_initWithObjects:(id *)objects
                           forKeys:(id<NSCopying> *)keys
                             count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (objects[i] == nil) {
            NSLog(@"🐶%@ -> NSDictionary error: key=%@ value=nil", @__FILE_NAME__, keys[i]);
            objects[i] = @"";
        }
        if (keys[i] == nil) {
            NSLog(@"🐶%@ -> NSDictionary error: key=nil value=%@", @__FILE_NAME__, objects[i]);
            return nil;
        }
        rightCount++;
    }
    return [self mk_initWithObjects:objects forKeys:keys count:rightCount];
}

@end
