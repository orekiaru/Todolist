//
//  addViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "AddViewController.h"
#import "Masonry.h"
#import "TodoDataModel.h"
#import "MainViewController.h"
#import "AddViewDelegate.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "AddTableViewHelper.h"
#import "cell/ContentCell.h"
#import "cell/RemarkCell.h"
#import "cell/DatePickCell.h"

@interface AddViewController ()
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)AddTableViewHelper *tableViewHelper;
@end

@implementation AddViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMainFrame];
    AddTableViewHelper *tableViewHelper = [[AddTableViewHelper alloc] initWithTableView:_tableView];
    self.tableViewHelper = tableViewHelper;
//    _tableViewHelper.delegate = self;
    [self initAllControl];

    
}


- (void)createMainFrame{

    /// 添加tableView
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    _tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
- (void)initAllControl
{
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveItem;
}
 



-(void)save:(id)sender
{
    NSLog(@"you click save");
    NSString *content;
    NSString *remarks;
    NSDate *time;
    
    NSInteger sections = _tableView.numberOfSections;
    for (int section = 0; section < sections; section++)
    {
        
        NSInteger rows = [_tableView numberOfRowsInSection:section];
        
        for (int row = 0; row < rows; row++)
        {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            
            switch (indexPath.row)
            {
                case 0:
                {
                    ContentCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    content = cell.contentField.text;
                    break;
                }
                    
                case 1:
                {
                    RemarkCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    remarks = cell.remarkField.text;
                    break;
                }
                    
                case 2:
                {
                    DatePickCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    time = cell.datePick.date;
                    break;
                }
                default:
                {
//                    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    break;
                }
            
        }
        
    }
        TodoDataModel *model = [[TodoDataModel alloc] initWithContent:content Remarks:remarks ImagePath:@"" Time:time Status:NO];
        if([_delegate addTaskWithModel:model])
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"添加失败"];
        }

    }
}
@end

