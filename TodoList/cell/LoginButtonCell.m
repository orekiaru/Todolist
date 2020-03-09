//
//  LoginButtonCell.m
//  TodoList
//
//  Created by aru oreki on 2020/3/7.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "LoginButtonCell.h"
#import "Masonry.h"
@implementation LoginButtonCell

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
    UIButton *loginButton = [[UIButton alloc] init];

    _loginButton = loginButton;
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
//    [loginButton setBackgroundColor:[UIColor greenColor]];
    [loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.contentView addSubview:_loginButton];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left).with.offset(12);
        make.right.equalTo(self.contentView.mas_right).with.offset(-12);
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
