//
//  TodoDataModelStorage.h
//  wcdb
//
//  Created by aru oreki on 2020/2/26.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TodoDataModelStorage : NSObject

-(instancetype)init;
-(NSArray<TodoDataModel*>*)select;
-(BOOL)insertDataWithModel:(TodoDataModel*)model;
-(BOOL)deleteDataWithModel:(TodoDataModel *)model;
- (BOOL)updateDataWithModel:(TodoDataModel *)model;
@end

NS_ASSUME_NONNULL_END
