//
//  CustomActionSheet.h
//  DataPicker
//
//  Created by Ryan on 14/11/24.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InstanBlock)(id date);

@interface CustomActionSheet : UIWindow
{
    InstanBlock instanBlock;
}
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *confirmButton;
@property (strong, nonatomic) UIDatePicker *dataPicker;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIControl *control;

@property (assign, nonatomic) CGRect viewFrame;

//实例回调block
-(void)setInstanBlock:(InstanBlock)block;

- (id)initWithCancelButtonTitle:(NSString *)cancelname OtherButtonTitle:(NSString *)otherButtonTitles Feadback:(InstanBlock)block;
- (NSDate *)actionSheetViewWillFeedBackData;
- (void)actionSheetViewWillHide;

@end
