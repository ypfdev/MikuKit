//
//  UILabel+MKCategory.m
//  MotionCamera
//
//  Created by Kimee on 2018/10/27.
//  Copyright © 2018 Galanz. All rights reserved.
//

#import "UILabel+MKCategory.h"
#import "UIColor+MKCategory.h"

@implementation UILabel (MKCategory)

+ (instancetype)mk_labelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font {
    UILabel* label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}

+ (instancetype)mk_labelWithText:(NSString *)text
                 textColorHexStr:(NSString *)hexStr
                        fontSize:(CGFloat)size {
    UILabel* label = [UILabel new];
    label.text = text;
    label.textColor = [UIColor mk_colorWithHexString:hexStr];
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

+ (instancetype)mk_labelWithText:(NSString *)text
                       textColor:(UIColor *)color
                        fontSize:(CGFloat)size{
    UILabel* label = [UILabel new];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = 0;
    return label;
}

+ (instancetype)mk_labelWithText:(nullable NSString * )text
                 textColorHexStr:(NSString *)hexStr
                        fontName:(NSString *)fontName
                        fontSize:(CGFloat)fontSize {
    UILabel* label = [UILabel new];
    label.text = text;
    label.textColor = [UIColor mk_colorWithHexString:hexStr];
    label.font = [UIFont fontWithName:fontName size:fontSize];
    
    return label;
}

+ (instancetype)mk_labelWithText:(nullable NSString * )text
                 textColorHexStr:(NSString *)hexStr
                        fontName:(NSString *)fontName
                        fontSize:(CGFloat)fontSize
                     borderWidth:(CGFloat)borderWidth
                     borderColor:(UIColor *)borderColor {
    UILabel* label = [UILabel new];
    label.text = text;
    label.textColor = [UIColor mk_colorWithHexString:hexStr];
    label.font = [UIFont fontWithName:fontName size:fontSize];
    label.layer.borderWidth = borderWidth;
    label.layer.borderColor = borderColor.CGColor;
    
    return label;
}

- (void)mk_resetTextAlignmentRightandLeft {
    
    CGRect textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil];
    
    CGFloat margin = (self.frame.size.width - textSize.size.width) / (self.text.length - 1);
    
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributeString addAttribute:NSKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1)];
    self.attributedText = attributeString;
}

- (void)mk_resetTextAlignmentLeftRightWithlineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 设置行距
    [paragraphStyle setLineSpacing:lineSpacing];
    // 文本对齐方式 左右对齐（两边对齐）
    paragraphStyle.alignment = NSTextAlignmentJustified;
    
    NSString *text = self.text ?: @"";
    // 设置富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    // 设置段落样式
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    // 设置字体大小
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    // 这段话必须要添加，否则UIlabel两边对齐无效 NSUnderlineStyleAttributeName （设置下划线）
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleNone] range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}


///**
// 左上对齐
// */
//- (void)gp_textAlignmentLeftTop {
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//
//    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12.f], NSParagraphStyleAttributeName:paragraphStyle.copy};
//
//    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(207, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//
//    CGRect dateFrame =CGRectMake(2, 140, CGRectGetWidth(self.frame)-5, labelSize.height);
//    self.frame = dateFrame;
//}


//- (void)textAlignmentTop {
//    CGSize fontSize = [self.text sizeWithFont:self.font];
//
//    double finalHeight = fontSize.height * self.numberOfLines;
//    double finalWidth = self.frame.size.width;    //expected width of label
//
//    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
//
//    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
//
//    for(int i=0; i<= newLinesToPad; i++) {
//        self.text = [self.text stringByAppendingString:@" \n"];
//    }
//}
//
//- (void)textAlignmentBottom {
//    CGSize fontSize = [self.text sizeWithFont:self.font];
//
//    double finalHeight = fontSize.height * self.numberOfLines;
//    double finalWidth = self.frame.size.width;    //expected width of label
//
//    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
//
//    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
//
//    for(int i=0; i< newLinesToPad; i++) {
//        self.text = [NSString stringWithFormat:@" \n%@",self.text];
//    }
//}


@end
