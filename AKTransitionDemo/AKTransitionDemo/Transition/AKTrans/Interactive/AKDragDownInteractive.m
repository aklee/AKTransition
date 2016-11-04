//
//  AKDragDownInteractive
//  BaseDemo
//
//  Created by ak on 16/11/2.
//  Copyright © 2016年 AK. All rights reserved.


#import "AKDragDownInteractive.h"
#import "UIView+AK.h"
@interface AKDragDownInteractive()
 @end
@implementation AKDragDownInteractive



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
    
    
    float rate =0;
    
    rate = 1-(fabs(pointInView.y)/kScreenH);
    
    if(pointMoved.y<0)return;
    
    NSLog(@"%f   %f  moved:%f",rate,pointInView.y,pointMoved.y);
    
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            
            if (pointMoved.y<0) {
                //drag up
                self.paning=NO;
                pan.cancelsTouchesInView=YES;
                break;
            }
            self.paning=YES;
            if(self.getureBlock){
                self.getureBlock();
            }
            
            
            
            NSLog(@"began");
            
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

 @end
