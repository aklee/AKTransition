//
//  AKPresentTransition.m
//  BaseDemo
//
//  Created by ak on 16/10/31.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKAnimateTransition.h"
#import "UIView+AK.h"
@interface AKAnimateTransition()

@end

@implementation AKAnimateTransition


#pragma mark  - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    
    UIViewController* toVC= [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    UIViewController* fromVC= [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView* toV=toVC.view;
    
    UIView* fromV=fromVC.view;
    
    
    [self animateTransition:transitionContext fromVC:fromVC toVC:toVC fromView:fromV toView:toV];
    
    
}



- (void)animateTransition:(id<UIViewControllerContextTransitioning>)ctx fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
    float duration= [self transitionDuration:ctx];
    
    UIView * container= ctx.containerView;
    
    toView.alpha=0;
   
    [container addSubview:toView];
    
    
    toView.t_y=kScreenH;
    
    [UIView animateWithDuration:duration animations:^{
        
        toView.alpha=1;
        
        toView.t_y=0;
        
    } completion:^(BOOL finished) {
        //需要把最终的view留在container上 否则黑屏
        
        NSLog(@"transitionContext.transitionWasCancelled :%@",@(ctx.transitionWasCancelled));
        
        [ctx completeTransition:!ctx.transitionWasCancelled];
    }];

}



-(UIImage*)capture:(UIView *)view{
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage*img =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
    
}


@end
