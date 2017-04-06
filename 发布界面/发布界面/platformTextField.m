//
//  platformTextField.m
//  Notes
//
//  Created by alading on 16/8/19.
//  Copyright © 2016年 叶炯. All rights reserved.
//

#import "platformTextField.h"
@interface platformTextField ()<UIPickerViewDelegate, UIPickerViewDataSource>
@end
@implementation platformTextField

-(void)awakeFromNib{
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate  = self;
    pickerView.dataSource =self;
    
    self.inputView = pickerView;
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}

// 返回第componet列第row行的标题
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (row == 0) {
        
        self.text = @"GCT";
        return @"GCT";
    }else if (row == 1){
        self.text = @"赛雷科技";
        return @"赛雷科技";
        
    }else if (row ==2){
        self.text = @"阿拉丁";
        return @"阿拉丁";
    }else if (row == 3){
        self.text = @"基金公司";
        return @"基金公司";
    }else{
        self.text = @"川百合";
        return @"川百合";
    }
    
}


@end
