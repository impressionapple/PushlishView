//
//  MethodFiled.m
//  Notes
//
//  Created by alading on 16/8/16.
//  Copyright © 2016年 叶炯. All rights reserved.
//

#import "MethodFiled.h"
@interface MethodFiled () <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>


//@property (nonatomic, strong) NSMutableArray *provinces;
@property (nonatomic, weak) UIPickerView *pickerView;
@property (nonatomic, assign) NSInteger proIndex;
@property (nonatomic, strong) NSMutableArray *kinds;

@end

@implementation MethodFiled

//懒加载种类
-(NSMutableArray *)kinds{
    if (_kinds == nil) {
       
        
        NSArray *kindArray1 = @[@"USDCHF",@"EURGBP",@"NZDUSD",@"EURUSD",@"USDCAD",@"USDJPY",@"USOil",@"UKOil",@"USDHKD",@"AUDUSD",@"GBPUSD",@"USDSGD"];
        NSString *kindName1 = @"外汇";
        NSDictionary *kindDic1 = @{@"kindArray":kindArray1,@"kindName":kindName1};
        
        NSArray *kindArray2 = @[@"XAGUSD"];
        NSString *kindName2 = @"贵金属";
        NSDictionary *kindDic2 = @{@"kindArray":kindArray2,@"kindName":kindName2};
        _kinds =  [NSMutableArray arrayWithObjects:kindDic1,kindDic2, nil];
        
    }
    
    return _kinds;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUpCityKeyboard];
    self.delegate  = self;
}

- (void)setUpCityKeyboard
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    _pickerView = pickerView;
    
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    self.inputView = pickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) { // 描述大类别
        
        return self.kinds.count;
        
    }else{ // 描述所选的具体的项目
        
        NSDictionary *p = self.kinds[_proIndex];
        NSArray *kindArray = [p objectForKey:@"kindArray"];
        return kindArray.count;
        
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) { // 描述大类别
        
        // 描述大类别
        NSDictionary *p = self.kinds[row];
        return [p  objectForKey:@"kindName"];
      
        
    }else{ // 描述所选的具体的项目
        
        // 获取选中省会
        NSDictionary *p = self.kinds[_proIndex];
        NSArray *kindArray = [p objectForKey:@"kindArray"];
        return kindArray[row];
    }
}

// 滚动UIPickerView就会调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) { // 滚动省会,刷新城市（1列）
        
        // 记录当前选中的大分类
        _proIndex = [pickerView selectedRowInComponent:0];
        
        // 刷新第二组数据
        [pickerView reloadComponent:1];
        
    }
    
   NSDictionary *p = self.kinds[_proIndex];
//   NSString *kindName = [p objectForKey:@"kindName"];
    
    
    // 获取选中的类型
    NSInteger kindIndex = [pickerView selectedRowInComponent:1];
    NSArray *kindArray = [p objectForKey:@"kindArray"];
    NSString *Name = kindArray[kindIndex];
//    self.text = [NSString stringWithFormat:@"%@ %@",kindName,Name];
    self.text = [NSString stringWithFormat:@"%@",Name];

}

// 文本框开始编辑的时候调用(刚开始的时候选中)
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   [self pickerView:_pickerView didSelectRow:0 inComponent:0];
    
}




@end
