//
//  addViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@class AddViewController;
@protocol AddViewDelegate <NSObject>
@optional
- (BOOL)addViewController:(AddViewController *)viewController addTaskWithModel:(TodoDataModel *)model;
@end

@interface AddViewController : UIViewController
@property (nonatomic,strong) id<AddViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
