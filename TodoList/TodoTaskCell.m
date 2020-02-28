//
//  TodoTaskCell.m
//  TodoList故事板
//
//  Created by aru oreki on 2020/2/20.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "TodoTaskCell.h"
#import "Masonry.h"
@implementation TodoTaskCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return self;
}

-(void)changeStatus
{
    NSLog(@"you click change status");
    TodoDataModel *model = self.model;
    
    if(model.status)
    {
        [model setStatus:NO];
    }
    else
    {
        [model setStatus:YES];
    }
    
    
    UITableView *tableView = [self superview];
    NSIndexPath *index = [tableView indexPathForCell:self];
//    [tableView reloadRowsAtIndexPaths:index withRowAnimation:nil];
    [tableView reloadData];
    
}


/// rewrite set method of group
-(void)setModel:(TodoDataModel *)model
{
    _model=model;
    
    [self settingAutoLayout];

//    [self settingData];
    [self settingData];
}

-(void)settingAutoLayout
{
    /// 1.创建是否完成button
    UIButton * finishBtn=[[UIButton alloc]init];
    [self.contentView addSubview:finishBtn];
    _finishBtn=finishBtn;
    ///设置按钮监听事件
    [_finishBtn addTarget:self action:@selector(changeStatus) forControlEvents:UIControlEventTouchUpInside];
    
    /// 2.创建正文label
    UITextField  * content=[[UITextField alloc]init];
    content.font=[UIFont systemFontOfSize:20];
    /// 设置文本自动换行
    //        content.numberOfLines=0;
    
    [self.contentView addSubview:content];
    _content=content;
    
    /// 3.创建URL TextView
    UITextField* remarks=[[UITextField alloc]init];
    [self.contentView addSubview:remarks];
    _remarks=remarks;
    
    ///4.创建图片ImageView
    UIImageView *pic=[[UIImageView alloc] init];
    [self.contentView addSubview:pic];
    _image=pic;
    
    /// 5.创建时间label
    UILabel *timeLabel=[[UILabel alloc]init];
    [self.contentView addSubview:timeLabel];
    _time=timeLabel;
    

    
    CGFloat margin=20;
    [_finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(margin);
        make.left.equalTo(self.contentView).offset(margin);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(margin);
        make.left.equalTo(self.finishBtn.mas_right).offset(5);
        
    }];
    
    [_remarks mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.content.mas_bottom).offset(5);
        make.left.equalTo(self.finishBtn.mas_right);
        
    }];
    
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.remarks.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(200, 200));
        
    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.image.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];

}

/// set data methoed
-(void)settingData{
    TodoDataModel *model=_model;
    /// set button

    if(model.status)
    {
        UIImage *img = [UIImage imageNamed:@"finished.png"];
        [_finishBtn setImage:img forState:UIControlStateNormal];
    }
    else
    {
        UIImage *img =[UIImage imageNamed:@"unfinshed.png"];
        [_finishBtn setImage:img forState:UIControlStateNormal];
    }

    /// set content
    _content.text=model.content;

    /// set url
    if(model.remarks)
    {
        _remarks.text=model.remarks;
        _remarks.hidden=NO;
    }
    else
    {
        _remarks.hidden=YES;
    }


    /// set picture
    if(![model.imagePath isEqualToString:@""])
    {
        _image.image=[UIImage imageNamed:model.imagePath];
        _image.hidden=NO;
    }
    else
    {
        _image.hidden=YES;
    }


    /// set time
    NSDate *time=model.time;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strTime = [dateFormatter stringFromDate:time];
    self.time.text=strTime;

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
