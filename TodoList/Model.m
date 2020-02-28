//
//  Model.m
//  TodoList
//
//  Created by aru oreki on 2020/2/25.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "Model.h"

@implementation Model
-(instancetype)initWithData:(NSString*) data Remarks:(NSString *) remarks Image:(NSString *)image Time:(NSDate *)time Status:(BOOL)status
{
    self=[super init];
    if(self)
    {
        _data = data;
        _remarks = remarks;
        _image = image;
        _time = time;
        _status = status;
    }

    return self;
}

-(void)setStatus:(BOOL)status
{
    if(status)
    {
        status = NO;
    }
    else
    {
        status = YES;
    }
}
@end
