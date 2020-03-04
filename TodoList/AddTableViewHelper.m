//
//  AddTableViewHelper.m
//  TodoList
//
//  Created by aru oreki on 2020/3/3.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "AddTableViewHelper.h"
@interface AddTableViewHelper ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)UITableView *tableView;
@end

@implementation AddTableViewHelper
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self)
    {
        self.tableView = tableView;
        self.tableView.delegate = (id)self;
        self.tableView.dataSource = (id)self;
        
    }
    return self;
    
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
}

@end
