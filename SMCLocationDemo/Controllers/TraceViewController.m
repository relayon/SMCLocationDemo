//
//  TraceViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/13.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "TraceViewController.h"
#import <BaiduTraceSDK/BaiduTraceSDK-Swift.h>
#import "DeviceInfo.h"

@interface TraceViewController () <ApplicationServiceDelegate, ApplicationFenceDelegate> {
    BTRACE* _traceInstance;
    
    NSMutableString* _logs;
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
    
    NSString* identifier = @"ypc";
    long long sid = 125280;
    
    //使用鹰眼SDK第一步必须先实例化BTRACE对象
    BTRACE * traceInstance = [[BTRACE alloc] initWithAk:@"ZMqzchrdY7u67A5kNT5APfmL4382y7xF"
                                                  mcode:@"com.smc.test.location"
                                              serviceId:sid entityName:identifier operationMode:2];
    
    //setInterval代表采集周期，packInterval代表打包上传周期
//    BOOL intervalSetRet = [traceInstance setInterval:10 packInterval:60];
    
#if 0
    // 创建围栏
    [[BTRACEAction shared] createCircularFence:self
                                     serviceId:sid
                                     fenceName:@"fenceA"
                                     fenceDesc:@"围栏描述"
                                       creator:identifier
                              monitoredPersons:identifier
                                     observers:identifier
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    //结束轨迹追踪
    [[BTRACEAction shared] stopTrace:self trace:_traceInstance];
}

#pragma mark -- ApplicationServiceDelegate
- (void)onStartTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"errNo = %ld, msg = %@", errNo, errMsg);
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
}

- (void)onPushTrace:(uint8_t)msgType msgContent:(NSString * _Nonnull)msgContent {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"msgType = %i, content = %@", msgType, msgContent);
}

- (void)onChangeGatherAndPackIntervalsAfterStartTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"errNo = %ld, msg = %@", errNo, errMsg);
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
    NSString* identifier = @"ypc";
    long long sid = 125280;
    // 创建围栏
    [[BTRACEAction shared] createCircularFence:self
                                     serviceId:sid
                                     fenceName:@"fenceA"
                                     fenceDesc:@"围栏描述"
                                       creator:identifier
                              monitoredPersons:identifier
                                     observers:identifier
                                    validTimes:@"0000,2359"
                                    validCycle:4
                                     validDate:nil
                                     validDays:nil
                                     coordType:3
                                        center:@"121.427416,31.263805"
                                        radius:500
                                alarmCondition:3
                                     precision:100];
}
@end
