//
//  MKMicro.h
//  MikuKit
//
//  Created by 原鹏飞 on 2022/6/7.
//

#ifndef MKMicro_h
#define MKMicro_h

#ifdef __OBJC__ // 🐶(开头)保证 #ifdef 中的宏定义只会在OC代码中被引用，防止导入C/C++代码或框架而出错

// 宏定义种用反斜杠\表示换行，例如
//#define MyLog(format, ...) do { \
//fprintf(stderr, "<%s : %d> %s\n", \
//[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__); \
//(NSLog)((format), ##__VA_ARGS__); \
//fprintf(stderr, "-------\n"); \
//} while (0)

#pragma mark - Environment

// 这种定义一般情况下也是可以的，但是当手动更改了「Build Settings」中关于「DEBUG」的定义后，可能会失效哦
#ifdef DEBUG
// debug
#else
// release
#endif

// MARK: DEBUG
#ifndef __OPTIMIZE__    // ⚠️「__OPTIMIZE__」是系统在RELEASE下默认定义的宏，因此「#ifndef __OPTIMIZE__」就可以用来声明DEBUG环境
//#define MKLog(format, ...)  NSLog((@"\n    🐶%s\n    🐶line %d\n    🐶%s\n    🐶" format), __FILE__, __LINE__, __FUNCTION__, __VA_ARGS__)
#define MKLog(format, ...)  NSLog((@"\n    \🐶path = %s\n    🐶<%s : %d>\n    🐶%s\n    🐶" format), __FILE__, [NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String, __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);

// MARK: RELEASE
#else
#define MKLog(format, ...)  do { } while (0)
#define NSLog(format, ...)  do { } while (0)

#endif

// MARK: 模拟器
#if defined (__i386__) || defined (__x86_64__)

#else
// MARK: 真机
#endif

#endif  // 🐶(结尾)保证 #ifdef 中的宏定义只会在OC代码中被引用，防止导入C/C++代码或框架而出错

#endif /* MKMicro_h */
