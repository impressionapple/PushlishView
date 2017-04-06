//
//  DateTextField.m
//  04-键盘处理
//
//  Created by alading on 16/8/19.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "DateTextField.h"

@implementation DateTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    // 创建UIDatePicker
    // 注意：UIDatePicker有默认的尺寸，可以不用设置frame
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    
    
    // 设置地区 zh:中国
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    // 设置日期的模式
    picker.datePickerMode = UIDatePickerModeDateAndTime;
    
    // 监听UIDatePicker的滚动
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    
    self.inputView = picker;
    
}

- (void)dateChange:(UIDatePicker *)datePicker
{
   

    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    
    self.text = dateStr;
}





@end
