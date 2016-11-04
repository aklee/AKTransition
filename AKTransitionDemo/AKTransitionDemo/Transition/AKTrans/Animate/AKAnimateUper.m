//
//  PresentUper.m
//  BaseDemo
//
//  Created by ak on 16/11/4.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKAnimateUper.h"

@implementation AKAnimateUper
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIViewController* toVC= [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //    UIViewController* fromVC= [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    UIView * container= transitionContext.containerView;
    
    UIView* toV=toVC.view;
    
    toV.alpha=0;
    
    [container addSubview:toV];
    
    
    float duration= [self transitionDuration:transitionContext];
   
    toV.t_y=kScreenH;
    
    toV.t_x=kScreenW;
    
    [UIView animateWithDuration:duration animations:^{
    
        toV.alpha=1;
        
        toV.t_y=0;
        
        toV.t_x=0;
    
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}

@end
