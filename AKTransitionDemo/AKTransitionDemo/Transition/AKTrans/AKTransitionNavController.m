//
//  AKTransitionNavController.m
//  BaseDemo
//
//  Created by ak on 16/10/31.
//  Copyright © 2016年 AK. All rights reserved.
//
#import "ObjcRuntime.h"
#import <objc/runtime.h>
#import "AKTransitionNavController.h"


@interface AKTransitionNavController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
{
    
}
@end

@implementation AKTransitionNavController


- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    UIViewController*toVC=viewControllerToPresent;//self.topViewController; 
    
    if (toVC.transitionModel) {
        toVC.transitioningDelegate=self;
     
    }
    
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    
    if (self.presentedViewController.transitionModel) {
        //设置即将被dismiss的vc
        self.presentedViewController.transitioningDelegate=self;
    }
    
    [super dismissViewControllerAnimated:flag completion:completion];
}



#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    if (presented.transitionModel) {
        AKTransModel* m  =presented.transitionModel;
        m.presentTrans.belongVC=presented;
        return m.presentTrans;
    }
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    //dismiss 可能是vc 也可能是nav
//    if (<#condition#>) {
//        <#statements#>
//    }
//    
    if (dismissed.transitionModel) {
        AKTransModel*  m =dismissed.transitionModel;
        m.dismissTrans.belongVC=dismissed;
        return m.dismissTrans;
    }
    return nil;
    
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    if ([animator isKindOfClass:[AKAnimateTransition class]]) {
            AKAnimateTransition* ani = (AKAnimateTransition*)animator;
            if (!ani.belongVC) {
                return nil;
            }
        AKDragUpInteractive* act = ani.belongVC.transitionModel.preInterTrans;
        if (act.paning) {
            return act;
        }
        
    }
    return nil;
    
}


- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    if ([animator isKindOfClass:[AKAnimateTransition class]]) {
        AKAnimateTransition* ani = (AKAnimateTransition*)animator;
        if (!ani.belongVC) {
            return nil;
        }
        AKInteractive*act= ani.belongVC.transitionModel.dismissInterTrans;
        
        
        if (act.paning) {
            return act;
        }
    }

    return nil;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){
    
    return nil;
    
}


@end

#pragma mark -  UINavigationController(AKTransition)

@implementation UINavigationController(AKTransition)

-(void)presentViewController:(UIViewController *)viewControllerToPresent transition:(AKTransModel*)model animated:(BOOL)flag completion:(void (^)(void))completion{
   
    
    
//    if ([self.navigationController isKindOfClass:[AKTransitionNavController class]]) {
    
//        [viewControllerToPresent setTransitionModel:model];
//        
//        AKTransitionNavController* nav =(AKTransitionNavController*)self.navigationController;
//        
//        [nav presentViewController:viewControllerToPresent animated:flag completion:completion];
//    }
//    else{
//        NSLog(@"navigation 不是AKTransitionNavController类，无法调用present");
//    }
    
    
}

@end


#pragma mark  - UIViewController(AKTransition)

@implementation UIViewController(AKTransition)


static const void *kAKTransModel = &kAKTransModel;

+(void)load{
    swizzleViewController();
}

-(AKTransModel*)transitionModel{
    id result= (AKDragUpInteractive*)objc_getAssociatedObject(self, kAKTransModel);
    return result;
}

-(void)setTransitionModel:(AKTransModel*)model{
    
    objc_setAssociatedObject(self, kAKTransModel,model , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)c_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    
//    if ([self respondsToSelector:@selector(presentingVC)]) {
//        UIViewController* d = [self valueForKey:@"presentingVC"];
//        [d.presentingViewController dismissViewControllerAnimated:YES completion:completion];
//    }
    
    [self c_dismissViewControllerAnimated:flag completion:completion];
    
}

//-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    
  //   [self.presentingViewController dismissViewControllerAnimated:flag completion:completion];
 //}


void swizzleViewController(){
    Class c = [UIViewController class];
    Swizzle(c, @selector(dismissViewControllerAnimated:completion:), @selector(c_dismissViewControllerAnimated:completion:));
    
}

@end






