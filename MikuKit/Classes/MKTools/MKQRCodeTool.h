//
//  MKQRCodeTool.h
//  MikuKit
//
//  Created by 原鹏飞 on 2022/3/29.
//  Copyright © 2022 Miku Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 关于二维码的一些知识
 
 */


@interface MKQRCodeTool : NSObject

/// 生成二维码图片
/// @param content 二维码内容（字符串）
/// @param size 二维码图片大小（注意，不是二维码的leval）
/// @param logo 二维码中间的图标
/// @param scale 中间图标的比例（0.15～0.25）,默认为0.25，没有图片则传0或不传
+ (UIImage *)mk_qrCodeWithContent:(NSString *)content
                             size:(CGFloat)size
                             logo:(nullable UIImage *)logo
                            scale:(CGFloat)scale;



@end

NS_ASSUME_NONNULL_END
