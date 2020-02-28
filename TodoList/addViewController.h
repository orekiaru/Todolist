//
//  addViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface addViewController : UIViewController<addViewDelegate>
@property(weak,nonatomic)UINavigationBar * navigationBar;
@property(weak,nonatomic)UITextField * contentField;
@property(weak,nonatomic)UITextField * remarkField;
@property(weak,nonatomic)UIDatePicker * datePick;
@property(weak,nonatomic)UIButton * saveBtn;
@property(weak,nonatomic) id<addViewDelegate> delegate;
+(instancetype)shareController;

@end

NS_ASSUME_NONNULL_END
