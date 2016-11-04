//
//  AKInteractive.h
//  BaseDemo
//
//  Created by ak on 16/11/2.
//  Copyright © 2016年 AK. All rights reserved.
//手势过渡驱动

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AKInteractive : UIPercentDrivenInteractiveTransition

@property(nonatomic,assign)bool paning;
@property(nonatomic,copy) void(^getureBlock)(void);

-(UIPanGestureRecognizer*)configGesture:(UIViewController*)vc getureBlock:(void(^)(void))getureBlock;

@end
