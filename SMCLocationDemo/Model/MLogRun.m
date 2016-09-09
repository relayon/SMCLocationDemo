//
//  MLogRun.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "MLogRun.h"
#import "DeviceInfo.h"
#import <UIKit/UIKit.h>

@implementation MLogRun

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.date = [NSDate date];
        self.battery = [DeviceInfo batteryStatus];
        self.applicationState = [[UIApplication sharedApplication] applicationState];
    }
    return self;
}

@end
