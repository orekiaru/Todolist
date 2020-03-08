//
//  LoginTableViewHelper.h
//  TodoList
//
//  Created by aru oreki on 2020/3/7.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class LoginTableViewHelper;
@protocol LoginTableViewDelegate <NSObject>
@optional
- (void)LoginTableViewHelper:(LoginTableViewHelper *)LoginTableViewHelper loginWithUsername:(NSString *)username passowrd:(NSString *)password;
@end
@interface LoginTableViewHelper : NSObject
- (instancetype)initWithTableView:(UITableView *)tableView;
@property(nonatomic,strong) id<LoginTableViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
