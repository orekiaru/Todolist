//
//  AddTableViewHelper.h
//  TodoList
//
//  Created by aru oreki on 2020/3/3.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddTableViewHelper : NSObject

@property (nonatomic) NSString *contents;
@property (nonatomic) NSString *remarks;
@property (nonatomic) NSDate *time;
@property (nonatomic) Boolean * notifitionStatus;
- (instancetype)initWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
