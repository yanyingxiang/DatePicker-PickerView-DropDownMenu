//
//  DropDownMenu.m
//  DropDownMenu
//
//  Created by Ryan on 14/12/17.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import "DropDownMenu.h"

@implementation DropDownMenu

-(void)setInstanBlock:(InstanBlock)block
{
    if (instanBlock!= block)
    {
        instanBlock = [block copy];
    }
}

- (id)initWithFrame:(CGRect)frame WithArray:(NSArray *)array Feadback:(InstanBlock)block
{
    CGRect viewFrame = [UIScreen mainScreen].bounds;
    self = [super initWithFrame:viewFrame];
    if (self)
    {
        [self setInstanBlock:block];
        _array =[NSArray arrayWithArray:array];
        _tableViewFrame = frame;

        _control = [[UIControl alloc] initWithFrame:viewFrame];
        _control.backgroundColor = [UIColor clearColor];
        [_control addTarget:self action:@selector(animationHideTableview) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_control];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.origin.x*2 + frame.size.width)/2 - 10, frame.origin.y - 12, 20, 12)];
        imageView.image = [UIImage imageNamed:@"dropdown.png"];
        [self addSubview:imageView];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(_tableViewFrame.origin.x, _tableViewFrame.origin.y, frame.size.width, 0) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:0.9];
        _tableView.layer.cornerRadius = 10;
        _tableView.layer.borderWidth = 1;
        _tableView.layer.borderColor = [UIColor clearColor].CGColor;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 15);

        [self addSubview:_tableView];

        [self makeKeyWindow];
        self.hidden = NO;
        [self animationShowTableview];
    }
 
    return self;
}

- (void)animationShowTableview
{
    [UIView animateWithDuration:0.3 animations:^{
        
        _tableView.frame = CGRectMake(_tableViewFrame.origin.x, _tableViewFrame.origin.y, _tableViewFrame.size.width, _tableViewFrame.size.height);

    }];
}

- (void)animationHideTableview
{
    [UIView animateWithDuration:0.3 animations:^{
        
        _tableView.frame = CGRectMake(_tableViewFrame.origin.x, _tableViewFrame.origin.y, _tableViewFrame.size.width, 0);

    } completion:^(BOOL finished) {
        
        [self resignKeyWindow];
        self.hidden = YES;
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier = @"resueIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:0.5];
    cell.textLabel.text = _array[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self animationHideTableview];
    if (instanBlock)
    {
        instanBlock(indexPath);
    }
}

@end
