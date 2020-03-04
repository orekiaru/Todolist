//
//  editViewController.m
//  TodoList
//
//  Created by aru oreki on 2020/2/27.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "EditViewController.h"
#import "Masonry.h"
#import "MainViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
@interface EditViewController ()
@end

@implementation EditViewController

- (instancetype)initWithModel:(TodoDataModel *)model
{
    self = [super init];
    if (!self)
    {
        NSLog(@"%@ init fail",self);
    }
    _model = model;
    
    return self;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    /// Do any additional setup after loading the view.
    [self initAllControl];
    [self bindModelData];
    [self displayAllControl];
}

 - (void)initAllControl
{
//    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
//    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
//    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"编辑事项"];
//    navigationItem.leftBarButtonItem = cancelItem;
    self.navigationItem.rightBarButtonItem = saveItem;
//    navigationBar.items = @[navigationItem];
//    [self.view addSubview:navigationBar];
//    _navigationBar = navigationBar;
    
    UITextField * contentField = [[UITextField alloc] init];
    contentField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:contentField];
    _contentField = contentField;
    
    UITextField * remarkField = [[UITextField alloc] init];
    remarkField.borderStyle = UITextBorderStyleRoundedRect;
    //    remarkField.text = @"备注";
    [self.view addSubview:remarkField];
    _remarkField = remarkField;
    
    UIDatePicker *dataPick = [[UIDatePicker alloc] init];
    [self.view addSubview:dataPick];
    _datePick = dataPick;
}

 - (void)bindModelData
{
    _contentField.text = _model.content;
    _remarkField.text = _model.remarks;
    _datePick.date = _model.time;
}

 - (void)displayAllControl
{

    [_contentField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.view.mas_top).offset(88);
        make.height.mas_equalTo(44);
        
    }];
    [_remarkField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.contentField.mas_bottom).offset(22);
        make.height.mas_equalTo(44);
        
    }];
    [_datePick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.remarkField.mas_bottom).offset(22);
        make.height.mas_equalTo(120);
        //        make.bottom.mas_equalTo(self.view.mas_bottom).offset(90);
        
    }];
}



-(void)save:(id)sender
{
    NSLog(@"you click save");
    TodoDataModel *model = _model;
    model.content = _contentField.text;
    model.remarks = _remarkField.text;
    model.time = _datePick.date;
    if([_delegate editTaskWithModel:model])
    {
        [self dismissViewControllerAnimated:YES completion:^{
            //        NSLog(@"back");
        }];
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:@"编辑失败"];
    }

    
}




@end
