//
//  NSArray+LengthException.m
//  victure-ios
//
//  Created by apple on 2020/5/5.
//  Copyright © 2020 Victor. All rights reserved.
//

#import "NSArray+LengthException.h"
#import <objc/runtime.h>
#import "MKMicro.h"

@implementation NSArray (LengthException)

+ (void)load {
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //  替换不可变数组中的方法
        Method oldObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(objectAtIndex:));
        Method newObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(mk_objectAtIndex:));
        method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
        Method oldObjectAtIndexedSubscript = class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(objectAtIndexedSubscript:));
        Method newObjectAtIndexedSubscript = class_getInstanceMethod(objc_getClass("__NSArrayI"),@selector(mk_objectAtIndexedSubscript:));
        method_exchangeImplementations(oldObjectAtIndexedSubscript, newObjectAtIndexedSubscript);
        //  替换可变数组中的方法
        Method oldMutableObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(objectAtIndex:));
        Method newMutableObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(mk_mutableObjectAtIndex:));
        method_exchangeImplementations(oldMutableObjectAtIndex, newMutableObjectAtIndex);
        Method oldMutableObjectAtIndexedSubscript = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(objectAtIndexedSubscript:));
        Method newMutableObjectAtIndexedSubscript = class_getInstanceMethod(objc_getClass("__NSArrayM"),@selector(mk_mutableObjectAtIndexedSubscript:));
        method_exchangeImplementations(oldMutableObjectAtIndexedSubscript, newMutableObjectAtIndexedSubscript);
    });
}

- (id)mk_objectAtIndex:(NSUInteger)index {
    if (index > self.count -1 || !self.count) {
        @try {
            return [self mk_objectAtIndex:index];
        } @catch (NSException *exception) {
//            MKLog(@"🐶%@ -> NSArray error0: arr.count=%lu index=%lu", @__FILE_NAME__, self.count, index);
            return nil;
        } @finally {
            
        }
    } else {
        return [self mk_objectAtIndex:index];
    }
}

- (id)mk_objectAtIndexedSubscript:(NSUInteger)index {
    if (index > self.count -1 || !self.count) {
        @try {
            return [self mk_objectAtIndexedSubscript:index];
        } @catch (NSException *exception) {
//            MKLog(@"🐶%@ -> NSArray error1: arr.count=%lu index=%lu", @__FILE_NAME__, self.count, index);
            return nil;
        } @finally {
            
        }
    } else {
        return [self mk_objectAtIndexedSubscript:index];
    }
}

- (id)mk_mutableObjectAtIndex:(NSUInteger)index {
    if (index > self.count -1 || !self.count) {
        @try {
            return [self mk_mutableObjectAtIndex:index];
        } @catch (NSException *exception) {
//            MKLog(@"🐶%@ -> NSArray error2: arr.count=%lu index=%lu", @__FILE_NAME__, self.count, index);
            return nil;
        } @finally {
            
        }
    } else {
        return [self mk_mutableObjectAtIndex:index];
    }
}

- (id)mk_mutableObjectAtIndexedSubscript:(NSUInteger)index {
    if (index > self.count -1 || !self.count) {
        @try {
            return [self mk_mutableObjectAtIndexedSubscript:index];
        } @catch (NSException *exception) {
//            MKLog(@"🐶%@ -> NSArray error3: arr.count=%lu index=%lu", @__FILE_NAME__, self.count, index);
            return nil;
        } @finally {
            
        }
    } else {
        return [self mk_mutableObjectAtIndexedSubscript:index];
    }
}

@end
