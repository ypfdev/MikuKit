//
//  UIViewController+XLBubbleTransition.h
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//  GitHub ：https://github.com/mengxianliang/XLBubbleTransition

#import <UIKit/UIKit.h>
@class XLBubbleTransition;

@interface UIViewController (XLBubbleTransition)<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) XLBubbleTransition *xl_pushTranstion;
@property (nonatomic, strong) XLBubbleTransition *xl_popTranstion;
@property (nonatomic, strong) XLBubbleTransition *xl_presentTranstion;
@property (nonatomic, strong) XLBubbleTransition *xl_dismissTranstion;

@end
