//
//  mainViewController.h
//  TodoList
//
//  Created by aru oreki on 2020/2/19.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainTableViewHelper.h"
NS_ASSUME_NONNULL_BEGIN

@interface mainViewController : UIViewController

//+(instancetype)shareController;
-(void)createMainFrame;

-(mainTableViewHelper*)shareViewHelp;
@end

NS_ASSUME_NONNULL_END
