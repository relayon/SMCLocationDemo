//
//  MLogRun.h
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import <Realm/Realm.h>

@interface MLogRun : RLMObject

@property (strong, nonatomic) NSDate* date;
@property (copy, nonatomic) NSString* content;
@property (assign, nonatomic) float battery;
// 0 - Active, 1 - Inactive, 2 - Background
@property (assign, nonatomic) NSInteger applicationState;

@end
