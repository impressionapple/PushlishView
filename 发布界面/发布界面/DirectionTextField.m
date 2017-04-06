//
//  DirectionTextField.m
//  Notes
//
//  Created by alading on 16/8/19.
//  Copyright © 2016年 叶炯. All rights reserved.
//

#import "DirectionTextField.h"
@interface DirectionTextField ()<UIPickerViewDelegate, UIPickerViewDataSource>
@end
@implementation DirectionTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate  = self;
    pickerView.dataSource  =self;
    
    self.inputView = pickerView;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}

// 返回第componet列第row行的标题
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (row == 0) {
        
        self.text = @"买涨";
        return @"买涨";
    }else{
        
        self.text = @"买跌";
        return @"买跌";
    }
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (row==1) {
        if ([self.directionDelegate respondsToSelector:@selector(textFieldChangetext:)]) {
            [self.directionDelegate textFieldChangetext:@"买涨"];
        }
    }else{
        if ([self.directionDelegate respondsToSelector:@selector(textFieldChangetext:)]) {
            [self.directionDelegate textFieldChangetext:@"买跌"];
        }
    }
    
    
}


    





@end
