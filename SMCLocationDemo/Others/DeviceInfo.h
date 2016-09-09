//
//  DeviceInfo.h
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfo : NSObject

+ (void)monitorBattery;
+ (float)batteryStatus;

+ (void)requestNotification;
+ (void)scheduleNotification:(NSString*)nid body:(NSString*)body delay:(NSTimeInterval)seconds;
+ (void)removeNotification:(NSString*)nid;

@end
