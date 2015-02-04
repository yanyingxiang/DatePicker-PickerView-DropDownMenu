//
//  DropDownMenuCell.m
//  DropDownMenu
//
//  Created by Ryan on 15/1/5.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "DropDownMenuCell.h"

@implementation DropDownMenuCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.frame = CGRectMake(0, 0, 320, 40);

    }
    
    return self;
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    //    self
    // Configure the view for the selected state
}
@end
