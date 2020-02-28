//
//  mainTableViewHelper.m
//  TodoList
//
//  Created by aru oreki on 2020/2/25.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "mainTableViewHelper.h"
#import "TodoDataModelStorage.h"
#import "TodoDataModel.h"
#import "editViewController.h"
@interface mainTableViewHelper ()

@property (nonatomic)UITableView *tableView;
@property (nonatomic)TodoDataModelStorage * storage;
@property (nonatomic) NSArray<TodoDataModel *>*array;

@end

@implementation mainTableViewHelper



-(void)pass:(TodoDataModel *)model
{
    
    if([_storage insertDataWithModel:model])
    {
        NSLog(@"insert success");
    }
    _array = [_storage select];
    [self.tableView reloadData];

}

-(void)refreshTableView
{
    [self.tableView reloadData];
}

-(TodoDataModelStorage *)shareStorage
{
    return _storage;
}

-(NSArray<TodoDataModel *>*)shareArray
{
    return _array;
}
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self)
    {
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.storage = [[TodoDataModelStorage alloc] init];
       
    }
    [self viewDidLoad];
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //estimatedRowHeight一般设置为TableViewCellView的默认高度
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    _array=[self.storage select];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return [_array count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rowscd
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TodoDataModel *model = _array[indexPath.section];
    ///创建一个单元格对象
    TodoTaskCell *cell = [[TodoTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"te"];
    cell.model = model;
    //    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tt"];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //第二组可以左滑删除
    if (indexPath.section == 2) {
        return YES;
    }
    
    return NO;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *indexPaths=[NSArray arrayWithObjects:indexPath,nil];
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        TodoDataModel *model = [self.array objectAtIndex:indexPath.row];
        [_storage deleteDataWithModel:model];
        //        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView layoutIfNeeded];
        });
    }
}

-(void)change:(TodoDataModel *)model
{
    [_storage updateDataWithModel:model];
    _array = [_storage select];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoDataModel *model = _array[indexPath.section];
    editViewController *editView =[editViewController shareController];
    editView.delegate = self;
    editView.contentField.text = model.content;
    editView.remarkField.text = model.remarks;
    
    [self presentViewController:editView animated:YES completion:nil];
    
}
@end
