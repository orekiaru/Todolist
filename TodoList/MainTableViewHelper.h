//
//  MainTableViewHelper.h
//  TodoList
//
//  Created by aru oreki on 2020/2/25.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "TodoTaskCell.h"
#import "TodoDataModelStorage.h"
#import "AddViewController.h"
#import "EditViewController.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
NS_ASSUME_NONNULL_BEGIN


@class MainTableViewHelper;
@protocol MainTableViewHelperDelegate <NSObject>
@optional
- (void)mainTableViewHelper:(MainTableViewHelper *)tableViewHelper jumpInterfaceWhenTableViewSelectedWithModel:(TodoDataModel *)model;
@end

@interface MainTableViewHelper : NSObject<UITableViewDelegate,UITableViewDataSource,AddViewDelegate,EditViewDelegate,TaskCellDelegate,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property(nonatomic,strong) id<MainTableViewHelperDelegate> delegate;
 - (instancetype)initWithTableView:(UITableView *)tableView;
 - (void)refreshTableView;
@end

NS_ASSUME_NONNULL_END
