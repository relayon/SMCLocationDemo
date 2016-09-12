//
//  SMCLocationManager.h
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/7.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLocationConfig.h"

typedef NS_ENUM(NSInteger, LocationType) {
    LocationType_Standard,
    LocationType_Significant,
    LocationType_Region,
};

@interface SMCLocationManager : NSObject

+ (SMCLocationManager*)sharedManager;

- (MLocationConfig*)getLocationConfig;
- (void)setLocationConfig:(MLocationConfig*)config;

- (void)launchWithOptions:(NSDictionary*)launchOptions;
- (void)willTerminate;

- (BOOL)start:(LocationType)type;
- (void)stop;

- (void)setServiceStarted:(BOOL)started;
- (BOOL)serviceStarted;

// 获取 位置服务 的启动类型
- (NSString*)getLaunchStatus:(NSInteger)launchStatus;
- (NSString*)getAppStatus:(NSInteger)appStatus;



@end
