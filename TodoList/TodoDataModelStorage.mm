//
//  TodoDataModelStorage.m
//  wcdb
//
//  Created by aru oreki on 2020/2/26.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "TodoDataModelStorage.h"
#import "TodoDataModel.h"
#import "TodoDataModel+WCTTableCoding.h"
#import <WCDB/WCDB.h>
@interface TodoDataModelStorage()
@property (nonatomic, strong) WCTDatabase *database;

@end

@implementation TodoDataModelStorage



/// initializer method
-(instancetype)init
{
    self = [super init];
    if (!self)  return nil;
    
    [self initDatabase];
    return self;
}

-(void)initDatabase
{
    static WCTDatabase *db = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        db = [[WCTDatabase alloc] initWithPath:[docDir stringByAppendingPathComponent:@"my_db"]];
        if ([db canOpen]) {
            [db createTableAndIndexesOfName:@"taskTable" withClass:[TodoDataModel class]];
            //如果表不存在就创建表，如果字段有更新，就更新表，所以不用判断是否已经存在该表
        }
    });
    _database = db;
    
}

-(BOOL)insertDataWithModel:(TodoDataModel*)model
{
    return [_database insertObject:model
                        into:@"taskTable"];
}

-(NSArray<TodoDataModel*>*)select
{
    return  [_database getObjectsOfClass:TodoDataModel.class
                               fromTable:@"taskTable"
                                 orderBy:TodoDataModel.localID.order()];
}

-(BOOL)deleteDataWithModel:(TodoDataModel *)model
{
    
    return [self.database deleteObjectsFromTable:@"taskTable" where:TodoDataModel.localID==model.localID];
}



- (BOOL)updateDataWithModel:(TodoDataModel *)model
{
    BOOL result = [self.database updateRowsInTable:@"taskTable"
                                      onProperties:{TodoDataModel.content, TodoDataModel.remarks, TodoDataModel.time,TodoDataModel.status,TodoDataModel.imagePath}
                                        withObject:model
                                             where:TodoDataModel.localID == model.localID];
    return result;

}


@end
