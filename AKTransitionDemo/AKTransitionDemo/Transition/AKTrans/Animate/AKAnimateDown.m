//
//  DismissAnimateDown.m
//  BaseDemo
//
//  Created by ak on 16/11/4.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKAnimateDown.h"

@implementation AKAnimateDown



- (void)animateTransition:(id<UIViewControllerContextTransitioning>)ctx fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView{
    UIView * container= ctx.containerView;
    
    CGRect fromVFrame=[ctx initialFrameForViewController:fromVC];
    
    UIView* bgView=[[UIView alloc]initWithFrame:fromVFrame];
    
    bgView.backgroundColor=[UIColor whiteColor];
    
    UIImageView* imgv=[[UIImageView alloc]initWithFrame:fromVFrame];
    
    UIImage* img= [self capture:toVC.view];
    
    imgv.image=img;
    
    [bgView addSubview:imgv];
    
    [container addSubview:bgView];
    
    [container addSubview:fromView];
    
    
    float duration= [self transitionDuration:ctx];
    
    fromView.t_y=0;
    
    fromView.t_x=0;
    
    [UIView animateWithDuration:duration animations:^{
        
        fromView.t_y=kScreenH;
        
        fromView.t_x=kScreenW;
        
    } completion:^(BOOL finished) {
        
        [ctx completeTransition:!ctx.transitionWasCancelled];
        
    }];
    
}

@end
