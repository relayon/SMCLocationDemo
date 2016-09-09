//
//  SMCLocationManager.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/7.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "SMCLocationManager.h"
#import "DeviceInfo.h"
#import "MLogLocation.h"
@import UIKit;
@import CoreLocation;

#define K_LOCATION_SERVICE_STARTED   @"K_LOCATION_SERVICE_STARTED"

@interface SMCLocationManager () <CLLocationManagerDelegate> {
    CLLocationManager* _locationManager;
    CLGeocoder* _geocoder;
    
    LocationType _currentLocationType;
    
    NSInteger _launchStatus;
    NSTimer* _locationTimer;
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

- (void)launchWithOptions:(NSDictionary*)launchOptions {
    id locationInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsLocationKey];
    if (locationInfo) {
        _launchStatus = 1;
        [self start:_currentLocationType];
    }
}

- (void)willTerminate {
    NSLog(@"%s", __FUNCTION__);
    
    [DeviceInfo scheduleNotification:@"tip" body:@"App运行异常，已自动签出！" delay:1];
    
    BOOL started = [self serviceStarted];
    if (started) {
        [_locationManager stopUpdatingLocation];
        [_locationManager startMonitoringSignificantLocationChanges];
    }
}

- (BOOL)start:(LocationType)type {
    
    BOOL bRet = NO;
    [_locationManager stopMonitoringSignificantLocationChanges];
    
    [self _bestAccuracy];
    bRet = [CLLocationManager locationServicesEnabled];
    if (bRet) {
        [_locationManager startUpdatingLocation];
    } else {
        NSLog(@"位置服务不可用！");
    }
    
    [self setServiceStarted:YES];
    
    return bRet;
    
#if 0
    _currentLocationType = type;
    
    BOOL bRet = NO;
    if (type == LocationType_Standard) {
        [_locationManager stopMonitoringSignificantLocationChanges];
        [self _bestAccuracy];
        bRet = [CLLocationManager locationServicesEnabled];
        if (bRet) {
            [_locationManager startUpdatingLocation];
        }
    } else if (type == LocationType_Significant) {
        [self _significantAccuracy];
        bRet = [CLLocationManager significantLocationChangeMonitoringAvailable];
        if (bRet) {
            [_locationManager startMonitoringSignificantLocationChanges];
        }
    }
    return bRet;
#endif
}

- (void)stop {
    BOOL started = [self serviceStarted];
    if (started) {
        [self setServiceStarted:NO];
        
        [_locationManager stopUpdatingLocation];
    }
}

#pragma mark -- Service Status
- (BOOL)serviceStarted {
    BOOL started = NO;
    
    NSNumber* status = [[NSUserDefaults standardUserDefaults] objectForKey:K_LOCATION_SERVICE_STARTED];
    if (status) {
        started = [status boolValue];
    }
    
    return started;
}

- (void)setServiceStarted:(BOOL)started {
    NSNumber* status = [NSNumber numberWithBool:started];
    [[NSUserDefaults standardUserDefaults] setObject:status forKey:K_LOCATION_SERVICE_STARTED];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark -- Location Manager
- (instancetype)init {
    self = [super init];
    if (self) {
        _launchStatus = 0;
        [self _initLocationManager];
        
        _currentLocationType = LocationType_Standard;
        BOOL started = [self serviceStarted];
        if (started) {
            [self start:_currentLocationType];
        } else {
            
        }
    }
    return self;
}

- (void)_bestAccuracy {
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
}

- (void)_significantAccuracy {
    _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    _locationManager.distanceFilter = 9999;
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
        manager.delegate = self;
        manager.allowsBackgroundLocationUpdates = YES;
        _locationManager = manager;
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
    NSLog(@"location = %@", loc);
    NSTimeInterval interval = loc.timestamp.timeIntervalSinceNow;
    NSLog(@"interval = %f", interval);
    CLLocationAccuracy accuracy =  _locationManager.desiredAccuracy;
    if (fabs(interval) < 10 && accuracy != kCLLocationAccuracyThreeKilometers) {
        // TODO:// record the location
        NSLog(@"TODO:// record the location");
        MLogLocation* location = [MLogLocation new];
        location.latitude = loc.coordinate.latitude;
        location.longitude = loc.coordinate.longitude;
        location.altitude = loc.altitude;
        location.horizontalAccuracy = loc.horizontalAccuracy;
        location.verticalAccuracy = loc.verticalAccuracy;
        location.course = loc.course;
        location.speed = loc.speed;
        location.timestamp = loc.timestamp;
        location.launchStatus = _launchStatus;
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        [realm transactionWithBlock:^{
            [realm addObject:location];
        }];
        
        _locationTimer = [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
            // 设置精度，获取精确位置
            [self _bestAccuracy];
        }];
        
        // 设置粗精度，不再获取位置
        [self _significantAccuracy];
    }
    
    
#if 0
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
#endif
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"%s - %@", __FUNCTION__, error);
}

@end
