//
//  AddTableViewHelper.m
//  TodoList
//
//  Created by aru oreki on 2020/3/3.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "AddTableViewHelper.h"
#import "cell/ContentCell.h"
#import "cell/RemarkCell.h"
#import "cell/DatePickCell.h"

@interface AddTableViewHelper ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
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
    [self viewDidLoad];
    return self;
    
}

- (void)viewDidLoad {
    //estimatedRowHeight一般设置为TableViewCellView的默认高度
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            
            ContentCell *cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contents"];
            return cell;
        }
            
        case 1:
        {
            RemarkCell *cell = [[RemarkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"remarks"];
            return cell;
        }

        case 2:
        {
            DatePickCell *cell = [[DatePickCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"datapick"];
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
