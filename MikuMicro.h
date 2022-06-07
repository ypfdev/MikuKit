//
//  MikuMicro.h
//  MikuKit
//
//  Created by 原鹏飞 on 2022/6/7.
//

#ifndef MikuMicro_h
#define MikuMicro_h

#ifdef DEBUG

#else

#endif

// MARK: DEBUG
#ifndef __OPTIMIZE__    /// 注意！这里使用的是#ifndef（__OPTIMIZE__是release系统默认加的宏）

#define MKLOG_DEBUG(...) NSLog(@"[%s]\n[%s] %@",__FILE__ , __FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])

#define MKLog(format, ...) NSLog((@"\n    🐶<%s : %d>\n    🐶%s\n    🐶" format @"\n"), [NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String, __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);

#define NSLog(...) NSLog(@"[%s]\n[%s] %@",__FILE__ , __FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])

// MARK: Release
#else

#define MKLOG(...) do { } while (0)

#define MKLog(format, ...)

#define NSLog(...)

#endif

#endif /* MikuMicro_h */
