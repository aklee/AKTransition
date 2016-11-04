//
//  TransVC1.m
//  BaseDemo
//
//  Created by ak on 16/10/31.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "TransVC1.h"
#import "TransVC2.h"
#import "TransVC3.h"
#import "AKTransModel.h"

@interface TransVC1 ()<UITableViewDelegate,UITableViewDataSource>
{
    AKDragUpInteractive* act;
    AKAnimateTransition* curAni;
    NSString* gesStr;
    NSArray* titleArr;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tb;

@property (weak, nonatomic) IBOutlet UILabel *tipLb;

@end

@implementation TransVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.type==0) {
        
        titleArr=@[
                   
                   @[
                       @"present DEMO",
                       
                       ],
                   
                   @[
                       @"dismiss DEMO",
                       
                       ],
                   @[
                       @"my test"
                       ]
                   
                   
                   
                   ];
    }
    if (self.type==1) {
        
        //present DEMO
        self.tb.scrollEnabled=NO;
        titleArr=@[
                   
                   @[
                       @"system",
                       @"Uper",
                       @"fade",
                       @"explode",
                       @"apply to gesture 加入到手势",//
                       @"Present!"
                       ]
                   
                   ];
        
    }
    if (self.type==2) {
        
        //dismiss DEMO
        self.tb.scrollEnabled=NO;
        titleArr=@[
                   
                   @[
                       @"system",
                       @"Uper",
                       @"fade",
                       @"explode",
                       @"push self",
                       @"apply to gesture 加入到手势",
                       @"Dismiss!"
                       ]
                   ];
        
    }
    
    if (self.type==9) {
        //test
        titleArr=@[@[
                       @"vc present vc ->crash" ,
                       @"vc present nav ->no transition",
                       @"nav present vc ->crash",
                       @"nav present nav",
                       @"dismiss self"
                       ],
                   
                   @[
                       @"present animate",
                       @"present ges",
                       @"present ges no animate",
                       
                       @"dismiss animate",
                       @"dismiss ges",
                       @"dismiss ges no animate",
                       ],
                   ];
    }
    if (!self.title) {
        self.title=[NSString stringWithFormat:@"DEMO -%lu",self.navigationController.viewControllers.count];
        
    }
    
    self.view.backgroundColor=UIColor.whiteColor;
    
}

