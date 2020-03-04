//
//  ContentCell.h
//  TodoList
//
//  Created by aru oreki on 2020/3/3.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentCell : UITableViewCell
@property (nonatomic,weak) UITextField *contentField;
@property (nonatomic,weak) NSString *contents;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contents:(NSString *)contents;
@end

NS_ASSUME_NONNULL_END
