//
//  TodoTaskCell.h
//  TodoList故事板
//
//  Created by aru oreki on 2020/2/20.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "TodoDataModel.h"
#import "TaskCellDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TodoTaskCell : UITableViewCell
//@property(nonatomic,weak) Model *model;
@property(nonatomic,weak) TodoDataModel *model;
@property(nonatomic,weak) UIButton *finishBtn;
@property (nonatomic,weak) UITextField *content;
@property (nonatomic,weak) UITextField *remarks;
@property (nonatomic,weak) UIImageView *image;
@property(nonatomic,weak) UILabel *time;
@property(nonatomic,weak) id<TaskCellDelegate> delegate;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(TodoDataModel *) model;
 - (void)changeStatus;
@end

NS_ASSUME_NONNULL_END
