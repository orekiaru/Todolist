//
//  RemarkCell.m
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "RemarkCell.h"
#import "Masonry.h"
@implementation RemarkCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier reamrk:(NSString *)remark
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.remark = remark;
        [self viewDidLoad];
        return self;
    }
    else
    {
        NSLog(@"Cell init fail");
        return self;
    }


}

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
    textField.placeholder = @"备注";
    _remarkField = textField;
    [self.contentView addSubview:textField];
    if(_remark)
    {
        _remarkField.text = _remark;
    }
    
    [_remarkField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
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
