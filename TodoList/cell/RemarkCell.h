//
//  RemarkCell.h
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RemarkCell : UITableViewCell
@property (nonatomic,weak) UITextField *remarkField;
@property (nonatomic,weak) NSString *remark;

@end

NS_ASSUME_NONNULL_END
