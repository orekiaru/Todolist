//
//  TodoDataModel.h
//  wcdb
//
//  Created by aru oreki on 2020/2/26.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoDataModel : NSObject

@property BOOL status;
@property(assign) int localID;
@property(nonatomic, retain) NSString *content;
@property(nonatomic, retain) NSString *remarks;
@property(nonatomic, retain) NSString *imagePath;
@property(nonatomic, retain) NSDate *time;

-(instancetype)initWithContent:(NSString*)content Remarks:(NSString*)remarks ImagePath:(NSString*)path Time:(NSDate*)time Status:(BOOL)status;
-(instancetype)initWithLocalID:(int)localid;
@end
