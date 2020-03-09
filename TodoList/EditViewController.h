//
//  editViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@class EditViewController;
@protocol EditViewDelegate <NSObject>
@optional
- (BOOL)editViewController:(EditViewController *)viewController editTaskWithModel:(TodoDataModel *)model;
@end

@interface EditViewController : UIViewController<EditViewDelegate>
@property(strong,nonatomic) id<EditViewDelegate> delegate;

@property(weak,nonatomic) UIButton *saveButton;
@property(weak,nonatomic) TodoDataModel *model;

- (instancetype)initWithModel:(TodoDataModel *)model;
@end

NS_ASSUME_NONNULL_END
