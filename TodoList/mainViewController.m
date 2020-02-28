//
//  mainViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/19.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "mainViewController.h"
#import "mainTableViewHelper.h"
#import "editViewController.h"
#import "addViewController.h"
#import "Masonry.h"

@interface mainViewController ()
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)UINavigationBar *navigationBar;
@property (nonatomic, strong) mainTableViewHelper *tableViewHelper;

@end

@implementation mainViewController

//+(instancetype)shareController
//{
//    static mainViewController *viewController = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        viewController = [mainViewController new];
//    });
//    return viewController;
//}




-(mainTableViewHelper*)shareViewHelp
{
    return _tableViewHelper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMainFrame];
    mainTableViewHelper *tableViewHelper = [[mainTableViewHelper alloc] initWithTableView:_tableView];
    self.tableViewHelper = tableViewHelper;

}

-(void)createMainFrame{
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
    UITableView *tableView=[[UITableView alloc] init];
    [self.view addSubview:tableView];
    _tableView=tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

-(void)add:(id)sender
{
    NSLog(@"you click add");
    addViewController *addView = [addViewController shareController];
    addView.delegate = _tableViewHelper;
    [self presentViewController:addView animated:YES completion:nil];
}

-(void)back:(id)sender
{
    NSLog(@"you click back");
}
@end
