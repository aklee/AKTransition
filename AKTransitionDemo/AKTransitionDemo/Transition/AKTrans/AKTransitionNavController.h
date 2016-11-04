//
//  AKTransitionNavController.h
//  BaseDemo
//
//  Created by ak on 16/10/31.
//  Copyright © 2016年 AK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AKTransModel.h"

@protocol AKTransDelegate<NSObject>

-(void)dismiss;

@end


@interface AKTransitionNavController : UINavigationController
 
@end

@interface UINavigationController(AKTransition)


@end

@interface UIViewController(AKTransition)

-(AKTransModel*)transitionModel;

-(void)setTransitionModel:(AKTransModel*)model;


@end
