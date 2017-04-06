//
//  ViewController.m
//  发布界面
//
//  Created by alading on 2017/1/20.
//  Copyright © 2017年 liwenquan. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+UITouch.h"
#import "UIView+SDAutoLayout.h"
static const int Ksheight  = 40;
#define kHeight  [UIScreen mainScreen].bounds.size.height
#define kWidth   [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIScrollView *superView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeSuperView];
    [self initializeSubView];
    
//    _superView= [[UIScrollView alloc]init];
//    _superView.frame = CGRectMake(0, 0, 200, 200);
//    _superView.backgroundColor = [UIColor redColor];
//    _superView.contentSize =  CGSizeMake(300, 300);// 滚动的界面
    
//    [self.view addSubview:_superView];
//    UIView *view = [[UIView alloc]init];
//    view.frame = CGRectMake(0, 0, 50, 50);
//    view.backgroundColor = [UIColor yellowColor];
//    [_scrollView addSubview:view];
    
    
}

-(void)initializeSuperView{
    
    _superView= [[UIScrollView alloc]init];
    _superView.backgroundColor = [UIColor redColor];
    _superView.frame = CGRectMake(0, 0,kWidth,kHeight);
    _superView.contentSize = CGSizeMake(0, 800);
    _superView.userInteractionEnabled = YES;
    self.view.userInteractionEnabled = YES;
    [self.view addSubview:_superView];

}

-(void)initializeSubView{
    
    UITextField *filed1 = [[UITextField alloc]init];
    filed1.tag =0;
    [self createTextfiledAndLabel:@"策略类型:" withflied:filed1];
    
    UITextField *filed2 = [[UITextField alloc]init];
    filed2.tag =1;
    [self createTextfiledAndLabel:@"策略类型:" withflied:filed2];
    
    
    UITextField *filed3 = [[UITextField alloc]init];
    filed3.tag =2;
    [self createTextfiledAndLabel:@"策略类型:" withflied:filed3];
    
    
    UITextField *filed4 = [[UITextField alloc]init];
    filed4.tag =3;
    [self createTextfiledAndLabel:@"策略类型:" withflied:filed4];
    
    
    UITextField *filed5 = [[UITextField alloc]init];
    filed5.tag =4;
    [self createTextfiledAndLabel:@"策略类型:" withflied:filed5];
    
    UITextField *filed6 = [[UITextField alloc]init];
    filed6.tag =5;
    [self createTextfiledAndLabel:@"策略类型:" withunitlabel:@"点" withflied:filed6];
    UITextField *filed7 = [[UITextField alloc]init];
    filed7.tag =6;
    [self createTextfiledAndLabel:@"策略类型:" withunitlabel:@"点" withflied:filed7];
    
    
    
    
  
}

// 布局
-(void)createTextfiledAndLabel:(NSString*)labeltitle withflied:(UITextField*)filed{
   
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor grayColor];
    [_superView addSubview:view];
    view.frame = CGRectMake(0, filed.tag*Ksheight+10, kWidth, Ksheight-5);
    UILabel *label = [[UILabel alloc]init];
    label.text = labeltitle;
    [view addSubview:label];
  
    filed.backgroundColor  =[UIColor yellowColor];
    filed.delegate = self;
    [view addSubview:filed];
    
    //布局
    label.sd_layout
    .topEqualToView(view)
    .bottomEqualToView(view)
    .leftSpaceToView(view,8.0f)
    .widthIs(80.0f);
    
    filed.sd_layout
    .topEqualToView(view)
    .bottomEqualToView(view)
    .leftSpaceToView(label,0.0f)
    .rightSpaceToView(view,8.0f);
    
}

-(void)createTextfiledAndLabel:(NSString*)labeltitle withunitlabel:(NSString *)unittitle withflied:(UITextField*)filed{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor grayColor];
    [_superView addSubview:view];
    view.frame = CGRectMake(0, filed.tag*Ksheight+10, kWidth, Ksheight-5);
    UILabel *label = [[UILabel alloc]init];
    label.text = labeltitle;
    [view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = unittitle;
    [view addSubview:label2];
    
    
    filed.backgroundColor  =[UIColor yellowColor];
    filed.delegate = self;
    [view addSubview:filed];
    
    //布局
    label.sd_layout
    .topEqualToView(view)
    .bottomEqualToView(view)
    .leftSpaceToView(view,8.0f)
    .widthIs(80.0f);
    
    label2.sd_layout
    .topEqualToView(view)
    .bottomEqualToView(view)
    .rightSpaceToView(view,8.f)
    .widthIs(20.0f);
    
    filed.sd_layout
    .topEqualToView(view)
    .bottomEqualToView(view)
    .leftSpaceToView(label,0.0f)
    .rightSpaceToView(label2,0.0f);
    
    
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 0) {
        
    }else if (textField.tag ==1){
        
    }else if (textField.tag ==2){
        CGPoint offset = CGPointMake(0, self.superView.contentOffset.x+100);
        [self.superView setContentOffset:offset animated:YES];
    }else if (textField.tag ==3){
        
    }else if (textField.tag ==4){
        
    }else if (textField.tag ==5){
        
    }
    
}





















@end
