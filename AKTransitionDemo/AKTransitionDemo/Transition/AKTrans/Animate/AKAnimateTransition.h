//
//  AKPresentTransition.h
//  BaseDemo
//
//  Created by ak on 16/10/31.
//  Copyright © 2016年 AK. All rights reserved.
//  Present动画过渡

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AKAnimateTransition : NSObject<UIViewControllerAnimatedTransitioning>


@property(nonatomic,strong)UIViewController* belongVC;




- (void)animateTransition:(id<UIViewControllerContextTransitioning>)ctx fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView;


-(UIImage*)capture:(UIView *)view;


@end
