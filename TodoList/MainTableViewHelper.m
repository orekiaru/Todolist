//
//  mainTableViewHelper.m
//  TodoList
//
//  Created by aru oreki on 2020/2/25.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "MainTableViewHelper.h"
#import "TodoDataModelStorage.h"
#import "TodoDataModel.h"
#import "EditViewController.h"
@interface MainTableViewHelper ()

@property (nonatomic)UITableView *tableView;
@property (nonatomic)TodoDataModelStorage * storage;
@property (nonatomic) NSArray<TodoDataModel *>*array;

@end

@implementation MainTableViewHelper



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




- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self)
    {
        self.tableView = tableView;
        self.tableView.delegate = (id)self;
        self.tableView.dataSource = (id)self;
        self.storage = [[TodoDataModelStorage alloc] init];
       
    }
    [self viewDidLoad];
    return self;
    
}

- (void)viewDidLoad {
//    [super viewDidLoad];
    //estimatedRowHeight一般设置为TableViewCellView的默认高度
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    _array=[self.storage select];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [_array count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TodoDataModel *model = _array[indexPath.section];
    ///创建一个单元格对象
    TodoTaskCell *cell = [[TodoTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"te" model:model];

    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 第二组可以左滑删除
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
//    NSArray *indexPaths=[NSArray arrayWithObjects:indexPath,nil];
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



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoDataModel *model = _array[indexPath.section];
    [self.delegate jumpInterfaceWhenTableViewSelectedWithModel:model];
    
}

#pragma mark AddViewDelegate
 - (BOOL)addTaskWithModel:(TodoDataModel *)model
{
    if([_storage insertDataWithModel:model])
    {
        _array = [_storage select];
        [self.tableView reloadData];
        return YES;
    }
    return NO;
}

#pragma mark EditViewDelegate
 - (BOOL) editTaskWithModel:(TodoDataModel *)model
{
    if([_storage updateDataWithModel:model])
    {
        _array = [_storage select];
        [self.tableView reloadData];
        return YES;
    }
    return NO;
}



@end

