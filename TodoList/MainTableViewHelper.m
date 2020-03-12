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

#import <SVProgressHUD/SVProgressHUD.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface MainTableViewHelper () 

@property (nonatomic)UITableView *tableView;
@property (nonatomic)TodoDataModelStorage * storage;
@property (nonatomic) NSArray<TodoDataModel *>*array;

@end

@implementation MainTableViewHelper


//
//-(void)pass:(TodoDataModel *)model
//{
//
//    if([_storage insertDataWithModel:model])
//    {
//        NSLog(@"insert success");
//    }
//    _array = [_storage select];
//    [self.tableView reloadData];
//
//}

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
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        /// 删除单元格分隔线的一个小技巧
        self.tableView.tableFooterView = [UIView new];
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
    TodoTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskcell"];
    if(!cell)
    {
        cell = [[TodoTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"taskcell" model:model];
        cell.delegate = self;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
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
        
        if([_storage deleteDataWithModel:model])
        {
            _array = [_storage select];
            [self.tableView reloadData];
            [self.tableView layoutIfNeeded];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"删除失败"];
        }
        //        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];


    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoDataModel *model = _array[indexPath.section];
    if(_delegate != nil && [(NSObject *)_delegate respondsToSelector:@selector(mainTableViewHelper:jumpInterfaceWhenTableViewSelectedWithModel:)] == YES)
    {
        [self.delegate mainTableViewHelper:self jumpInterfaceWhenTableViewSelectedWithModel:model];
    }
}

#pragma mark AddViewDelegate
 - (BOOL)addViewController:(AddViewController *)viewController addTaskWithModel:(TodoDataModel *)model
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
 - (BOOL) editViewController:(EditViewController *)viewController editTaskWithModel:(TodoDataModel *)model
{
    if([_storage updateDataWithModel:model])
    {
        _array = [_storage select];
        [self.tableView reloadData];
        return YES;
    }
    return NO;
}

#pragma mark TaskCellDelegate
- (BOOL) updateCellWithModel:(TodoDataModel*)model
{
    if([_storage updateDataWithModel:model])
    {
        _array = [_storage select];
        [self.tableView reloadData];
        return YES;
    }
    else
    {
        return NO;
    }
}
#pragma mark DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"unfinsh"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"空界面";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName:[UIColor darkGrayColor]
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"可以点击右上角的加号添加新事项哦！";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


@end

