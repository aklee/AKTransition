//
//  PresentAnimateFade.m
//  BaseDemo
//
//  Created by ak on 16/11/4.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKAnimateFade.h"

@implementation AKAnimateFade


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIViewController* toVC= [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromVC= [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect initframe= [transitionContext initialFrameForViewController:fromVC];
    
    UIView * container= transitionContext.containerView;
    
    
    UIView* fromV=fromVC.view;
    
    UIView* toV=toVC.view;
    
    toV.alpha=0;
    
    toV.frame=initframe;
    
    [container addSubview:fromV];
    
    [container addSubview:toV];
    
    float duration= [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
     
        toV.alpha=1;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}

@end

