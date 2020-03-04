//
//  editViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController<EditViewDelegate>
@property(weak,nonatomic) id<EditViewDelegate> delegate;
@property(weak,nonatomic) UITextField *contentField;
@property(weak,nonatomic) UITextField *remarkField;
@property(weak,nonatomic) UIDatePicker *datePick;
//@property(weak,nonatomic) UINavigationBar *navigationBar;
@property(weak,nonatomic) UIButton *saveBtn;
@property(weak,nonatomic) TodoDataModel *model;

- (instancetype)initWithModel:(TodoDataModel *)model;
@end

NS_ASSUME_NONNULL_END
