//
//  editViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "EditViewController.h"
#import "Masonry.h"
#import "EditTableViewHelper.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "cell/DatePickCell.h"
#import "cell/ContentCell.h"
#import "cell/RemarkCell.h"
@interface EditViewController ()
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic)EditTableViewHelper *tableViewHelper;
@end

@implementation EditViewController

- (instancetype)initWithModel:(TodoDataModel *)model
{
    self = [super init];
    if (!self)
    {
        NSLog(@"%@ init fail",self);
    }
    _model = model;
    
    return self;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    /// Do any additional setup after loading the view.
    [self initAllControl];
    self.title = @"编辑事项";
}

 - (void)initAllControl
{
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];

    self.navigationItem.rightBarButtonItem = saveItem;
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
    EditTableViewHelper *tableViewHelper = [[EditTableViewHelper alloc] initWithTableView:_tableView model:_model];
    _tableViewHelper = tableViewHelper;
    
}


-(void)save:(id)sender
{
    NSLog(@"you click save");
    TodoDataModel *model = _model;
    
    model.content = _tableViewHelper.contents;
    model.remarks = _tableViewHelper.remarks;
    model.time = _tableViewHelper.time;
    
    
    if(_delegate !=nil &&[(NSObject *)_delegate respondsToSelector:@selector(editViewController:editTaskWithModel:)] == YES)
    {
        if([_delegate editViewController:self editTaskWithModel:model])
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"编辑失败"];
        }
    }
    
}

@end
