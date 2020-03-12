//
//  EditTableViewHelper.h
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TodoDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditTableViewHelper : NSObject
@property(nonatomic) TodoDataModel *model;
@property (nonatomic) NSString *contents;
@property (nonatomic) NSString *remarks;
@property (nonatomic) NSDate *time;
@property (nonatomic) BOOL notifitionStatus;
- (instancetype)initWithTableView:(UITableView *)tableView model:(TodoDataModel *)model;
@end

NS_ASSUME_NONNULL_END
