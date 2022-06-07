//
//  UIView+MKCategory.m
//  Miku
//
//  Created by 原鹏飞 on 16/6/6.
//  Copyright © 2016年 MikuKit. All rights reserved.
//

#import "UIView+MKCategory.h"
#import <objc/runtime.h>

@implementation UIView (MKCategory)

- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}

- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}

- (void)mk_removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (CGPoint)offsetFromView:(UIView *)otherView {
    CGFloat x = 0, y = 0;
    for (UIView *view = self; view && view != otherView; view = view.superview) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
    }
    return CGPointMake(x, y);
}

#pragma mark -
#pragma mark custom add method
- (UITableViewCell *)tableViewCell{
    UIView *superView = self.superview;
    while (superView != nil && ![superView isKindOfClass:[UITableViewCell class]]) {
        superView = superView.superview;
    }
    return (UITableViewCell *)superView;
}

- (UITableView *)tableView{
    UIView *superView = self.superview;
    while (superView != nil && ![superView isKindOfClass:[UITableView class]]) {
        superView = superView.superview;
    }
    return (UITableView *)superView;
}

- (void)animatedShowShadow{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.fromValue = (id)[[UIColor clearColor] CGColor];
    animation.toValue = (id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6] CGColor];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5;
    [self.layer addAnimation:animation forKey:@"FadeAnimation"];
}

- (void)backgroundColorAnimationOnlayerColor:(UIColor *)color toColor:(UIColor *)toColor{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.fromValue = (id)color.CGColor;
    animation.toValue = (id)toColor.CGColor;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.5;
    [self.layer addAnimation:animation forKey:@"FadeAnimation"];
}

const char *kViewString = "kViewAttachment";
- (NSObject *)attachment {
    return objc_getAssociatedObject(self, kViewString);
}

- (void)setAttachment:(NSObject *)attachment {
    objc_setAssociatedObject(self, kViewString,attachment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Border

- (void)mk_borderWithColor:(UIColor *)color
                     width:(CGFloat)width {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

- (void)mk_debugBorderWithColor:(UIColor *)color
                          width:(CGFloat)width {
#if DEBUG
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
#endif
}

- (void)mk_debugBorderRed {
    [self mk_debugBorderWithColor:[UIColor redColor] width:0.25f];
}

- (void)mk_debugBorderGreen {
    [self mk_debugBorderWithColor:[UIColor greenColor] width:0.25f];
}

- (void)mk_debugBorderBlue {
    [self mk_debugBorderWithColor:[UIColor blueColor] width:0.25f];
}

#pragma mark - Corner

- (void)mk_resetRoundCorner:(UIRectCorner)corners
                     radius:(CGFloat)radius {
    // 使按钮布局立即生效，防止下面拿不到CGSize
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    // 检测半径
    if (radius <= 0) {
        return;
    }
    if (self.bounds.size.height > self.bounds.size.width) {
        if (radius > self.bounds.size.width * 0.5) {
            return;
        }
    } else {
        if (radius > self.bounds.size.height * 0.5) {
            return;
        }
    }
    
    /** Xcode12适用CAShapeLayer切圆角会报建议信息
     x-xcode-debug-views://7fbd970fbb00?DBGViewDebuggerLaunchSessionParameter=7fbd970fbb00 The layer is masked by a `CAShapeLayer` with a path that's a rect, a rounded-rect, or an ellipse. Instead, use an appropriately transformed container layer with `cornerRadius` and `masksToBounds` set.
     */
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
    
//    self.layer.cornerRadius = radius;
//    self.layer.masksToBounds = YES;
}

- (void)mk_resetAllRoundCorner {
    // 使按钮布局立即生效，防止下面拿不到CGSize
    [self setNeedsLayout];
    [self layoutIfNeeded];
    self.layer.cornerRadius = self.bounds.size.height * 0.5;
    self.layer.masksToBounds = YES;
}

- (void)mk_resetRoundCorner:(UIRectCorner)corners {
    // 使按钮布局立即生效，防止下面拿不到CGSize
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    /** Xcode12适用CAShapeLayer切圆角会报建议信息
     x-xcode-debug-views://7fbd970fbb00?DBGViewDebuggerLaunchSessionParameter=7fbd970fbb00 The layer is masked by a `CAShapeLayer` with a path that's a rect, a rounded-rect, or an ellipse. Instead, use an appropriately transformed container layer with `cornerRadius` and `masksToBounds` set.
     */
//    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(self.bounds.size.height * 0.5, self.bounds.size.height * 0.5)];
//    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
//    [shape setPath:rounded.CGPath];
//    self.layer.mask = shape;
    
    self.layer.cornerRadius = self.bounds.size.height * 0.5;
    self.layer.masksToBounds = YES;
}

#pragma mark - Others

- (void)mk_resetVisible:(BOOL)visible {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = visible ? 1 : 0;
    }];
}

- (UIViewController *)mk_currentVC {
    UIResponder* responder = self;
    while (responder != nil && ![responder isKindOfClass:UIViewController.class]) {
        responder = responder.nextResponder;
    }
    return (UIViewController *)responder;
}

- (void)mk_addTapGestureWithTarget:(nullable id)target
                            action:(nullable SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)mk_drawDottedLineOnTargetView:(UIView *)targetView
                               length:(int)length
                              spacing:(int)spacing
                                color:(UIColor *)color
                            direction:(BOOL)isHorizonal {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:targetView.bounds];
    if (isHorizonal) {
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(targetView.frame) / 2, CGRectGetHeight(targetView.frame))];
    } else {
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(targetView.frame) / 2, CGRectGetHeight(targetView.frame)/2)];
    }
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:color.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(targetView.frame)];
    } else {
        [shapeLayer setLineWidth:CGRectGetWidth(targetView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:length], [NSNumber numberWithInt:spacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(targetView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(targetView.frame));
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [targetView.layer addSublayer:shapeLayer];
}

@end
