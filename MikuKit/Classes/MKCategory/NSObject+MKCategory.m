//
//  NSObject+MKCategory.m
//  Nooie
//
//  Created by 原鹏飞 on 2022/5/6.
//  Copyright © 2022 Apeman. All rights reserved.
//

#import "NSObject+MKCategory.h"

@implementation NSObject (MKCategory)

+ (void)mk_printAllProperty {
    NSLog(@"🐶%@🐶", NSStringFromClass([self class]));
    NSLog(@"--------------------");
    NSLog(@"propertyName");
    NSLog(@"propertyAttributes");
    NSLog(@"--------------------");
    NSLog(@"⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️⬇️");
    NSLog(@"--------------------");
    unsigned int outCount;
    objc_property_t *pProperty = class_copyPropertyList([UIDatePicker class], &outCount);
    for (int i = outCount - 1; i >= 0; i--) {
        // 循环获取属性的名字  property_getName函数返回一个属性的名称
        NSString *propertyName = [NSString stringWithCString:property_getName(pProperty[i]) encoding:NSUTF8StringEncoding];
        NSString *propertyAttributes = [NSString stringWithCString:property_getAttributes(pProperty[i]) encoding:NSUTF8StringEncoding];
        NSLog(@"%@", propertyName);
        NSLog(@"%@", propertyAttributes);
        NSLog(@"--------------------");
    }
    NSLog(@"⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️⬆️");
    NSLog(@"🐶UIDatePicker🐶");
}

@end
