//
//  BaiduMapViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/12.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "BaiduMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import "MLogLocation.h"

@interface BaiduMapViewController () <BMKMapViewDelegate, BMKLocationServiceDelegate> {
    BMKMapView* _mapView;
    BMKLocationService* _locService;
    
    RLMResults* _locationResults;
    RLMNotificationToken* _dataChange;
}

@end

@implementation BaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _locService = [[BMKLocationService alloc]init];
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    mapView.zoomLevel = 17;
    mapView.mapType = BMKMapTypeStandard;
    [self.view addSubview:mapView];
    
    _mapView = mapView;
    
    _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
    [self _updateAnnotation];
    _dataChange = [[RLMRealm defaultRealm] addNotificationBlock:^(NSString *notification, RLMRealm *realm) {
        _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
        [self _updateAnnotation];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self _updateAnnotation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    
    [_locService stopUserLocationService];
}

#pragma mark -- Annotation
- (void)_updateAnnotation {
    [_mapView removeAnnotations:_mapView.annotations];
    
//    NSMutableArray* mary = [NSMutableArray array];
    if (_locationResults.count > 0) {
        NSInteger count = _locationResults.count;
        for (NSInteger idx = 0; idx < count; idx++) {
            MLogLocation* loc = [_locationResults objectAtIndex:idx];
//            MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
//            ann.coordinate = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);
            BMKPointAnnotation* ann = [BMKPointAnnotation new];
//            ann.coordinate = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);
            
            CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);//原始坐标
            //转换 google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标至百度坐标
            NSDictionary* testdic = BMKConvertBaiduCoorFrom(coor,BMK_COORDTYPE_GPS);
            //转换GPS坐标至百度坐标(加密后的坐标)
//            testdic = BMKConvertBaiduCoorFrom(coor,BMK_COORDTYPE_GPS);
//            NSLog(@"x=%@,y=%@",[testdic objectForKey:@"x"],[testdic objectForKey:@"y"]);
            //解密加密后的坐标字典
            CLLocationCoordinate2D baiduCoor = BMKCoorDictionaryDecode(testdic);//转换后的百度坐标
            ann.coordinate = baiduCoor;
            
            [_mapView addAnnotation:ann];
        }
    }
    
//    if (_locationResults.count > 0) {
//        MLogLocation* tLoc = [_locationResults lastObject];
//        BMKUserLocation* uLoc =
//    }
    
}

/**
 *在地图View将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
