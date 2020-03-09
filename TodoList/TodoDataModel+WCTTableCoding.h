//
//  TodoDataModel+WCTTableCoding.h
//  wcdb
//
//  Created by aru oreki on 2020/2/26.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import "TodoDataModel.h"
#import <WCDB/WCDB.h>

@interface TodoDataModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(status)
WCDB_PROPERTY(content)
WCDB_PROPERTY(remarks)
WCDB_PROPERTY(imagePath)
WCDB_PROPERTY(time)
WCDB_PROPERTY(localID)
@end
