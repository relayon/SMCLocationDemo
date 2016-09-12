//
//  MLocationConfig.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/12.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "MLocationConfig.h"

@implementation MLocationConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.timeType = 0;  // 秒
        self.timeSpan = 10; // 10秒
    }
    return self;
}

- (NSTimeInterval)getTimeInterval {
    NSTimeInterval interval = 0;
    if (self.timeType == 0) {
        interval = self.timeSpan;
    } else if (self.timeType == 1) {
        interval = self.timeSpan * 60;
    }
    
    return interval;
}

@end
