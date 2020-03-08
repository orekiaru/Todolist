//
//  EditTableViewHelper.m
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "EditTableViewHelper.h"
#import "cell/ContentCell.h"
#import "cell/RemarkCell.h"
#import "cell/DatePickCell.h"
#import "cell/NotificationCell.h"
@interface EditTableViewHelper ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)UITableView *tableView;
@end

@implementation EditTableViewHelper

- (instancetype)initWithTableView:(UITableView *)tableView model:(TodoDataModel *)model
{
    self = [super init];
    if (self)
    {
        self.tableView = tableView;
        self.tableView.delegate = (id)self;
        self.tableView.dataSource = (id)self;
        self.model = model;
    }
    [self viewDidLoad];
    return self;
    
}

- (void)viewDidLoad {
    //    [super viewDidLoad];
    //estimatedRowHeight一般设置为TableViewCellView的默认高度
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    _contents = _model.content;
    _remarks = _model.remarks;
    _time = _model.time;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            NSString *cellID = @"contents";
            ContentCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            cell.contentField.text = _model.content;
            [cell.contentField addTarget:self action:@selector(contentFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
            return cell;
        }
            
        case 1:
        {
            NSString *cellID = @"remarks";
            RemarkCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[RemarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            cell.remarkField.text = _model.remarks;
            [cell.remarkField addTarget:self action:@selector(remarkFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
            return cell;
        }
            
        case 2:
        {
            NSString *cellID = @"notification";
            
            NotificationCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[NotificationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                UISwitch * notificationSwitch = [[UISwitch alloc] init];
                [notificationSwitch addTarget:self action:@selector(switchDidChange:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = notificationSwitch;
            }
            
            return cell;
        }
        case 3:
        {
            NSString *cellID = @"datapick";
            DatePickCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[DatePickCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            cell.datePick.date = _model.time;
            [cell.datePick addTarget:self action:@selector(datePickDidChange:) forControlEvents:UIControlEventValueChanged];
            return cell;
        }
            
        default:
        {
            NSString *cellID = @"default";
            UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            return cell;
        }
            
    }
}

/// 监听datePick变化
- (void) datePickDidChange:(id)sender
{
    UIDatePicker *pick = (UIDatePicker *)sender;
    _time = pick.date;
}

- (void) contentFieldDidChange:(id)sender
{
    
    UITextField *field = (UITextField *)sender;
    _contents = field.text;
    
}

- (void) remarkFieldDidChange:(id)sender
{
    
    UITextField *field = (UITextField *)sender;
    _remarks = field.text;
    
}

- (void) switchDidChange:(id)sender
{
    UISwitch * notificationSwitch= (UISwitch *)sender;
    _notifitionStatus = notificationSwitch.isOn;
    
    
}
@end
