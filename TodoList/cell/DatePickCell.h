//
//  DatePickCell.h
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DatePickCell : UITableViewCell
@property(weak,nonatomic)UIDatePicker * datePick;
@property(weak,nonatomic)NSDate *time;
@end

NS_ASSUME_NONNULL_END
