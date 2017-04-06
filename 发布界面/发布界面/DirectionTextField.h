//
//  DirectionTextField.h
//  Notes
//
//  Created by alading on 16/8/19.
//  Copyright © 2016年 叶炯. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  DirectionTextFieldDelegate <NSObject>
-(void)textFieldChangetext:(NSString *)text;
@end
@interface DirectionTextField : UITextField

/**代理*/
@property(nonatomic,assign)id<DirectionTextFieldDelegate> directionDelegate;
@end
