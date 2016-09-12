//
//  MLocationConfig.h
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/12.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLocationConfig : NSObject

@property NSInteger timeSpan;   // 时间间隔
@property NSInteger timeType;   // 0 - 秒，1 - 分

- (NSTimeInterval)getTimeInterval;

@end
