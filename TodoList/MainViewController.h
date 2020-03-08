//
//  MainViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/19.
//  Copyright © 2020 aru oreki. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "MainTableViewHelper.h"
#import "EditViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController<MainTableViewHelperDelegate>

 - (void)createMainFrame;
@end

NS_ASSUME_NONNULL_END