-(void)presentByGes{
    
    TransVC2* vc=[TransVC2 new];
    
    AKTransModel* m =AKTransModel.new;
    
    //设置vc的过渡效果
    m.presentTrans=AKAnimateTransition.new;
    
    //设置手势交互
    m.preInterTrans=act;
    
    //demo1
    AKTransitionNavController* nav=[[AKTransitionNavController alloc]initWithRootViewController:vc];
    [nav setTransitionModel:m];
    NSLog(@"present===cur nav:%p present nav:%p",self.navigationController,nav);
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}
-(void)push{
    
    TransVC1* vc=[TransVC1 new];
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark  - tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return titleArr.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"----";
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* arr=titleArr[section];
    return arr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:@"dd"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"dd"];
    }
    if(self.type==1){
        cell.contentView.backgroundColor=[UIColor darkGrayColor];
        
    }
        
    NSArray* arr= titleArr[indexPath.section];
    
    [cell.textLabel setText:arr[indexPath.row]];
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger sec = indexPath.section;
    NSInteger row =indexPath.row;
    
    
    if (self.type==0) {
     
        
        TransVC1* vc=[TransVC1 new];
        
        switch (sec) {
            case 0:
            {
                vc.type=1;
                
                [self.navigationController pushViewController:vc animated:YES];
                

            }   break;
            case 1:
            {
                vc.type=2;
                
                AKTransitionNavController* nav=[[AKTransitionNavController alloc]initWithRootViewController:vc];
                [self.navigationController presentViewController:nav animated:YES completion:nil];
            }

                break;
            case 2:
                vc.type=9;
                [self.navigationController pushViewController:vc animated:YES];
                

                break;
                
            default:
                break;
        }
        
           }
    if (self.type==1&&sec==0) {
        [self presentRow:row sec:sec];
        return;
        
    }
    
    if (self.type==2&&sec==0) {
        [self dismissRow:row sec:sec];
        return;
        
    }
    
    
    if (self.type==9&&sec==0) {
        
        [self test:row sec:sec];
        return;
        
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


//present DEMO
-(void)presentRow:(NSInteger)row sec:(NSInteger)sec{
    
    
    /*
     @"system",
     @"Uper",
     @"fade",
     @"explode",
     @"apply to gesture"//添加手势
     */
//    TransVC3* detail =[TransVC3 new];
    TransVC1* detail =[TransVC1 new];
    detail.type=2;
    detail.title=@"Dismiss DEMO";
    AKTransModel* m =[AKTransModel new];
    AKTransitionNavController * nav =[[AKTransitionNavController alloc]initWithRootViewController:detail];
    switch (row) {
        case 0:
        {
            curAni=nil;
        }
            break;
        case 1:
        {
            
            curAni=AKAnimateUper.new;
        }
            break;
        case 2:
        {
            curAni=AKAnimateFade.new;
        }
            break;
        case 3:
        {
            curAni=AKAnimateExplode.new;
        }
            break;
        case 4:
        {
            
            
            AKDragUpInteractive * inter = AKDragUpInteractive.new;
            
            [inter configGesture:self getureBlock:^{
                [self.navigationController presentViewController:nav animated:YES completion:nil];
                
            }];
            if(!curAni)curAni=AKAnimateTransition.new;
            m.presentTrans=curAni;
            m.preInterTrans=inter;
            
            nav.transitionModel= m;
            
            gesStr=NSStringFromClass([m.presentTrans class]);
            self.tipLb.text=[NSString stringWithFormat:@"click:%@\n gesture:%@",            NSStringFromClass(curAni.class),gesStr];
            
            return;
            
        }
            break;
        case 5:
        {
            
            m.presentTrans=curAni;
            nav.transitionModel= m;

            [self.navigationController presentViewController:nav animated:YES completion:nil];
            
        }
            break;
        default:
            break;
    }
    
    self.tipLb.text=[NSString stringWithFormat:@"click:%@\n gesture:%@",            NSStringFromClass(curAni.class),gesStr];
    
}



-(void)dismissRow:(NSInteger)row sec:(NSInteger)sec{
    
    /*
     @"system",
     @"Uper",
     @"fade",
     @"explode",
     @"apply to gesture"//添加手势
     */
    
    AKTransModel* m =[AKTransModel new];
    
    switch (row) {
        case 0:
        {
            curAni=nil;
        }
            break;
        case 1:
        {
            //            m.presentTrans=PresentAnimateUper.new;
            curAni=AKAnimateDown.new;
        }
            break;
        case 2:
        {
            curAni=AKAnimateFade.new;
        }
            break;
        case 3:
        {
            curAni=AKAnimateExplode.new;
        }
            break;
        case 4:
        {
            TransVC1* vc=[TransVC1 new];
            vc.type=self.type;
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
        case 5:{
            
            
            
            
            AKInteractive * inter = AKDragDownInteractive.new;
            
            [inter configGesture:self.navigationController getureBlock:^{
                
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                
            }];
            
            m.dismissTrans=curAni;
            
            m.dismissInterTrans=inter;
            
            self.navigationController.transitionModel= m;
            
            
            
            return;
        }
            break;
        case 6:{
            
            m.dismissTrans=curAni;
            self.navigationController.transitionModel= m;
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            
        }
            break;
            
        default:
            break;
    }
    
}


-(void)test:(NSInteger)row sec:(NSInteger)sec{
    
   NSIndexPath* idx= [NSIndexPath indexPathForRow:row inSection:sec];
    
    if (sec==0) {
        
        AKTransModel* m =AKTransModel.new;
        
        TransVC3 * vc=[TransVC3 new];
        
        vc.selectedIdx=idx;
        
        
        
        AKTransitionNavController * nav=  [[AKTransitionNavController alloc]initWithRootViewController:vc];
        
        
        //设置vc的过渡效果
        m.presentTrans=AKAnimateTransition.new;
        
        //设置手势交互
        m.preInterTrans=act;
        
        nav.transitionModel=m;
        
        switch (row) {
            case 0:{
                //            crash
                //            [self presentViewController:vc animated:YES completion:nil];
                
            }
                break;
            case 1:
            {
                
                //直接调用uiviewcontroll presentViewController 方法
                [self presentViewController:nav animated:YES completion:nil];
            }
                break;
            case 2:{
                //            crash
                //            [self.navigationController presentViewController:vc animated:YES completion:nil];
                
            }
                break;
            case 3:
            {
                //todo: why
                //调用navigation presentViewController方法
                //然后调用uiviewcontroll presentViewController方法
                //因为animate delegate在navigation中处理， 所以case1 无转场动画
                [self.navigationController presentViewController:nav animated:YES completion:nil];
            }
            case 4:
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                
                break;
            default:
                break;
        }
    }
    
    
    if(sec==1){
        /*
         @"present animate",
         @"present ges",
         @"present ges no animate",
         
         @"dismiss animate",
         @"dismiss ges",
         @"dismiss ges no animate",
         */
        
        
        
        AKTransModel* m =AKTransModel.new;
        
        TransVC2 * vc=[TransVC2 new];
        
        vc.selectedIdx=idx;
        
        NSArray* arr=titleArr[sec];
        
        vc.title=arr[row];
        
        
        if(row == 1){
            //@"present ges",
            
            //在vc上设置手势交互
            m.preInterTrans=AKDragUpInteractive.new;
            
            vc.transitionModel=m;
            
        }
        
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    
    if (sec==2) {
        
        TransVC1* presentDEMOVC= TransVC1.new;
        presentDEMOVC.type=1;
        [self.navigationController pushViewController:presentDEMOVC animated:YES];
        
    }
    if (sec==3) {
        //dismiss DEMO
        
        TransVC1* dismissDemoVC= TransVC1.new;
        dismissDemoVC.type=2;
        
        AKTransitionNavController * nav=[[AKTransitionNavController alloc]initWithRootViewController:dismissDemoVC];
        //        [self.navigationController pushViewController:dismissDemoVC animated:YES];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
        
    }
}
@end
