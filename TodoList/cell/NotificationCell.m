//
//  NotificationCell.m
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "NotificationCell.h"

@implementation NotificationCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self viewDidLoad];
    return self;
}

- (void)viewDidLoad
{
    self.textLabel.text = @"是否在指定时间通知";
    
}


@end
