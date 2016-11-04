//
//  TransVC3.m
//  BaseDemo
//
//  Created by ak on 16/11/4.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "TransVC3.h"

@interface TransVC3 ()
{
     
}
@end

@implementation TransVC3

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
    
    
    self.title=@"Details";
    self.view.backgroundColor=[UIColor darkGrayColor];
    
    ({
        UIButton* btn =  [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        [btn setTitle:@"dismiss" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.center=self.view.center;
        [self.view addSubview:btn];
        
    });
    
    ({
        UIButton* btn =  [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        [btn setTitle:@"push self" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.center=self.view.center;
        btn.t_y=100;
        [self.view addSubview:btn];
        
    });
    
    
}

-(void)presentByGes{
    NSLog(@"presentByGes");
}

-(void)dismissByGes{
    NSLog(@"dismissByGes");
    [self dismiss];
}


-(void)push{
    TransVC3 *vc=TransVC3.new;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dismiss{
    
    AKTransModel* m = AKTransModel.new;
    
    
    
    NSLog(@"dismiss===cur nav:%p presentingViewController:%p  presentedViewController:%p cur vc:%p",self.navigationController,self.presentingViewController,self.presentedViewController,self);
    
    
    if(self.selectedIdx.section==0)
        {
        switch (self.selectedIdx.row){
            case 0:{
                //            crash
                //            [self presentViewController:vc animated:YES completion:nil];
                //                [self dismissViewControllerAnimated:YES completion:nil];
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            }
                break;
            case 1:
            {
                
                
                
                //            [self presentViewController:nav animated:YES completion:nil];
                
                
                //如果利用nav过渡，
                [self.navigationController setTransitionModel:m];
                //way1
                [self dismissViewControllerAnimated:YES completion:nil];
                //way2
                //             [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                
            }
                break;
            case 2:{
                //            crash
                //            [self.navigationController presentViewController:vc animated:YES completion:nil];
                //             [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            }
                break;
            case 3:
            {
                //            [self.navigationController presentViewController:nav animated:YES completion:nil];
                
                
                //如果利用nav过渡，
                [self.navigationController setTransitionModel:m];
                
                //way1
                //[self dismissViewControllerAnimated:YES completion:nil];
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                //way2
                //             [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                
            }
                break;
            default:
                break;
        }
    }
    
    if (self.selectedIdx.section==1) {
        
        switch (self.selectedIdx.row) {
            case 0:{
                //@"present animate",
                
                
            }
                
                break;
            case 1:{
                
                //@"present ges",
                
                }
                
                break;
            case 2:{
                //@"present ges no animate",
                
                
            }
                
                break;
            case 3:{
                
                //@"dismiss animate", DismissAnimateDown
                m.dismissTrans=AKAnimateFade.new;
            }
                
                break;
            case 4:{
                
                //@"dismiss ges",
                m.dismissTrans=AKAnimateTransition.new;
                m.dismissInterTrans=self.transitionModel.dismissInterTrans;
                
            }
                
                break;
            case 5:{
                //@"dismiss ges no animate",
                
            }
                
                break;
                
            default:
                break;
        }
        [self.navigationController setTransitionModel:m];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        
        
    }
} 

@end
