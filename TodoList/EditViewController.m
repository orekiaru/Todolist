//
//  editViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "EditViewController.h"
#import "Masonry.h"
#import "MainViewController.h"
#import "EditTableViewHelper.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "cell/DatePickCell.h"
#import "cell/ContentCell.h"
#import "cell/RemarkCell.h"
@interface EditViewController ()
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)EditTableViewHelper *tableViewHelper;
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
}

 - (void)initAllControl
{
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];

    self.navigationItem.rightBarButtonItem = saveItem;
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
    EditTableViewHelper *tableViewHelper = [[EditTableViewHelper alloc] initWithTableView:_tableView model:_model];
    
}


-(void)save:(id)sender
{
    NSLog(@"you click save");
    TodoDataModel *model = _model;
    
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
                    model.content = cell.contentField.text;
                    break;
                }
                    
                case 1:
                {
                    RemarkCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    model.remarks = cell.remarkField.text;
                    break;
                }
                    
                case 2:
                {
                    DatePickCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    model.time = cell.datePick.date;
                    break;
                }
                default:
                {
                    //                    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
                    break;
                }
            }
    }
    
    if([_delegate editTaskWithModel:model])
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
