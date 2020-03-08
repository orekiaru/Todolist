//
//  UsernameCell.m
//  TodoList
//
//  Created by aru oreki on 2020/3/7.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "UsernameCell.h"
#import "Masonry.h"
@implementation UsernameCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self viewDidLoad];
        return self;
    }
    else
    {
        NSLog(@"Cell init fail");
        return self;
    }
    
    
}
- (void)viewDidLoad
{
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"用户名";
    _usernameField = textField;
    [self.contentView addSubview:_usernameField];

    [_usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left).with.offset(12);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(44);
        
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
