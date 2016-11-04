//
//  TransVC2.m
//  BaseDemo
//
//  Created by ak on 16/10/31.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "TransVC2.h"
#import "TransVC1.h"
#import "TransVC3.h"
#import "AKTransitionNavController.h"
@interface TransVC2 ()
{
    AKDragUpInteractive* preAct;
    
    AKInteractive* disAct;
    
}
@end

@implementation TransVC2


- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof (self)ws= self;
    
    AKTransModel*  m =  self.transitionModel;
    if (m.preInterTrans) {
       UIGestureRecognizer*ges= [m.preInterTrans configGesture:self getureBlock:^{
            [ws presentByGes];
        }];
        [self.view addGestureRecognizer:ges];
    }
    
    if(m.dismissInterTrans){
       UIGestureRecognizer* ges= [m.dismissInterTrans configGesture:self getureBlock:^{
            [ws dismissByGes];
        }];
        [self.view addGestureRecognizer:ges];
    }
    
    
    
    self.view.backgroundColor=[UIColor lightGrayColor ];
    
    UIButton* btn =  [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.center=self.view.center;
    
    
    [self.view addSubview:btn];
    
}
-(void)presentByGes{
    [self present];
}

-(void)dismissByGes{
    NSLog(@"dismissByGes");
}


-(void)present {
    
    AKTransModel* m = AKTransModel.new;
    TransVC3*vc=TransVC3.new;
    vc.selectedIdx=self.selectedIdx;
    AKTransitionNavController*nav=[[AKTransitionNavController alloc]initWithRootViewController:vc];
    
    
    switch (self.selectedIdx.row) {
        case 0:{
            //@"present animate",
            //设置vc的过渡效果
            m.presentTrans=AKAnimateExplode.new;
            
            [nav setTransitionModel:m];
            
        }
            
            break;
        case 1:{
            
            //@"present ges",
            
            m.presentTrans=AKAnimateTransition.new;
            m.preInterTrans=self.transitionModel.preInterTrans;
            
            
            [nav setTransitionModel:m];
        }
            
            break;
        case 2:{
            //@"present ges no animate",
          
            
        }
            
            break;
        case 3:{
            
            //@"dismiss animate",
            m.dismissTrans=AKAnimateTransition.new;
            
            
            [nav setTransitionModel:m];
        }
            
            break;
        case 4:{
            
            //@"dismiss ges",
            m.dismissInterTrans=AKInteractive.new;
            vc.transitionModel=m;
        }
            
            break;
        case 5:{
            //@"dismiss ges no animate",
            
        }
            
            break;
            
        default:
            break;
    }
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
    

}


 
@end
