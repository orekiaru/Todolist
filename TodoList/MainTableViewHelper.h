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
#import "EditViewDelegate.h"
#import "AddViewDelegate.h"
#import "MainTableViewHelperDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewHelper : NSObject<AddViewDelegate,EditViewDelegate,MainTableViewHelperDelegate>
@property(weak,nonatomic) id<MainTableViewHelperDelegate> delegate;
 - (instancetype)initWithTableView:(UITableView *)tableView;
 - (void)refreshTableView;
@end

NS_ASSUME_NONNULL_END
