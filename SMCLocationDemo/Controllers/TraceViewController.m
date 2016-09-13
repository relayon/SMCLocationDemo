//
//  TraceViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/13.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "TraceViewController.h"
#import <BaiduTraceSDK/BaiduTraceSDK-Swift.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import "DeviceInfo.h"

#define T_LATITUDE  31.263805
#define T_LONGITUDE 121.427416

#define T_IDENTIFIER    @"ypc"
#define T_SID   125280

#define K_FENCE_RADIUS  100     // 围栏半径

@interface TraceViewController () <ApplicationServiceDelegate, ApplicationFenceDelegate, BMKMapViewDelegate, BMKLocationServiceDelegate> {
    BTRACE* _traceInstance;
    
    NSMutableString* _logs;
    
    BMKMapView* _mapView;
    BMKLocationService* _locService;
}
- (IBAction)onButtonClear:(id)sender;
- (IBAction)onButtonStart:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TraceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _logs = [NSMutableString string];
    
    //使用鹰眼SDK第一步必须先实例化BTRACE对象
    BTRACE * traceInstance = [[BTRACE alloc] initWithAk:@"ZMqzchrdY7u67A5kNT5APfmL4382y7xF"
                                                  mcode:@"com.smc.test.location"
                                              serviceId:T_SID entityName:T_IDENTIFIER operationMode:2];
    
    //setInterval代表采集周期，packInterval代表打包上传周期
//    BOOL intervalSetRet = [traceInstance setInterval:10 packInterval:60];
    
#if 0
    // 创建围栏
    [[BTRACEAction shared] createCircularFence:self
                                     serviceId:sid
                                     fenceName:@"fenceA"
                                     fenceDesc:@"围栏描述"
                                       creator:T_IDENTIFIER
                              monitoredPersons:T_IDENTIFIER
                                     observers:T_IDENTIFIER
                                    validTimes:@"0000,2359"
                                    validCycle:4
                                     validDate:nil
                                     validDays:nil
                                     coordType:3
                                        center:@"121.427416,31.263805"
                                        radius:500
                                alarmCondition:3
                                     precision:100];
#endif
    
    //开始追踪，异步执行
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[BTRACEAction shared] startTrace:self trace:traceInstance];
    });
    
    NSLog(@"%s", __FUNCTION__);
    _traceInstance = traceInstance;
    
#if 1
    _locService = [[BMKLocationService alloc]init];
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    mapView.zoomLevel = 19;
    mapView.mapType = BMKMapTypeStandard;
//    [self.view addSubview:mapView];
    [self.view insertSubview:mapView atIndex:0];
    
    CLLocationCoordinate2D baiduCoor = CLLocationCoordinate2DMake(T_LATITUDE, T_LONGITUDE);
    //添加 圆形覆盖物
    BMKCircle* circle = [BMKCircle circleWithCenterCoordinate:baiduCoor radius:K_FENCE_RADIUS];
    [mapView addOverlay:circle];
    [mapView setCenterCoordinate:baiduCoor];
    
    _mapView = mapView;
#endif
    
    self.textView.text = @"abcd";
    [self.view bringSubviewToFront:self.textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    //结束轨迹追踪
    [[BTRACEAction shared] stopTrace:self trace:_traceInstance];
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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    
    [_locService stopUserLocationService];
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
//    NSLog(@"heading is %@",userLocation.heading);
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
        newAnnotationView.animatesDrop = NO;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    NSLog(@"%s", __FUNCTION__);
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

#pragma mark -- ApplicationServiceDelegate
- (void)onStartTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"errNo = %ld, msg = %@", errNo, errMsg);
    
    [self notify:[NSString stringWithFormat:@"%s", __FUNCTION__]];
    [self notify:errMsg];
}

/// 获取附加数据的回调方法，开发者需要实现这个方法，在此方法中返回自定义列的键和值
///
/// returns: 用户自定义列的键值对
- (NSDictionary<NSString *, NSString *> * _Nullable)trackAttr {
    NSLog(@"%s", __FUNCTION__);
    NSDictionary* tDic = @{@"name":@"ypc", @"inc":@"smc"};
    return tDic;
}

- (void)onStopTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"errNo = %ld, msg = %@", errNo, errMsg);
    
    [self notify:[NSString stringWithFormat:@"%s", __FUNCTION__]];
    [self notify:errMsg];
}

// 围栏报警
- (void)onPushTrace:(uint8_t)msgType msgContent:(NSString * _Nonnull)msgContent {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"msgType = %i, content = %@", msgType, msgContent);
    [self notify:[NSString stringWithFormat:@"%s", __FUNCTION__]];
    [self notify:msgContent];
}

- (void)onChangeGatherAndPackIntervalsAfterStartTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"errNo = %ld, msg = %@", errNo, errMsg);
    [self notify:[NSString stringWithFormat:@"%s", __FUNCTION__]];
    [self notify:errMsg];
}

- (void)notify:(NSString*)msg {
    [_logs appendString:msg];
    [DeviceInfo scheduleNotification:@"test" body:msg delay:1];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.textView.text = _logs;
    });
}

#if 1
#pragma mark -- ApplicationFenceDelegate
/// 创建地理围栏的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onCreateFence:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

/// 更新地理围栏的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onUpdateFence:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

/// 删除地理围栏的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onDeleteFence:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

/// 查询地理围栏列表的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onFenceList:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

/// 查询地理围栏监控对象的状态的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onQueryFenceStatus:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

/// 查询地理围栏历史报警信息的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onQueryFenceHistoryAlarm:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

/// 设置地理围栏延迟报警的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onFenceDelayAlarm:(NSData * _Nonnull)data {
    NSLog(@"%s - %@", __FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [self notify:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

#endif

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onButtonClear:(id)sender {
    _logs = [NSMutableString string];
    self.textView.text = _logs;
}

- (IBAction)onButtonStart:(id)sender {
    // 创建围栏
    NSString* tCenter = [NSString stringWithFormat:@"%f,%f", T_LONGITUDE, T_LATITUDE];
    [[BTRACEAction shared] createCircularFence:self
                                     serviceId:T_SID
                                     fenceName:@"fenceA"
                                     fenceDesc:@"围栏描述"
                                       creator:T_IDENTIFIER
                              monitoredPersons:T_IDENTIFIER
                                     observers:T_IDENTIFIER
                                    validTimes:@"0000,2359"
                                    validCycle:4
                                     validDate:nil
                                     validDays:nil
                                     coordType:3
                                        center:tCenter
//                                        center:@"121.427416,31.263805"
                                        radius:K_FENCE_RADIUS
                                alarmCondition:3
                                     precision:50];
}
@end
