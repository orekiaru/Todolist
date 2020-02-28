//
//  Model.h
//  TodoList
//
//  Created by aru oreki on 2020/2/25.
//  Copyright © 2020 aru oreki. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property BOOL status;
@property (nonatomic) NSString *data;
@property (nonatomic) NSString *remarks;
@property (nonatomic) NSString *image;
@property (nonatomic) NSDate *time;

-(instancetype)initWithData:(NSString*) data Remarks:(NSString *) remarks Image:(NSString *)image Time:(NSDate *)time Status:(BOOL)status;
@end

NS_ASSUME_NONNULL_END
