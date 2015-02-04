//
//  CustomPickerView.h
//  test
//
//  Created by Ryan on 15/1/7.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InstanBlock)(id data);

@interface CustomPickerView : UIWindow <UIPickerViewDelegate, UIPickerViewDataSource>
{
    InstanBlock instanBlock;
}
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *confirmButton;

@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *array;

@property (strong, nonatomic) NSString *item;
@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIControl *control;

@property (assign, nonatomic) CGRect viewFrame;

//实例回调block
-(void)setInstanBlock:(InstanBlock)block;

-(id)initWithArray:(NSArray *)array CancelButtonTitle:(NSString *)cancelname OtherButtonTitle:(NSString *)otherButtonTitles Feadback:(InstanBlock)block;

- (void)actionSheetViewWillFeedBackData;
- (void)actionSheetViewWillHide;
@end
