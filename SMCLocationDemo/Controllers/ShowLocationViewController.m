//
//  ShowLocationViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "ShowLocationViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import "NSDate+String.h"

@interface ShowLocationViewController () <BMKMapViewDelegate> {
    BMKMapView* _mapView;
}

@end

@implementation ShowLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    mapView.zoomLevel = 17;
    mapView.mapType = BMKMapTypeStandard;
    [self.view addSubview:mapView];
    
    _mapView = mapView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_mapView viewWillAppear];
    _mapView.delegate = self;
    
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
    MLogLocation* loc = self.location;
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);//原始坐标
    //转换GPS坐标至百度坐标(加密后的坐标)
    NSDictionary* testdic = BMKConvertBaiduCoorFrom(coor,BMK_COORDTYPE_GPS);
    //解密加密后的坐标字典
    CLLocationCoordinate2D baiduCoor = BMKCoorDictionaryDecode(testdic);//转换后的百度坐标
    [_mapView setCenterCoordinate:baiduCoor];
    
    // annotation
    BMKPointAnnotation* ann = [BMKPointAnnotation new];
    ann.coordinate = baiduCoor;
    ann.title = [NSString stringWithFormat:@"%f", loc.horizontalAccuracy];
    ann.subtitle = [loc.timestamp hy_stringDefault];
    
    [_mapView addAnnotation:ann];
    
    // overlay
    //添加 圆形覆盖物
    BMKCircle* circle = [BMKCircle circleWithCenterCoordinate:baiduCoor radius:loc.horizontalAccuracy];
    [_mapView addOverlay:circle];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = NO;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

// Override
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKCircle class]]){
        //        BMKCircleView* circleView = [[[BMKCircleView alloc] initWithOverlay:overlay] autorelease];
        BMKCircleView* circleView = [[BMKCircleView alloc] initWithOverlay:overlay];
        circleView.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        circleView.strokeColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
        circleView.lineWidth = 2.0;
        
        return circleView;
    }
    return nil;
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
