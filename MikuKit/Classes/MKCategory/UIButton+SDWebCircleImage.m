//
//  UIView+MKCategory.h
//  Miku
//
//  Created by 原鹏飞 on 16/6/6.
//  Copyright © 2016年 MikuKit. All rights reserved.
//

#import "UIButton+SDWebCircleImage.h"
#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/SDImageCache.h>

@implementation UIButton (SDWebCircleImage)

- (void)loadImageUrlStr:(NSString *)urlStr {
    [self loadImageUrlStr:urlStr
     placeHolderImageName:nil
                   radius:0.0
                useCached:YES];
}

- (void)loadImageUrlStr:(NSString *)urlStr
                 radius:(CGFloat)radius {
    [self loadImageUrlStr:urlStr
     placeHolderImageName:nil
                   radius:radius
                useCached:YES];
}

- (void)loadImageUrlStr:(NSString *)urlStr
   placeHolderImageName:(NSString *)placeHolderStr
                 radius:(CGFloat)radius
              useCached:(BOOL)useCached {
    NSURL *url;
    if (placeHolderStr == nil) {
        placeHolderStr = NSLocalizedString(@"account_Aa", @"Account");
    }
    
    //这里传CGFLOAT_MIN，就是默认以图片宽度的一半为圆角
    if (radius == CGFLOAT_MIN) {
        radius = self.frame.size.width/2.0;
    }
    
    url = [NSURL URLWithString:urlStr];
    
    if (radius != 0.0) {
        NSString *cacheurlStr = [urlStr stringByAppendingString:@"radiusCache"];
        if (useCached) {
            // check cach
            UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheurlStr];
            if (cacheImage) {
                [self setImage:cacheImage forState:UIControlStateNormal];
            } else {
                [self sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIButton createRoundedRectImage:[AppHelper getImgWithName:placeHolderStr] size:self.frame.size radius:radius] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    if (!error) {
                        UIImage *radiusImage = [UIButton createRoundedRectImage:image size:self.frame.size radius:radius];
                        [self setImage:radiusImage forState:UIControlStateNormal];
                        [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:nil];
                        [[SDImageCache sharedImageCache] addReadOnlyCachePath:urlStr];
                    } else {
                        UIImage *radiusImage = [UIButton createRoundedRectImage:[AppHelper getImgWithName:placeHolderStr] size:self.frame.size radius:radius];
                        [self setImage:radiusImage forState:UIControlStateNormal];
                        //[[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:nil];
                        //[[SDImageCache sharedImageCache] addReadOnlyCachePath:urlStr];
                    }
                }];
            }
        } else {
            [self sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIButton createRoundedRectImage:[AppHelper getImgWithName:placeHolderStr] size:self.frame.size radius:radius] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                if (!error) {
                    UIImage *radiusImage = [UIButton createRoundedRectImage:image size:self.frame.size radius:radius];
                    [self setImage:radiusImage forState:UIControlStateNormal];
                    [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:nil];
                    [[SDImageCache sharedImageCache] addReadOnlyCachePath:urlStr];
                } else {
                    UIImage *radiusImage = [UIButton createRoundedRectImage:[AppHelper getImgWithName:placeHolderStr] size:self.frame.size radius:radius];
                    [self setImage:radiusImage forState:UIControlStateNormal];
                    //[[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheurlStr completion:nil];
                    //[[SDImageCache sharedImageCache] addReadOnlyCachePath:urlStr];
                }
            }];
        }
    } else {
        [self sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[AppHelper getImgWithName:placeHolderStr]];
    }
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight) {
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

+ (id)createRoundedRectImage:(UIImage*)image
                        size:(CGSize)size
                      radius:(NSInteger)r {
    size_t w = size.width;
    size_t h = size.height;
    if (w == 0 || h == 0) {
        w = CGImageGetWidth(image.CGImage);
        h = CGImageGetHeight(image.CGImage);
    }
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, r, r);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked];
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    
    return img;
}

@end
