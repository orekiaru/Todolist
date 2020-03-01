//
//  LoginViewController.m
//  
//
//  Created by aru oreki on 2020/2/23.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import <SVProgressHUD.h>
#import "Masonry.h"
@interface LoginViewController ()
@property (nonatomic)UITextField *usernameField;
@property (nonatomic)UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"欢迎使用私人TodoList"];
    UINavigationBar *navigationBar = [[UINavigationBar alloc]init];
    navigationBar.items = @[navigationItem];
    [self.view addSubview:navigationBar];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor greenColor]];
    loginBtn.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *userNameTextFiled = [[UITextField alloc] init];
    userNameTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    userNameTextFiled.placeholder = @"用户名";
    userNameTextFiled.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:userNameTextFiled];
    _usernameField=userNameTextFiled;
    
    UITextField *userPwdTextFiled = [[UITextField alloc] init];
    userPwdTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    userPwdTextFiled.placeholder = @"密码";
    userPwdTextFiled.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:userPwdTextFiled];
    _passwordField=userPwdTextFiled;
    
    [userNameTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(self.view.mas_left).with.offset(20);
        
        make.top.equalTo(self.view.mas_top).with.offset(20);
        
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        
        make.height.mas_equalTo(44);

    }];
    
    [userPwdTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.usernameField.mas_bottom).offset(30);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        make.left.equalTo(self.view).offset(20);
        make.height.mas_equalTo(44);
        
    }];
    
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);

        make.top.equalTo(self.passwordField.mas_bottom).offset(30);

        make.size.mas_equalTo(CGSizeMake(90, 35));
        
    }];

}

 - (void)login:(UIButton *)button
{
    NSLog(@"you click the buttom");

    NSString *username = _usernameField.text;
    NSString *password = _passwordField.text;
    
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        if([username isEqualToString:@"Admin"]&&[password isEqualToString:@"Admin"])
        {
            /// 跳转页面
            /// [self performSegueWithIdentifier:@"login2todolist" sender:nil];
            MainViewController * mainViewController = [[MainViewController alloc] init];
            [self presentViewController:mainViewController animated:YES completion:nil];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"账号或密码错误"];
        }
    });

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
