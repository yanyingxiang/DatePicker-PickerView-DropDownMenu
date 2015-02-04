//
//  CustomPickerView.m
//  test
//
//  Created by Ryan on 15/1/7.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "CustomPickerView.h"

@implementation CustomPickerView

-(void)setInstanBlock:(InstanBlock)block
{
    if (instanBlock!= block)
    {
        instanBlock = [block copy];
    }
}

-(id)initWithArray:(NSArray *)array CancelButtonTitle:(NSString *)cancelname OtherButtonTitle:(NSString *)otherButtonTitles Feadback:(InstanBlock)block
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)])
    {
        [self setInstanBlock:block];
        _viewFrame = [UIScreen mainScreen].bounds;
        _array = array;
        _item = _array[_array.count/2];

        _view = [[UIView alloc] initWithFrame:CGRectMake(0, _viewFrame.size.height, _viewFrame.size.width, 246)];
        _view.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
        [self addSubview:_view];
        
        if (self.cancelButton == nil)
        {
            self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.cancelButton.frame = CGRectMake(20, 10, 80, 20);
            [self.cancelButton setTitle:cancelname forState:UIControlStateNormal];
            [self.cancelButton setBackgroundColor:[UIColor clearColor]];
            [self.cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self.cancelButton addTarget:self action:@selector(actionSheetViewWillHide) forControlEvents:UIControlEventTouchUpInside];
            [_view addSubview:self.cancelButton];
        }
        
        if (self.confirmButton == nil)
        {
            self.confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.confirmButton.frame = CGRectMake(_viewFrame.size.width - 100, 10, 80, 20);
            [self.confirmButton setTitle:otherButtonTitles forState:UIControlStateNormal];
            [self.confirmButton setBackgroundColor:[UIColor clearColor]];
            [self.confirmButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self.confirmButton addTarget:self action:@selector(actionSheetViewWillFeedBackData) forControlEvents:UIControlEventTouchUpInside];
            [_view addSubview:self.confirmButton];
        }
        
        if (self.pickerView == nil)
        {
            self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, _viewFrame.size.width, 216)];
            self.pickerView.delegate = self;
            self.pickerView.dataSource = self;
            self.pickerView.showsSelectionIndicator = YES;
            self.pickerView.backgroundColor = [UIColor redColor];
            [self.pickerView selectRow:array.count/2 inComponent:0 animated:NO];

            [_view addSubview:self.pickerView];
            
        }
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, _viewFrame.size.width, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        [_view addSubview:lineView];
        
        _control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, _viewFrame.size.width, _viewFrame.size.height - 236)];
        _control.backgroundColor = [UIColor clearColor];
        _control.alpha = 1.0;
        [_control addTarget:self action:@selector(actionSheetViewWillHide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_control];
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _view.frame = CGRectMake(0, _viewFrame.size.height - 246, _viewFrame.size.width, 246);
        }];
    }
    
    [self makeKeyWindow];
    self.hidden = NO;
    
    return self;
}

- (void)actionSheetViewWillFeedBackData
{
    [UIView animateWithDuration:0.5 animations:^{
        
        _view.frame = CGRectMake(0, _viewFrame.size.height, _viewFrame.size.width, 236);
        
    }completion:^(BOOL finished) {
        
        [self resignKeyWindow];
        self.hidden = YES;
    }];
    
    if (instanBlock)
    {
        instanBlock(_item);
    }
    NSLog(@"confirm");
    
}

-(void)actionSheetViewWillHide
{
    [UIView animateWithDuration:0.5 animations:^{
        
        _view.frame = CGRectMake(0, _viewFrame.size.height, _viewFrame.size.width, 236);
        
    }completion:^(BOOL finished) {
        
        [self resignKeyWindow];
        self.hidden = YES;
        
    }];
    NSLog(@"cancle");
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _array.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return _array[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    _item = _array[row];
    NSLog(@"selectedrow = %@", _array[row]);
}
@end
