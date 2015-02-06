//
//  ViewController.m
//  Demo
//
//  Created by Ryan on 15/1/20.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *button1;
    UIButton *button2;
    UIButton *titleButton;
    CustomActionSheet *actionSheet;
    CustomPickerView *pickerView;
    DropDownMenu *dropDownMenu;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    button1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 70, 220, 50)];
    [button1 setTitle:@"ActionSheet" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blueColor]];
    button1.titleLabel.textColor = [UIColor blackColor];
    [button1 addTarget:self action:@selector(ShowActionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    button2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 130, 220, 50)];
    [button2 setTitle:@"PickerView" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blueColor]];
    button2.titleLabel.textColor = [UIColor blackColor];
    [button2 addTarget:self action:@selector(PickerView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    titleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    titleButton.frame = CGRectMake(0, 0, 100, 25);
    [titleButton setTitle:@"全部任务" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(ShowDropDownMenu) forControlEvents:UIControlEventTouchUpInside];
    titleButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.3];
    
    self.navigationItem.titleView = titleButton;
    
    
}

- (void)ShowActionSheet
{
    actionSheet = [[CustomActionSheet alloc] initWithCancelButtonTitle:@"取消" OtherButtonTitle:@"确定" Feadback:^(id date) {
        
        NSLog(@"date %@", date);
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        
        NSString *str = [dateFormatter stringFromDate:date];
        NSLog(@"str %@", str);
        [button1 setTitle:str forState:UIControlStateNormal];
    }];
    [self.view addSubview:actionSheet];
}

- (void)PickerView
{
    NSArray *dataArray = [[NSArray alloc]initWithObjects:@"许嵩",@"周杰伦",@"梁静茹",@"许飞",@"凤凰传奇",@"阿杜",@"方大同",@"林俊杰",@"胡夏",@"邱永传", nil];
    
    pickerView = [[CustomPickerView alloc] initWithArray:dataArray CancelButtonTitle:@"取消" OtherButtonTitle:@"确定" Feadback:^(id data) {
        
        NSString *str = [NSString stringWithString:data];
        [button2 setTitle:str forState:UIControlStateNormal];
        
    }];
    [self.view addSubview:pickerView];
}

- (void)ShowDropDownMenu
{
    NSArray *items = @[@"全部任务", @"待处理", @"已打回", @"已接受", @"已完成", @"已撤销"];
    
    dropDownMenu = [[DropDownMenu alloc] initWithFrame:CGRectMake(95, 64, 130, 220) WithArray:items Feadback:^(id indexPath) {
        
        NSIndexPath *indexpath = indexPath;
        NSString *temp = items[indexpath.row];
        [titleButton setTitle:temp forState:UIControlStateNormal];
    }];
    [self.navigationController.view addSubview:dropDownMenu];
    
}


@end
