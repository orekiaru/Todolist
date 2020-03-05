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
            
            ContentCell *cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contents" contents:_model.content];
            return cell;
        }
            
        case 1:
        {
            RemarkCell *cell = [[RemarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"remarks" reamrk:_model.remarks];
            return cell;
        }
            
        case 3:
        {
            DatePickCell *cell = [[DatePickCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"datapick" time:_model.time];
            return cell;
        }
        case 2:
        {
            NotificationCell *cell = [[NotificationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"notification"];
            return cell;
        }
        default:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            return cell;
        }
            
    }
}
@end
