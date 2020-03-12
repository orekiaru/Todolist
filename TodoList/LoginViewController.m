//
//  LoginViewController.m
//  
//
//  Created by aru oreki on 2020/2/23.
//

#import "LoginViewController.h"
#import "LoginTableViewHelper.h"
#import "MainViewController.h"
#import <SVProgressHUD.h>
#import "Masonry.h"



@interface LoginViewController ()<LoginTableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic) LoginTableViewHelper *tableViewHelper;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"欢迎来到私人TodoList";
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];

    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(self.view.mas_left);
        
        make.top.equalTo(self.view.mas_top);
        
        make.right.equalTo(self.view.mas_right);
        
        make.bottom.equalTo(self.view.mas_bottom);

    }];
    
    LoginTableViewHelper *tableViewHelper = [[LoginTableViewHelper alloc] initWithTableView:_tableView];
    _tableViewHelper = tableViewHelper;
    _tableViewHelper.delegate = self;
    

}

#pragma mark LoginTableViewDelegate
 - (void)LoginTableViewHelper:(LoginTableViewHelper *)LoginTableViewHelper loginWithUsername:(NSString *)username passowrd:(NSString *)password
{
    NSLog(@"you click the buttom");
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        if([username isEqualToString:@"Admin"]&&[password isEqualToString:@"Admin"])
        {
            /// 跳转页面
            MainViewController * mainViewController = [[MainViewController alloc] init];
            [self.navigationController pushViewController:mainViewController animated:YES];
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
