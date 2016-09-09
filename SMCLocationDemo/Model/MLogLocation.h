//
//  MLogLocation.h
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Realm/Realm.h>

@interface MLogLocation : RLMObject

@property (strong, nonatomic) NSDate* date;
@property (assign, nonatomic) float battery;
// 0 - Active, 1 - Inactive, 2 - Background
@property (assign, nonatomic) NSInteger applicationState;

@property double latitude;
@property double longitude;
@property double altitude;
@property double horizontalAccuracy;
@property double verticalAccuracy;
@property double course;
@property double speed;
@property(strong, nonatomic) NSDate* timestamp;

// 0 - user, 1 - System
@property NSInteger launchStatus;

@end
