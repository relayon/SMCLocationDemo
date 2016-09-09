//
//  SMCLocationManager.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/7.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "SMCLocationManager.h"
@import CoreLocation;

#define K_LOG_PRE   @"K_LOG_PRE"

@interface SMCLocationManager () <CLLocationManagerDelegate> {
    CLLocationManager* _locationManager;
    CLGeocoder* _geocoder;
    NSMutableDictionary* _logsDic;
}

@end

@implementation SMCLocationManager

+ (SMCLocationManager*)sharedManager {
    static id locationManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        locationManager = [[self alloc] init];
    });
    
    return locationManager;
}

- (BOOL)canStart:(LocationType)type {
    BOOL bRet = NO;
    
    if (type == LocationType_Standard) {
        bRet = [CLLocationManager locationServicesEnabled];
    } else if (type == LocationType_Significant) {
        bRet = [CLLocationManager significantLocationChangeMonitoringAvailable];
    }
    
    return bRet;
}

- (BOOL)start:(LocationType)type {
    BOOL bRet = NO;
    if (type == LocationType_Standard) {
        bRet = [CLLocationManager locationServicesEnabled];
        if (bRet) {
            [_locationManager startUpdatingLocation];
        }
    } else if (type == LocationType_Significant) {
        bRet = [CLLocationManager significantLocationChangeMonitoringAvailable];
        if (bRet) {
            [_locationManager startMonitoringSignificantLocationChanges];
        }
    }
    return bRet;
}

- (NSMutableString*)logByLocationType:(LocationType)type {
    NSString* logKey = [NSString stringWithFormat:@"%@_%ld", K_LOG_PRE, type];
    NSMutableString* log = [_logsDic objectForKey:logKey];
    if (log == nil) {
        NSMutableString* mLog = [NSMutableString string];
        
        NSUserDefaults* udef = [NSUserDefaults standardUserDefaults];
        NSString* tLog = [udef objectForKey:logKey];
        if (tLog) {
            [mLog appendString:tLog];
        }
        [_logsDic setObject:mLog forKey:logKey];
    }
    
    return log;
}

#pragma mark -- Location Manager
- (instancetype)init {
    self = [super init];
    if (self) {
        [self _initLog];
        [self _initLocationManager];
    }
    return self;
}

- (void)_initLog {
    _logsDic = [NSMutableDictionary dictionary];
}

- (void)_initLocationManager {
    // 判断位置服务状态
    NSString* info;
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusRestricted  //  设置中关闭了位置服务
        || status == kCLAuthorizationStatusDenied) {    // 用户主动拒绝使用位置服务
        info = @"位置服务不可用";
    } else {
        CLLocationManager* manager = [[CLLocationManager alloc] init];
        manager.distanceFilter = 100.0f;
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        manager.delegate = self;
        manager.allowsBackgroundLocationUpdates = YES;
        _locationManager = manager;
        _geocoder = [[CLGeocoder alloc] init];
        if (status == kCLAuthorizationStatusNotDetermined) {
            info = @"请求开启位置服务";
            [_locationManager requestAlwaysAuthorization];
        } else {
            info = [NSString stringWithFormat:@"位置服务状态 == %d, 可开启位置服务", status];
        }
    }
    [self _showStatus:info];
}

- (void)_showStatus:(NSString*)status {
    NSLog(@"status = %@", status);
}

#pragma mark -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"%s", __FUNCTION__);
    CLLocation* loc = locations.lastObject;
    [_geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        NSString* geoInfo;
        if(error == nil && [placemarks count]>0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"name = %@",placemark.name);
            NSLog(@"Country = %@", placemark.country);
            NSLog(@"Postal Code = %@", placemark.postalCode);
            NSLog(@"locality = %@", placemark.locality);
            NSLog(@"subLocality = %@", placemark.subLocality);
            NSLog(@"address = %@",placemark.name);
            NSLog(@"administrativeArea = %@",placemark.administrativeArea);
            NSLog(@"subAdministrativeArea = %@",placemark.subAdministrativeArea);
            NSLog(@"ISOcountryCode = %@",placemark.ISOcountryCode);
            NSLog(@"thoroughfare = %@", placemark.thoroughfare);
            NSLog(@"subThoroughfare = %@",placemark.subThoroughfare);
            geoInfo = placemark.name;
        }
        else if(error==nil && [placemarks count]==0){
            NSLog(@"No results were returned.");
            geoInfo = @"反解析地址失败。";
        }
        else if(error != nil) {
            NSLog(@"An error occurred = %@", error);
            geoInfo = error.localizedDescription;
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
}

@end
