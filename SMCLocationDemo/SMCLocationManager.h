//
//  SMCLocationManager.h
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/7.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LocationType) {
    LocationType_Standard,
    LocationType_Significant,
};

@interface SMCLocationManager : NSObject

+ (SMCLocationManager*)sharedManager;

- (BOOL)start:(LocationType)type;

- (NSMutableString*)logByLocationType:(LocationType)type;

@end
