//
//  editViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "editViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface editViewController : UIViewController<editViewDelegate>
@property(weak,nonatomic) id<editViewDelegate> delegate;
@property(weak,nonatomic)UITextField * contentField;
@property(weak,nonatomic)UITextField * remarkField;
@property(weak,nonatomic)UIDatePicker * datePick;
+(instancetype)shareController;
@end

NS_ASSUME_NONNULL_END
