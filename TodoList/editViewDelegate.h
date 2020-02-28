//
//  editViewDelegate.h
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol editViewDelegate <NSObject>
-(void)change:(TodoDataModel *)model;
@end

NS_ASSUME_NONNULL_END
