//
//  TaskCellDelegate.h
//  TodoList
//
//  Created by aru oreki on 2020/2/29.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TaskCellDelegate <NSObject>

@optional
- (BOOL) updateCellWithModel;

@end

NS_ASSUME_NONNULL_END
