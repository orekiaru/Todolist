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
#import <SVProgressHUD/SVProgressHUD.h>
#import "cell/ContentCell.h"
#import "cell/RemarkCell.h"
#import "cell/DatePickCell.h"
#import "AddTableViewHelper.h"


@interface AddViewController ()<AddViewDelegate>
@property (nonatomic,strong)    UITableView *tableView;
@property (nonatomic)   AddTableViewHelper *tableViewHelper;

@property (nonatomic)   UIButton * saveButton;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMainFrame];
    AddTableViewHelper *tableViewHelper = [[AddTableViewHelper alloc] initWithTableView:_tableView];
    self.tableViewHelper = tableViewHelper;
//    _tableViewHelper.delegate = self;
    [self initAllControl];
    self.title = @"添加事项";
    
}

- (void)createMainFrame{

    /// 添加tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
    NSString *content = _tableViewHelper.contents;
    NSString *remarks = _tableViewHelper.remarks;
    NSDate *time = _tableViewHelper.time;
    
    TodoDataModel *model = [[TodoDataModel alloc] initWithContent:content Remarks:remarks ImagePath:@"" Time:time Status:NO];
    if(_delegate != nil && [(NSObject *)_delegate respondsToSelector:@selector(addViewController:addTaskWithModel:)] == YES)
    {
        if([_delegate addViewController:self addTaskWithModel:model])
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

