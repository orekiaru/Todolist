//
//  mainViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/19.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewHelper.h"
#import "EditViewController.h"
#import "AddViewController.h"
#import "Masonry.h"

@interface MainViewController ()
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)UINavigationBar *navigationBar;
@property (nonatomic, strong) MainTableViewHelper *tableViewHelper;
@end

@implementation MainViewController


- (void)viewDidLoad {
    
    [self createMainFrame];
    MainTableViewHelper *tableViewHelper = [[MainTableViewHelper alloc] initWithTableView:_tableView];
    self.tableViewHelper = tableViewHelper;
    _tableViewHelper.delegate = self;

}

 - (void)createMainFrame{
    /// 布局导航栏，tableView和底部栏
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(back:)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"TodoList"];
    navigationItem.leftBarButtonItem = backItem;
    navigationItem.rightBarButtonItem = addItem;
    navigationBar.items = @[navigationItem];
    //    navigationBar.
    [self.view addSubview:navigationBar];
    _navigationBar=navigationBar;
    
    [navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(22);
        make.height.mas_equalTo(44);
    }];
    
    
    /// 添加tableView
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    _tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

 - (void)add:(id)sender
{
    NSLog(@"you click add");
    AddViewController *addView = [[AddViewController alloc] init];
    addView.delegate = _tableViewHelper;
    [self presentViewController:addView animated:YES completion:nil];
    
}

 - (void)back:(id)sender
{
    NSLog(@"you click back");
}

#pragma mark MainTableViewHelperDelegate
 - (void)jumpInterfaceWhenTableViewSelectedWithModel:(TodoDataModel *)model
{
    EditViewController *editViewContrller =[[EditViewController alloc] initWithModel:model];
        editViewContrller.delegate = _tableViewHelper;
    [self presentViewController:editViewContrller animated:YES completion:nil];
}


@end
