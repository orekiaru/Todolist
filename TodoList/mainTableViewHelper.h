//
//  mainTableViewHelper.h
//  TodoList
//
//  Created by aru oreki on 2020/2/25.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "TodoTaskCell.h"
#import "TodoDataModelStorage.h"
#import "editViewDelegate.h"
#import "addViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface mainTableViewHelper : UITableViewController<addViewDelegate,editViewDelegate>
- (instancetype)initWithTableView:(UITableView *)tableView;
-(TodoDataModelStorage *)shareStorage;
-(NSArray<TodoDataModel *>*)shareArray;
-(void)refreshTableView;
@end

NS_ASSUME_NONNULL_END
