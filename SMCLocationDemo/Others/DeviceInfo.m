//
//  DeviceInfo.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "DeviceInfo.h"
#import <UIKit/UIKit.h>

@implementation DeviceInfo

+ (void)monitorBattery {
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
}
+ (float)batteryStatus {
    float batteryLevel = [[UIDevice currentDevice] batteryLevel];
    return batteryLevel;
//    NSLog(@"battery level = %f", batteryLevel);
//    NSString* status = [NSString stringWithFormat:@"%.3f", batteryLevel];
//    return status;
}

+ (void)requestNotification {
    UIUserNotificationType types = (UIUserNotificationType) (UIUserNotificationTypeBadge |
                                                             UIUserNotificationTypeSound | UIUserNotificationTypeAlert);
    UIUserNotificationSettings *mySettings =
    [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
}

#pragma mark -- local notification
+ (void)scheduleNotification:(NSString*)nid body:(NSString*)body delay:(NSTimeInterval)seconds {
    UILocalNotification* notify = [UILocalNotification new];
    //NSDate* now = [NSDate date];
    NSDate* fDate = [NSDate dateWithTimeIntervalSinceNow:seconds];
    
    notify.fireDate = fDate;
    notify.alertBody = body;
    notify.soundName=UILocalNotificationDefaultSoundName;
    NSDictionary *info = [NSDictionary dictionaryWithObject:nid forKey:nid];
    notify.userInfo = info;
    notify.repeatInterval = 0;
    
    //    [formatter release];
    [[UIApplication sharedApplication] scheduleLocalNotification:notify];
}

+ (void)removeNotification:(NSString*)nid {
    if (nid && nid.length > 0) {
        // 获得 UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        //获取本地推送数组
        NSArray *localArray = [app scheduledLocalNotifications];
        if (localArray)
        {
            for (UILocalNotification *noti in localArray)
            {
                NSDictionary *dict = noti.userInfo;
                if (dict)
                {
                    NSString* pObj = (NSString*)[dict objectForKey:nid];
                    if ([pObj isEqualToString:nid]) {
                        //取消推送
                        [app cancelLocalNotification:noti];
                        break;
                    }
                }
            }
        }
    }
    
}

@end
