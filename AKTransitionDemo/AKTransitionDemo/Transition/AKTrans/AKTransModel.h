//
//  AKTransModel.h
//  BaseDemo
//
//  Created by ak on 16/11/3.
//  Copyright © 2016年 AK. All rights reserved.
//

#import <Foundation/Foundation.h>



//Animate Effects
#import "AKAnimateTransition.h"
#import "AKAnimateUper.h"
#import "AKAnimateFade.h"
#import "AKAnimateExplode.h"
#import "AKAnimateDown.h"


//Interactive
#import "AKInteractive.h"
#import "AKDragUpInteractive.h"
#import "AKDragDownInteractive.h"


@interface AKTransModel : NSObject

@property(nonatomic,strong)AKAnimateTransition* presentTrans;

//present interative transition
@property(nonatomic,strong)AKDragUpInteractive  *preInterTrans;


@property(nonatomic,strong)AKAnimateTransition  *dismissTrans;

//dismiss interative transition
@property(nonatomic,strong)AKInteractive  *dismissInterTrans;


@end
