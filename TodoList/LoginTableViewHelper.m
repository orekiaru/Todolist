//
//  LoginTableViewHelper.m
//  TodoList
//
//  Created by aru oreki on 2020/3/7.
//  Copyright © 2020 aru oreki. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LoginTableViewHelper.h"
#import "cell/LoginButtonCell.h"
#import "cell/PasswordCell.h"
#import "cell/UsernameCell.h"
@interface LoginTableViewHelper()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *password;
@end

@implementation LoginTableViewHelper
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self)
    {
        self.tableView = tableView;
        self.tableView.delegate = (id)self;
        self.tableView.dataSource = (id)self;
        
    }
    [self viewDidLoad];
    return self;
    
}

- (void)viewDidLoad {
    //estimatedRowHeight一般设置为TableViewCellView的默认高度
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row)
    {
        case 0:
        {
            NSString *cellID = @"username";
            UsernameCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[UsernameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            [cell.usernameField addTarget:self action:@selector(usernameDidChange:) forControlEvents:UIControlEventEditingChanged];
            return cell;
        }
            
        case 1:
        {
            NSString *cellID = @"password";
            PasswordCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[PasswordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            [cell.passwordField addTarget:self action:@selector(passwordDidChange:) forControlEvents:UIControlEventEditingChanged];
            return cell;
        }
            
        case 2:
        {
            NSString *cellID = @"loginButton";

            LoginButtonCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[LoginButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                [cell.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
            }
            return cell;
        }
        default:
        {
            NSString *cellID = @"default";
            UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
            if(!cell)
            {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            return cell;
        }
            
    }
}

- (void) usernameDidChange:(id)sender
{
    
    UITextField *usernameField = (UITextField *)sender;
    _username = usernameField.text;
    
}

- (void) passwordDidChange:(id)sender
{
    
    UITextField *passwordField = (UITextField *)sender;
    _password = passwordField.text;
    
}

- (void) login:(id)sender
{
    if(_delegate != nil && [_delegate respondsToSelector:@selector(LoginTableViewHelper:loginWithUsername:passowrd:)] == YES)
    {
        [_delegate LoginTableViewHelper:self loginWithUsername:_username passowrd:_password];
    }
    
}
@end
