//
//  AKDragUpInteractive.m
//  BaseDemo
//
//  Created by ak on 16/11/2.
//  Copyright © 2016年 AK. All rights reserved.
// Present 手势驱动过渡类

#import "AKDragUpInteractive.h"
#import "UIView+AK.h"
@interface AKDragUpInteractive()
 
@end
@implementation AKDragUpInteractive



#pragma mark - Gesture

-(UIPanGestureRecognizer*)configGesture:(UIViewController*)vc getureBlock:(void(^)(void))getureBlock{
    
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panToPresent:)];
    [vc.view addGestureRecognizer:pan];
    
    self.getureBlock=getureBlock;
    return pan;
}


-(void)panToPresent:(UIPanGestureRecognizer*)pan{
    UIGestureRecognizerState state= pan.state;
    
    CGPoint pointInView= [pan locationInView:pan.view];
    
    CGPoint pointMoved=     [pan translationInView:pan.view];
    [pan setTranslation:CGPointZero inView:pan.view];
    
    
   
    float rate = 0;
    
    rate = (kScreenH-pointInView.y)/kScreenH;
    
    
    NSLog(@"%f   %f  moved:%f",rate,pointInView.y,pointMoved.y);
   
    
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            
            //            NSLog(@"began");
            
            if(pointMoved.y>0){
                //drag down
                self.paning=NO;
                pan.cancelsTouchesInView=YES;
                return;
            }

            
            self.paning=YES;
            if(self.getureBlock){
                self.getureBlock();
            }
            
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
            
            if (!self.paning) {
                break;
            }
            
            [self updateInteractiveTransition:rate];
            
            
            if (rate>0.5) {
                pan.cancelsTouchesInView=YES;
            }
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"END");
            
            if (!self.paning) {
                break;
            }
            
            if (rate>0.5) {
                [self finishInteractiveTransition];
                
            }
            else{
                [self cancelInteractiveTransition];
            }
            
            self.paning = NO;
            
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            
            NSLog(@"Cancelled");
            if (!self.paning) {
                break;
            }
            
            [self cancelInteractiveTransition];
            
            self.paning = NO;
        }
            break;
            
        default:
        {
            
        }
            break;
    }
    
    
}



//
//#pragma  mark - UIViewControllerInteractiveTransitioning
//- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
//    
////    NSLog(@"startInteractiveTransition");
//    
//    self.ctx = transitionContext;
//    
//    
//    UIViewController* tovc=  [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    
//    
//    //    UIViewController* fromvc=  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    
//    
//    
//    self.toView=tovc.view;
//    
//    
//    UIView* container=  [transitionContext containerView];
//    
//    
//    [container addSubview: self.toView];
//    
//    
//    self.toView.t_y=kScreenH;
//    
//}
//
//
//#pragma mark - UIPercentDrivenInteractiveTransition
//
//- (void)updateInteractiveTransition:(CGFloat)percentComplete{
////    NSLog(@"updateInteractiveTransition %f",percentComplete);
//    [super updateInteractiveTransition:percentComplete];
//    float percent =(1-percentComplete);
//    
//    self.toView.t_y = kScreenH*percent;
//    
//    
//}
//- (void)cancelInteractiveTransition{
////    NSLog(@"cancelInteractiveTransition");
//    [super cancelInteractiveTransition];
//    
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        self.toView.t_y =kScreenH;
//        
//        
//    } completion:^(BOOL finished) {
//        //        [self.toView removeFromSuperview];
//        
//        [self.ctx completeTransition:NO];
//    }];
//    
//    
//}
//- (void)finishInteractiveTransition{
////    NSLog(@"finishInteractiveTransition");
//    [super finishInteractiveTransition];
//    
//    [UIView animateWithDuration:0.25 animations:^{
//        
//        self.toView.t_y =0;
//        
//        
//    } completion:^(BOOL finished) {
//        //        [self.toView removeFromSuperview];
//        
//        [self.ctx completeTransition:YES];
//    }];
//    
//}
//
//

@end
