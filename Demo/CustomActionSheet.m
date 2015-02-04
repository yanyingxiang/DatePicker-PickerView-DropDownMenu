//
//  CustomActionSheet.m
//  DataPicker
//
//  Created by Ryan on 14/11/24.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import "CustomActionSheet.h"

@implementation CustomActionSheet

-(void)setInstanBlock:(InstanBlock)block
{
    if (instanBlock!= block)
    {
        instanBlock = [block copy];
    }
}

-(id)initWithCancelButtonTitle:(NSString *)cancelname OtherButtonTitle:(NSString *)otherButtonTitles Feadback:(InstanBlock)block
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)])
    {
        [self setInstanBlock:block];
        _viewFrame = [UIScreen mainScreen].bounds;

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

        if (self.dataPicker == nil)
        {
            self.dataPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 30, _viewFrame.size.width, 216)];
            self.dataPicker.datePickerMode = UIDatePickerModeDateAndTime;
            self.dataPicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
            [_view addSubview:self.dataPicker];
            self.date = self.dataPicker.date;
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

- (NSDate *)actionSheetViewWillFeedBackData
{
    [UIView animateWithDuration:0.5 animations:^{
        
        _view.frame = CGRectMake(0, _viewFrame.size.height, _viewFrame.size.width, 236);
        
    } completion:^(BOOL finished) {
        
        [self resignKeyWindow];
        self.hidden = YES;
        
    }];
    
    if (instanBlock)
    {
        instanBlock(self.date);
    }
    NSLog(@"confirm");

    return self.date;
}

-(void)actionSheetViewWillHide
{
    [UIView animateWithDuration:0.3 animations:^{
        
        _view.frame = CGRectMake(0, _viewFrame.size.height, _viewFrame.size.width, 236);
        
    } completion:^(BOOL finished) {
        
        [self resignKeyWindow];
        self.hidden = YES;
        
    }];
    
    NSLog(@"cancle");
}

@end
