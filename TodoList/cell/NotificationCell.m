//
//  NotificationCell.m
//  TodoList
//
//  Created by aru oreki on 2020/3/5.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "NotificationCell.h"

@implementation NotificationCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self viewDidLoad];
    return self;
}

- (void)viewDidLoad
{
    UILabel *label = [[UILabel alloc] init];
    _label = label;
    _label.text = @"是否在指定时间通知";
    [self.contentView addSubview:label];
    UISwitch * swi = [[UISwitch alloc] init];
    _swi = swi;
    [self.contentView addSubview:swi];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left).offset(20);
//        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(44);
        
    }];
    
    [_swi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
//        make.left.equalTo(self.label.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(44);
        
    }];
    
}

 - (void) addNotification
{
    //  创建本地通知对象
    UILocalNotification *ln = [[UILocalNotification alloc] init];
    //  1.设置通知的内容(如果此属性不设置是不会发送通知的)
    ln.alertBody = @"测试提醒";
    //  2.设置通知触发的开始时间
    ln.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    //  3.设置重复通知的时间,间隔
    ln.repeatInterval = NSCalendarUnitSecond;
    //  4.设置重复执行使用日历(用户设置的日历)
    ln.repeatCalendar = [NSCalendar  currentCalendar];
    //    NSString * const NSGregorianCalendar; 公历
    //    NSString * const NSChineseCalendar; 农历
    //    ln.repeatCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    //  5.设置应用图标右上角的数字
    ln.applicationIconBadgeNumber = 3;
    //  6.设置点击推送通知进入界面的时候显示,加载图片
    ln.alertLaunchImage = @"";
//    //  7 设置通知的音效(只有真机有效)
//    local.soundName = UILocalNotificationDefaultSoundName;
//    //  8 设置一些额外信息
//    local.userInfo = @{@"QQ":@"55555",@"info":@"约了没"};
    

    

}
@end
