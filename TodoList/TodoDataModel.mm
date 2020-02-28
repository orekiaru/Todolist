//
//  TodoDataModel.mm
//  wcdb
//
//  Created by aru oreki on 2020/2/26.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "TodoDataModel+WCTTableCoding.h"
#import "TodoDataModel.h"
#import <WCDB/WCDB.h>

@implementation TodoDataModel

WCDB_IMPLEMENTATION(TodoDataModel)
WCDB_SYNTHESIZE(TodoDataModel, status)
WCDB_SYNTHESIZE(TodoDataModel, content)
WCDB_SYNTHESIZE(TodoDataModel, remarks)
WCDB_SYNTHESIZE(TodoDataModel, imagePath)
WCDB_SYNTHESIZE(TodoDataModel, time)
WCDB_SYNTHESIZE(TodoDataModel, localID)
//WCDB_PRIMARY_ASC_AUTO_INCREMENT(TodoDataModel, localID)

-(instancetype)initWithContent:(NSString*)content Remarks:(NSString*)remarks ImagePath:(NSString*)path Time:(NSDate*)time Status:(BOOL)status
{
    self=[super init];
    if(self)
    {
        _content = content;
        _remarks = remarks;
        _imagePath = path;
        _time = time;
        _status = status;
        _localID=[self getLocalID];
    }
    return self;

}
-(instancetype)initWithLocalID:(int)localid
{
    self=[super init];
    if(self)
    {
        _localID=localid;
    }
    return self;
}

-(int)getLocalID
{
    NSDate *time = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [time timeIntervalSince1970];
    int t = (int)timeInterval + arc4random() % 100;
    return t;
}
@end
