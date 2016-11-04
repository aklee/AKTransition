//
//  AKInteractive.m
//  BaseDemo
//
//  Created by ak on 16/11/2.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKInteractive.h"
@interface AKInteractive()



@property(nonatomic,strong)id<UIViewControllerContextTransitioning>ctx;

@property(nonatomic,strong)UIView* toView;
@property(nonatomic,strong)UIView* fromView;
@end
@implementation AKInteractive



#pragma mark - Gesture


-(UIPanGestureRecognizer*)configGesture:(UIViewController*)vc getureBlock:(void(^)(void))getureBlock{
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panToPresent:)];
    [vc.view addGestureRecognizer:pan];
    
    self.getureBlock=getureBlock;
    
    return pan;
}


-(void)panToPresent:(UIPanGestureRecognizer*)pan{
  
}

//
//#pragma mark - UIViewControllerInteractiveTransitioning
//-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
////    self.ctx=transitionContext;
////    
////    self.toView= [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
////    
////    self.fromView= [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
////    
////    
////    UIView * container = [transitionContext containerView];
////    
////    [container addSubview:self.fromView];
////    [container addSubview:self.toView];
////    
//    
//    
//    
//}
//- (void)updateInteractiveTransition:(CGFloat)percentComplete{
//    [super updateInteractiveTransition:percentComplete];
//    
//    
//    
//}
//- (void)cancelInteractiveTransition{
//    [super cancelInteractiveTransition];
//    
////    [UIView animateWithDuration:0.25 animations:^{
////        
////        self.fromView.t_y =0;
////        self.fromView.t_x =0;
////    
////        
////    } completion:^(BOOL finished) {
////        //        [self.toView removeFromSuperview];
////        
////        [self.ctx completeTransition:NO];
////    }];
//    
//    
//}
//- (void)finishInteractiveTransition{
//    [super finishInteractiveTransition];
//    
////    [UIView animateWithDuration:0.25 animations:^{
////        
////        
////        self.fromView.t_y = kScreenH;
////        self.fromView.t_x = kScreenW;
////        
////        
////    } completion:^(BOOL finished) {
////        //        [self.toView removeFromSuperview];
////        
////        [self.ctx completeTransition:YES];
////    }];
//    
//    
//    
//}
//
@end
