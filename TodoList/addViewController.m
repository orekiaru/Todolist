//
//  addViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "addViewController.h"
#import "Masonry.h"
#import "TodoDataModel.h"
#import "mainViewController.h"
#import "addViewDelegate.h"



@implementation addViewController

+(instancetype)shareController
{
    static addViewController *viewController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewController = [addViewController new];
    });
    return viewController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UINavigationBar *navigationBar=[[UINavigationBar alloc] init];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"新建事项"];
    navigationItem.leftBarButtonItem = cancelItem;
    navigationItem.rightBarButtonItem = saveItem;
    navigationBar.items = @[navigationItem];
    
    [self.view addSubview:navigationBar];
    _navigationBar=navigationBar;
    
    
    
    UITextField * contentField = [[UITextField alloc] init];
    contentField.borderStyle = UITextBorderStyleRoundedRect;
    contentField.text = @"正文";
    [self.view addSubview:contentField];
    _contentField = contentField;
    
    
    
    UITextField * remarkField = [[UITextField alloc] init];
    remarkField.borderStyle = UITextBorderStyleRoundedRect;
    remarkField.text = @"备注";
    [self.view addSubview:remarkField];
    _remarkField = remarkField;
    
    
    
    UIDatePicker *dataPick=[[UIDatePicker alloc] init];
    [self.view addSubview:dataPick];
    _datePick = dataPick;
    
    
    
    [navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(22);
        make.height.mas_equalTo(44);
    }];
    
    [contentField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.navigationBar.mas_bottom).offset(22);
        make.height.mas_equalTo(44);
        
    }];
    [remarkField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.contentField.mas_bottom).offset(22);
        make.height.mas_equalTo(44);
        
    }];
    [dataPick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.remarkField.mas_bottom).offset(22);
        make.height.mas_equalTo(120);
        //        make.bottom.mas_equalTo(self.view.mas_bottom).offset(90);
        
    }];
    
    
}

-(void)cancel:(id)sender
{
    NSLog(@"you click cancel");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"back");
    }];
}

-(void)save:(id)sender
{
    NSLog(@"you click save");
    NSString *content = _contentField.text;
    NSString *remarks = _remarkField.text;
    NSData *time = _datePick.date;
    
    TodoDataModel *model = [[TodoDataModel alloc] initWithContent:content Remarks:remarks ImagePath:@"" Time:time Status:NO];
    
    [_delegate pass:model];
    [self dismissViewControllerAnimated:YES completion:^{

        NSLog(@"");
        
    }];
    
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
