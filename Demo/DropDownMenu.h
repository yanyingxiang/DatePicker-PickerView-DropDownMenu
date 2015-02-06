//
//  DropDownMenu.h
//  DropDownMenu
//
//  Created by Ryan on 14/12/17.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InstanBlock)(id indexPath);

@interface DropDownMenu : UIWindow <UITableViewDelegate, UITableViewDataSource>
{
    InstanBlock instanBlock;
}
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIControl *control;
@property (strong, nonatomic) NSArray *array;
@property (assign, nonatomic) CGRect tableViewFrame;

- (id)initWithFrame:(CGRect)frame WithArray:(NSArray *)array Feadback:(InstanBlock)block;
- (void)animationShowTableview;
- (void)animationHideTableview;

//实例回调block
-(void)setInstanBlock:(InstanBlock)block;
@end
