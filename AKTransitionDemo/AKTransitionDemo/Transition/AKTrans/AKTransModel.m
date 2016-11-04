//
//  AKTransModel.m
//  BaseDemo
//
//  Created by ak on 16/11/3.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "AKTransModel.h"

@implementation AKTransModel
-(void)setPreInterTrans:(AKDragUpInteractive *)preInterTrans{
    _preInterTrans=preInterTrans;
    if (!_presentTrans) {
        //need a default value
        _presentTrans=AKAnimateTransition.new;
    }
}

-(void)setDismissInterTrans:(AKInteractive *)dismissInterTrans{
    _dismissInterTrans=dismissInterTrans;
    if (!_dismissTrans) {
        //need a default value
        _dismissTrans=AKAnimateTransition.new;
    }
}
@end
