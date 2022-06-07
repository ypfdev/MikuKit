//
//  MKQRCodeTool.m
//  MikuKit
//
//  Created by 原鹏飞 on 2022/3/29.
//  Copyright © 2022 Miku Inc. All rights reserved.
//

#import "MKQRCodeTool.h"

@implementation MKQRCodeTool

+ (UIImage *)mk_qrCodeWithContent:(NSString *)content
                             size:(CGFloat)size
                             logo:(nullable UIImage *)logo
                            scale:(CGFloat)scale {
    /// 1. 创建一个二维码滤镜实例
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    /// 2. 给滤镜添加数据
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [filter setValue:data forKey:@"inputMessage"];
    
    /// 3. 生成二维码
    CIImage *originalImg = [filter outputImage];
    
    /// 4. 高清处理（直接取屏幕宽度，可以确保高清图片分辨率 >= 控件尺寸）
    UIImage *hdImg = [self createNonInterpolatedUIImageFromCIImage:originalImg size:[UIScreen mainScreen].bounds.size.width];
    
    /// 5. 绘制图片
    /// 5.1 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(hdImg.size, NO, [[UIScreen mainScreen] scale]);
    /// 5.2 先绘制二维码本身
    [hdImg drawInRect:CGRectMake(0, 0, hdImg.size.width, hdImg.size.height)];
    /// 5.3 绘制嵌入二维码中间的logo图片
    if (logo) {
        /// ⚠️注意logo最大不要超过二维码的0.3，否则会扫码失败，这里默认比例为0.25
        if (scale < 0.15 || scale > 0.3) {
            scale = 0.25;
        }
        CGFloat width = hdImg.size.width * scale;
        CGFloat height = hdImg.size.height * scale;
        CGFloat x = hdImg.size.width * 0.5 - width * 0.5;
        CGFloat y = hdImg.size.height * 0.5 - height * 0.5;
        /// 绘制logo
        [logo drawInRect:CGRectMake(x, y, width, height)];
    }
    /// 5.4 从图形上下文中获取完成的二维码图片
    UIImage *qrCode = UIGraphicsGetImageFromCurrentImageContext();
    /// 5.5 关闭图形上下文
    UIGraphicsEndImageContext();

    return qrCode;
}

/// 生成高清图片
/// @param image 原始图片
/// @param size 目标图片大小
+ (UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image
                                                size:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    /// 1. 创建bitmap
    size_t width = CGRectGetWidth(extent)*scale;
    size_t height = CGRectGetHeight(extent)*scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    /// 2. 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

@end
