// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import ObjectiveC;
@import CoreLocation;
@import Foundation;
@import Foundation.NSURLSession;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSData;


/// Entity相关的HTTP请求的协议,包括entity相关HTTP请求的回调方法
SWIFT_PROTOCOL("_TtP13BaiduTraceSDK25ApplicationEntityDelegate_")
@protocol ApplicationEntityDelegate
@optional

/// 创建 Entity 的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onAddEntity:(NSData * _Nonnull)data;

/// 更新 Entity 的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onUpdateEntity:(NSData * _Nonnull)data;

/// 查询 Entity的列表 的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onQueryEntityList:(NSData * _Nonnull)data;
@end



/// 地理围栏相关HTTP请求的协议,包括地理围栏相关HTTP请求的回调方法
SWIFT_PROTOCOL("_TtP13BaiduTraceSDK24ApplicationFenceDelegate_")
@protocol ApplicationFenceDelegate
@optional

/// 创建地理围栏的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onCreateFence:(NSData * _Nonnull)data;

/// 更新地理围栏的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onUpdateFence:(NSData * _Nonnull)data;

/// 删除地理围栏的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onDeleteFence:(NSData * _Nonnull)data;

/// 查询地理围栏列表的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onFenceList:(NSData * _Nonnull)data;

/// 查询地理围栏监控对象的状态的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onQueryFenceStatus:(NSData * _Nonnull)data;

/// 查询地理围栏历史报警信息的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onQueryFenceHistoryAlarm:(NSData * _Nonnull)data;

/// 设置地理围栏延迟报警的回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onFenceDelayAlarm:(NSData * _Nonnull)data;
@end



/// 轨迹服务的协议，,包括轨迹服务相关的回调方法
SWIFT_PROTOCOL("_TtP13BaiduTraceSDK26ApplicationServiceDelegate_")
@protocol ApplicationServiceDelegate
@optional

/// 开始轨迹服务的回调方法
///
/// param:
///
/// errNo 状态码
///
/// errMsg 状态信息
///
/// 0代表连接服务器成功；
///
/// 10002代表参数错误；
///
/// 10003代表轨迹服务类型错误；
///
/// 10007代表连接服务器失败,已开始采集轨迹,并进入缓存模式；
///
/// 10008代表连接服务器失败,当网络恢复后会自动重新登录；
///
/// 10009代表重新和服务端连接成功
- (void)onStartTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg;

/// 获取附加数据的回调方法，开发者需要实现这个方法，在此方法中返回自定义列的键和值
///
/// returns: 用户自定义列的键值对
- (NSDictionary<NSString *, NSString *> * _Nullable)trackAttr;

/// 结束行程回调方法
///
/// param:
///
/// errNo 状态码
///
/// errMsg 状态信息
///
/// 0代表结束轨迹服务成功
///
/// 11000代表结束服务请求发送失败,已停止采集
///
/// 11002代表轨迹服务还未开启
- (void)onStopTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg;

/// 推送信息回调方法
///
/// param:
///
/// msgType 代表推送消息的类型
///
/// 0x01：配置下发;
/// 0x02：语音消息;
/// 0x03：围栏报警消息;
/// 0x04：客户端围栏报警消息;
/// 0x05~0x40：系统预留;
/// 0x41~0xFF：开发者自定义;
///
/// msgContent 代表推送消息的内容 按JSON解析,包含如下字段
///
/// fence_id 围栏的id;
/// fence 围栏的名称;
/// monitored_person 该围栏监控的对象;
/// action 被监控对象进出该围栏的动作 1代表进入围栏 2代表离开围栏;
/// time 代表该动作发生的时间
- (void)onPushTrace:(uint8_t)msgType msgContent:(NSString * _Nonnull)msgContent;

/// 改变采集和打包周期的回调方法
///
/// param:
///
/// msgType    状态码
///
/// msgContent 状态信息
///
/// 0 设置成功
///
/// 1 设置失败
///
/// 2 参数错误
- (void)onChangeGatherAndPackIntervalsAfterStartTrace:(NSInteger)errNo errMsg:(NSString * _Nonnull)errMsg;
@end



/// track相关HTTP请求的协议,包括track相关HTTP请求的回调方法
SWIFT_PROTOCOL("_TtP13BaiduTraceSDK24ApplicationTrackDelegate_")
@protocol ApplicationTrackDelegate
@optional

/// 历史轨迹查询回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onGetHistoryTrack:(NSData * _Nonnull)data;

/// 里程查询回调方法
///
/// param:
///
/// data JSON格式的返回内容
- (void)onQueryDistance:(NSData * _Nonnull)data;
@end




/// 轨迹类
SWIFT_CLASS("_TtC13BaiduTraceSDK6BTRACE")
@interface BTRACE : NSObject

/// 构造函数
///
/// param:
///
/// ak 在api控制台申请
///
/// mcode 申请ak时对应的安全码
///
/// serviceId 鹰眼服务的唯一标识
///
/// entityName entity的唯一标识
///
/// operationMode 轨迹服务类型(0:不建立长连接, 1:建立长连接但不采集数据, 2:建立长连接并采集数据)
- (nonnull instancetype)initWithAk:(NSString * _Nonnull)ak mcode:(NSString * _Nonnull)mcode serviceId:(long long)serviceId entityName:(NSString * _Nonnull)entityName operationMode:(NSInteger)operationMode OBJC_DESIGNATED_INITIALIZER;

/// 设置采集周期和打包周期
///
/// param:
///
/// gatherInterval 采集周期 取值范围[2, 60] 单位 秒
///
/// packInterval 打包周期 取值范围[2, 60] 单位 秒
///
/// 打包周期必须比采集周期大，且必须是采集周期的整数倍
///
/// return:
///
/// TRUE设置成功 FALSE代表设置失败
- (BOOL)setInterval:(int32_t)gatherInterval packInterval:(int32_t)packInterval;
@end



/// 该类封装了鹰眼SDK中所有的方法
SWIFT_CLASS("_TtC13BaiduTraceSDK12BTRACEAction")
@interface BTRACEAction : NSObject
+ (BTRACEAction * _Nonnull)shared;

/// 开始轨迹服务
///
/// param:
///
/// delegate 轨迹服务的代理
///
/// trace 轨迹类的对象
- (void)startTrace:(id <ApplicationServiceDelegate> _Nonnull)delegate trace:(BTRACE * _Nonnull)trace;

/// 结束轨迹服务
///
/// param:
///
/// delegate 轨迹服务的代理
///
/// trace 轨迹类的对象
- (void)stopTrace:(id <ApplicationServiceDelegate> _Nonnull)delegate trace:(BTRACE * _Nonnull)trace;

/// 设置采集周期和打包周期, 此方法用于已经startTrace服务后想改变采集和打包周期的情况
///
/// param:
///
/// gatherInterval 采集周期
///
/// packInterval 打包周期
///
/// delegate 轨迹服务的代理
- (void)changeGatherAndPackIntervalsAfterStartTrace:(id <ApplicationServiceDelegate> _Nonnull)delegate gatherInterval:(int32_t)gatherInterval packInterval:(int32_t)packInterval;

/// 设置定位相关的属性
///
/// param:
///
/// activityType 定位设备的活动类型 0代表步行，1代表汽车，2代表火车高铁等，3代表其他
///
/// desiredAccuracy 需要的定位精度 0代表最高定位精度，此选项定位最为精确，适用于导航等场景，只有手机插上电源才有效； 1代表米级别的定位精度，是不插电源情况下的最高定位精度；2代表十米级别的定位精度；3代表百米级别的定位精度；4代表千米级别的定位精度；5代表最低定位精度，偏移可能达到几公里以上
///
/// distanceFilter 触发定位的距离阈值, 单位是米
- (void)setAttributeOfLocation:(NSInteger)activityType desiredAccuracy:(NSInteger)desiredAccuracy distanceFilter:(double)distanceFilter;

/// 查询所有符合条件的entity信息及其实时位置
///
/// param:
///
/// serviceId 鹰眼服务ID
///
/// entityNames 要检索的entity_name集合, string, "entity1,entity2,entity3" entity_name之间用英文逗号分开
///
/// columnKey 开发者自定义的entity属性字段
///
/// activeTime 活跃时间
///
/// returnType 返回结果的类型
///
/// pageSize 分页大小
///
/// pageIndex 分页索引
- (void)queryEntityList:(id <ApplicationEntityDelegate> _Nonnull)delegate serviceId:(long long)serviceId entityNames:(NSString * _Nullable)entityNames columnKey:(NSString * _Nullable)columnKey activeTime:(NSInteger)activeTime returnType:(NSInteger)returnType pageSize:(NSInteger)pageSize pageIndex:(NSInteger)pageIndex;

/// 添加一个新的entity，一个entity可以是一个人、一辆车、或者任何运动的物体
///
/// param:
///
/// serviceId 鹰眼服务ID
///
/// entityName entity名称，作为其唯一标识
///
/// columnKey 开发者自定义的entity属性字段
- (void)addEntity:(id <ApplicationEntityDelegate> _Nonnull)delegate serviceId:(long long)serviceId entityName:(NSString * _Nonnull)entityName columnKey:(NSString * _Nullable)columnKey;

/// 更新entity信息
///
/// param:
///
/// serviceId 鹰眼服务ID
///
/// entityName entity名称，作为其唯一标识
///
/// columnKey 开发者自定义的entity属性字段
- (void)updateEntity:(id <ApplicationEntityDelegate> _Nonnull)delegate serviceId:(long long)serviceId entityName:(NSString * _Nonnull)entityName columnKey:(NSString * _Nullable)columnKey;

/// 通过serviceId和entityName查找本entity历史轨迹点的具体信息，包括经纬度，时间，其他用户自定义信息等。
///
/// param:
///
/// serviceId 鹰眼服务ID
///
/// entityName entity唯一标识
///
/// startTime 起始时间 UNIX时间戳
///
/// endTime 结束时间 UNIX时间戳 结束时间不超过当前时间，不能早于起始时间，且与起始时间差在24小时之内。
///
/// simpleReturn 是否返回精简结果  0代表返回原始结果，1代表返回精简结果，2代表只返回本段轨迹的里程。
///
/// isProcesed 是否返回纠偏后轨迹  0为返回原始轨迹，1为返回纠偏轨迹。
///
/// pageSize 分页大小; int(1-5000); 返回结果最大个数与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
///
/// pageIndex 分页索引; int(1到2^21-1); 与pageSize一起计算从第几条结果返回，代表返回第几页。
- (void)getTrackHistory:(id <ApplicationTrackDelegate> _Nonnull)delegate serviceId:(long long)serviceId entityName:(NSString * _Nonnull)entityName startTime:(long long)startTime endTime:(long long)endTime simpleReturn:(NSInteger)simpleReturn isProcessed:(NSInteger)isProcessed pageSize:(NSInteger)pageSize pageIndex:(NSInteger)pageIndex;

/// 可以指定纠偏选项及里程补偿方式的历史轨迹查询
///
/// param:
///
/// serviceId 鹰眼服务ID
///
/// entityName entity唯一标识
///
/// startTime 起始时间 UNIX时间戳
///
/// endTime 结束时间 UNIX时间戳 结束时间不超过当前时间，不能早于起始时间，且与起始时间差在24小时之内。
///
/// simpleReturn 是否返回精简结果  0代表返回原始结果，1代表返回精简结果，2代表只返回本段轨迹的里程。
///
/// isProcesed 是否返回纠偏后轨迹  0为返回原始轨迹，1为返回纠偏轨迹。
///
/// processOption 纠偏选项; 只在isProcessed＝1时生效 可以为nil的string类型; need_denoise:去噪，默认为1; need_vacuate:抽稀，默认为1; need_mapmatch: 绑路（仅适用于驾车),之前未开通绑路的service，默认值为0; 之前已开通绑路的service，默认值为1; 多选项设置时用英文逗号","分割，若不设置某选项则按默认值处理, 若整个选项的值为nil, 则去燥抽稀绑路都按默认值处理。【示例】"need_denoise=1,need_vacuate=1,need_mapmatch=0"
///
/// supplementMode 里程补偿方式; 可以为nil的string类型; 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹提供以下5种里程估算方式。no_supplement：不补充，中断两点间距离不记入里程。straight:使用直线距离补充; driving:使用最短驾车路线距离补充; riding:使用最短骑行路线距离补充; walking:使用最短步行路线距离补充; 如果此字段的值为nil时, 代表不进行里程补偿
///
/// pageSize 分页大小; int(1-5000); 返回结果最大个数与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
///
/// pageIndex 分页索引; int(1到2^21-1); 与pageSize一起计算从第几条结果返回，代表返回第几页。
- (void)getTrackHistory:(id <ApplicationTrackDelegate> _Nonnull)delegate serviceId:(long long)serviceId entityName:(NSString * _Nonnull)entityName startTime:(long long)startTime endTime:(long long)endTime simpleReturn:(NSInteger)simpleReturn isProcessed:(NSInteger)isProcessed processOption:(NSString * _Nullable)processOption supplementMode:(NSString * _Nullable)supplementMode pageSize:(NSInteger)pageSize pageIndex:(NSInteger)pageIndex;

/// 查询一段时间段内的里程(单位:米)
///
/// param:
///
/// serviceId 鹰眼服务ID
///
/// entityName entity唯一标识
///
/// startTime 起始时间 UNIX时间戳
///
/// endTime 结束时间 UNIX时间戳 结束时间不超过当前时间，不能早于起始时间，且与起始时间差在24小时之内。
///
/// isProcesed 是否适用纠偏后的轨迹进行里程计算  0为使用原始轨迹; 1为使用纠偏后的轨迹
///
/// processOption 纠偏选项; 只在isProcessed＝1时生效 可以为nil的string类型; need_denoise:去噪，默认为1; need_vacuate:抽稀，默认为1; need_mapmatch: 绑路（仅适用于驾车),之前未开通绑路的service，默认值为0; 之前已开通绑路的service，默认值为1; 多选项设置时用英文逗号","分割，若不设置某选项则按默认值处理, 若整个选项的值为nil, 则去燥抽稀绑路都按默认值处理。【示例】"need_denoise=1,need_vacuate=1,need_mapmatch=0"
///
/// supplementMode 里程补偿方式; 可以为nil的string类型; 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹提供以下5种里程估算方式。no_supplement：不补充，中断两点间距离不记入里程。straight:使用直线距离补充; driving:使用最短驾车路线距离补充; riding:使用最短骑行路线距离补充; walking:使用最短步行路线距离补充; 如果此字段的值为nil时, 代表不进行里程补偿
- (void)queryDistance:(id <ApplicationTrackDelegate> _Nonnull)delegate serviceId:(long long)serviceId entityName:(NSString * _Nonnull)entityName isProcessed:(NSInteger)isProcessed processOption:(NSString * _Nullable)processOption supplementMode:(NSString * _Nullable)supplementMode startTime:(long long)startTime endTime:(long long)endTime;

/// 创建一个新的圆形围栏
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// fenceName 围栏名称
///
/// fenceDesc 围栏描述; string(1024)
///
/// creator 围栏创建者; string; 创建者的entityName
///
/// monitoredPersons 监控对象; string;被监控者的entityName。
///
/// observers 观察者列表; string;	观察者的entityName。
///
/// validTimes 围栏生效时间列表; "string,string;string,string;…"; 一天中的几点几分到几点几分生效。至少含有一段生效时间，多个时间段使用分号”;”分隔。比如：“0820,0930;1030,1130”
///
/// validCycle 围栏生效周期; int; 标识valid_times是否周期性生效，可以使用如下数值 1：不重复 2：工作日循环 3：周末循环 4：每天循环 5：自定义 当为5时，需要定义valid_days，标识在周几生效。当validCycle为1时，必须设置validDate字段，当validCycle为5时，必须设置validDays字段。
///
/// validDate 围栏生效日期; string; 当valid_cycle为1时必须设置此字段的值，例如：20150908。
///
/// validDays 围栏生效日期列表; int,int...; 1到7，分别表示周一到周日，当valid_cycle为5时必须设置此字段的值。
///
/// coordType 坐标类型; int(1,3); 坐标类型定义如下：1：GPS经纬度 2：国测局经纬度 3：百度经纬度
///
/// center 围栏圆心经纬度; double,double; 格式为：经度,纬度; 示例：116.4321,38.76623
///
/// radius 围栏半径; double(0, 5000]; 单位：米.
///
/// alarmCondition 围栏报警条件; int; 1：进入时触发提醒 2：离开时触发提醒 3：进入离开均触发提醒
///
/// precision 围栏去燥的精度; int; 当采集到的轨迹点的定位精度超过此阈值时，将不会触发围栏. 如果需要所有的轨迹点，无论定位精度是多少都去触发围栏计算, 设置为0（可能造成围栏误报警）
- (void)createCircularFence:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceName:(NSString * _Nonnull)fenceName fenceDesc:(NSString * _Nullable)fenceDesc creator:(NSString * _Nonnull)creator monitoredPersons:(NSString * _Nonnull)monitoredPersons observers:(NSString * _Nonnull)observers validTimes:(NSString * _Nonnull)validTimes validCycle:(NSInteger)validCycle validDate:(NSString * _Nullable)validDate validDays:(NSString * _Nullable)validDays coordType:(NSInteger)coordType center:(NSString * _Nonnull)center radius:(double)radius alarmCondition:(NSInteger)alarmCondition precision:(NSInteger)precision;

/// 创建一个新的多边形围栏
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// fenceName 围栏名称
///
/// fenceDesc 围栏描述; string(1024)
///
/// creator 围栏创建者; string; 创建者的entityName
///
/// monitoredPersons 监控对象; string;被监控者的entityName。
///
/// observers 观察者列表; string;	观察者的entityName。
///
/// validTimes 围栏生效时间列表; "string,string;string,string;…"; 一天中的几点几分到几点几分生效。至少含有一段生效时间，多个时间段使用分号”;”分隔。比如：“0820,0930;1030,1130”
///
/// validCycle 围栏生效周期; int; 标识valid_times是否周期性生效，可以使用如下数值 1：不重复 2：工作日循环 3：周末循环 4：每天循环 5：自定义 当为5时，需要定义valid_days，标识在周几生效。当validCycle为1时，必须设置validDate字段，当validCycle为5时，必须设置validDays字段。
///
/// validDate 围栏生效日期; string; 当valid_cycle为1时必须设置此字段的值，例如：20150908。
///
/// validDays 围栏生效日期列表; int,int...; 1到7，分别表示周一到周日，当valid_cycle为5时必须设置此字段的值。
///
/// coordType 坐标类型; int(1,3); 坐标类型定义如下：1：GPS经纬度 2：国测局经纬度 3：百度经纬度
///
/// vertexes 多边形顶点列表（顶点为多边形顺时针或逆时针顺序，格式: "经度,纬度;....")
///
/// alarmCondition 围栏报警条件; int; 1：进入时触发提醒 2：离开时触发提醒 3：进入离开均触发提醒
///
/// precision 围栏去燥的精度; int; 当采集到的轨迹点的定位精度超过此阈值时，将不会触发围栏. 如果需要所有的轨迹点，无论定位精度是多少，都去触发围栏计算（可能造成围栏误报警）
- (void)createVertexesFence:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceName:(NSString * _Nonnull)fenceName fenceDesc:(NSString * _Nullable)fenceDesc creator:(NSString * _Nonnull)creator monitoredPersons:(NSString * _Nonnull)monitoredPersons observers:(NSString * _Nonnull)observers validTimes:(NSString * _Nonnull)validTimes validCycle:(NSInteger)validCycle validDate:(NSString * _Nullable)validDate validDays:(NSString * _Nullable)validDays coordType:(NSInteger)coordType vertexes:(NSString * _Nonnull)vertexes alarmCondition:(NSInteger)alarmCondition precision:(NSInteger)precision;



/// 更新一个围栏实体的详细信息
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// fenceId 地理围栏的唯一标识
///
/// fenceName 围栏名称
///
/// fenceDesc 围栏描述; string(1024)
///
/// monitoredPersons 围栏监控对象; string;被监控者的entityName。
///
/// observers 观察者列表; string,string…;	观察者的entityName，使用英文逗号”,”分割，至少一个，最多五个。
///
/// validTimes 围栏生效时间列表; "string,string;string,string;…"; 一天中的几点几分到几点几分生效。至少含有一段生效时间，多个时间段使用分号”;”分隔。比如：“0820,0930;1030,1130”
///
/// validCycle 围栏生效周期; int; 标识valid_times是否周期性生效，可以使用如下数值 1：不重复 2：工作日循环 3：周末循环 4：每天循环 5：自定义 当为5时，需要定义valid_days，标识在周几生效。
///
/// validDate 围栏生效日期; string; 当valid_cycle为1时必须设置此字段的值，例如：20150908。
///
/// validDays 围栏生效日期列表; int,int...; 1到7，分别表示周一到周日，当valid_cycle为5时必须设置此字段的值。
///
/// shape 围栏的形状; 1代表将围栏更新为圆形, 2代表将围栏更新为多边形
///
/// coordType 围栏的坐标点坐标类型; int(1,3); 坐标类型定义如下：1：GPS经纬度 2：国测局经纬度 3：百度经纬度
///
/// center 围栏是圆形时圆心经纬度; double,double; 格式为：经度,纬度; 示例：116.4321,38.76623 只有shape是1时有效
///
/// radius 围栏是圆形时的半径; double(0, 5000]; 单位：米. 只有shape是1时有效
///
/// vertexes 围栏是多边形时的顶点列表; "double,double;double,double..." 多边形需满足一下条件：1. 顶点坐标：经度,纬度。多个顶点用分号相隔，如： 119.32,40.38;119.33,40.38;119.33,40.37; 2. 顶点需按照顺时针或逆时针方向排列; 3. 顶点个数最少3个，最多20个; 4. 多边形的外接，长和宽均不超过10km
///
/// alarmCondition 围栏报警条件; int; 1：进入时触发提醒 2：离开时触发提醒 3：进入离开均触发提醒
///
/// precision 围栏去燥的精度; int; 当采集到的轨迹点的定位精度超过此阈值时，将不会触发围栏. 如果需要所有的轨迹点,无论定位精度是多少都去触发围栏计算的话，设置为0（可能造成围栏误报警）
- (void)updateFence:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceId:(long long)fenceId fenceName:(NSString * _Nullable)fenceName fenceDesc:(NSString * _Nullable)fenceDesc monitoredPersons:(NSString * _Nullable)monitoredPersons observers:(NSString * _Nullable)observers validTimes:(NSString * _Nullable)validTimes validCycle:(NSInteger)validCycle validDate:(NSString * _Nullable)validDate validDays:(NSString * _Nullable)validDays shape:(NSInteger)shape coordType:(NSInteger)coordType center:(NSString * _Nullable)center radius:(double)radius vertexes:(NSString * _Nullable)vertexes alarmCondition:(NSInteger)alarmCondition precision:(NSInteger)precision;

/// 根据fenceId删除围栏
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// fenceId 地理围栏的唯一标识; int
- (void)deleteFence:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceId:(long long)fenceId;

/// 根据fenceId查询围栏
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// creator 围栏创建者的entityName; string	; creator和fenceIds二者至少选一个
///
/// fenceIds 查询的地理围栏ID列表，最多10个; int,int...;	creator和fenceIds二者至少选一个
- (void)queryFenceList:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId creator:(NSString * _Nullable)creator fenceIds:(NSString * _Nullable)fenceIds;

/// 查询围栏的监控对象的历时报警信息
///
/// param:
///
/// serviceId 鹰眼服务唯一标识; int
///
/// fenceId 地理围栏的唯一标识; int
///
/// monitoredPersons 监控对象; string; 表示查询哪个监控对象的历史动作,如果为空，则查询所有监控对象的历史动作
///
/// beginTime 开始时间; UNIX时间戳
///
/// endTime 结束时间; UNIX时间戳
- (void)queryFenceHistoryAlarm:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceId:(long long)fenceId monitoredPersons:(NSString * _Nullable)monitoredPersons beginTime:(long long)beginTime endTime:(long long)endTime;

/// 根据fence_id查询围栏内监控对象是在围栏内还是在围栏外
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// fenceId 地理围栏的唯一标识; int
///
/// monitoredPersons 围栏监控对象; string; 表示查询那个监控对象的状态,不填时，查询所有监控对象的状态
- (void)queryFenceStatus:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceId:(long long)fenceId monitoredPersons:(NSString * _Nullable)monitoredPersons;

/// 根据fence_id、被监控对象、以及他们的经纬度判断其是在围栏内还是在围栏外
///
/// param:
///
/// serviceId 鹰眼服务唯一标识
///
/// fenceId 地理围栏的唯一标识; int
///
/// monitoredPersons 围栏监控对象; string; 表示查询那个监控对象的状态,不填时，查询所有监控对象的状态
///
/// locations 围栏监控对象对应的位置坐标; "double,double,int" 可选，坐标由经度,纬度,坐标类型组成,其中坐标类型的定义如下:1代表WGS84经纬度 2代表国测局经纬度 3代表百度经纬度
- (void)queryFenceStatusByLocation:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceId:(long long)fenceId monitoredPersons:(NSString * _Nullable)monitoredPersons locations:(NSString * _Nullable)locations;

/// 今后版本将不再支持此接口
- (void)fenceDelayAlarm:(id <ApplicationFenceDelegate> _Nonnull)delegate serviceId:(long long)serviceId fenceId:(long long)fenceId observer:(NSString * _Nonnull)observer time:(long long)time;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// 定位设备的运动方式
///
/// 0 步行
///
/// 1 汽车
///
/// 2 火车高铁等
///
/// 3 其他
SWIFT_CLASS("_TtC13BaiduTraceSDK28BTRACEActivityTypeOfLocation")
@interface BTRACEActivityTypeOfLocation : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// 定位精确度的级别
///
/// 0 最高定位精度，此选项定位最为精确，适用于导航等场景，只有手机插上电源才有效
///
/// 1 米级别的定位精度，是不插电源情况下的最高定位精度
///
/// 2 十米级别的定位精度
///
/// 3 百米级别的定位精度
///
/// 4 千米级别的定位精度
///
/// 5 最低定位精度，偏移可能达到几公里以上
SWIFT_CLASS("_TtC13BaiduTraceSDK31BTRACEDesiredAccuracyOfLocation")
@interface BTRACEDesiredAccuracyOfLocation : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// 设置采集和打包周期的回调方法中的状态码
///
/// 0 设置成功
///
/// 1 设置失败
///
/// 2 参数错误
SWIFT_CLASS("_TtC13BaiduTraceSDK51BTRACEOnChangeGatherAndPackIntervalsAfterStartTrace")
@interface BTRACEOnChangeGatherAndPackIntervalsAfterStartTrace : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// 开始轨迹服务的回调方法中的状态码
///
/// 0 连接服务器成功
///
/// 1 内部错误
///
/// 10002 参数错误
///
/// 10003 轨迹服务类型错误
///
/// 10007 连接服务器失败,已开始采集轨迹,并进入缓存模式
///
/// 10008 连接服务器失败,当网络恢复后会自动重新登录
///
/// 10009 重新连接成功
///
/// 10010 正在开启服务
///
/// 10011 正在结束服务
SWIFT_CLASS("_TtC13BaiduTraceSDK22BTRACEOnStartTraceType")
@interface BTRACEOnStartTraceType : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// 结束轨迹服务的回调方法中的状态码
///
/// 0 结束轨迹服务成功
///
/// 11000 结束服务请求发送失败,已停止采集
///
/// 11002 还没有开始服务
///
/// 11003 缓存数据上传完毕
SWIFT_CLASS("_TtC13BaiduTraceSDK21BTRACEOnStopTraceType")
@interface BTRACEOnStopTraceType : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// 轨迹服务类型
SWIFT_CLASS("_TtC13BaiduTraceSDK19BTRACEOperationMode")
@interface BTRACEOperationMode : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



/// Statements are used to update the database, query data, and read results. Statements are like methods and can accept parameters. This makes it easy to escape SQL values, as well as reuse statements for optimal performance.
///
/// Statements are prepared from a Database object.
SWIFT_CLASS("_TtC13BaiduTraceSDK15BTRACEStatement")
@interface BTRACEStatement : NSObject

/// The number of parameters accepted by the statement.
@property (nonatomic, readonly) NSInteger parameterCount;

/// Clears all parameter values bound to the statement. All parameters will be NULL after this call.
- (void)clearParameters;

/// Binds a string value to the parameter at the 1-based index.
///
/// :param:     stringValue     The value to bind.
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindStringValue:(NSString * _Nonnull)stringValue atIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a string value to a named parameter.
///
/// :param:     stringValue     The value to bind.
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindStringValue:(NSString * _Nonnull)stringValue named:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds an Int value to the parameter at the 1-based index.
///
/// :param:     intValue        The value to bind.
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindIntValue:(NSInteger)intValue atIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds an Int value to a named parameter.
///
/// :param:     intValue        The value to bind.
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindIntValue:(NSInteger)intValue named:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds an Int64 value to the parameter at the 1-based index.
///
/// :param:     int64Value      The value to bind.
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindInt64Value:(int64_t)int64Value atIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds an Int64 value to a named parameter.
///
/// :param:     int64Value      The value to bind.
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindInt64Value:(int64_t)int64Value named:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a Double value to the parameter at the 1-based index.
///
/// :param:     doubleValue     The value to bind.
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindDoubleValue:(double)doubleValue atIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a Double value to a named parameter.
///
/// :param:     doubleValue     The value to bind.
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindDoubleValue:(double)doubleValue named:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a Bool value to the parameter at the 1-based index.
///
/// :param:     boolValue       The value to bind.
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindBoolValue:(BOOL)boolValue atIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a Bool value to a named parameter.
///
/// :param:     boolValue       The value to bind.
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindBoolValue:(BOOL)boolValue named:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds an NSData value to the parameter at the 1-based index.
///
/// :param:     blobValue       The value to bind.
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindBlobValue:(NSData * _Nonnull)blobValue atIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a BLOB value to a named parameter.
///
/// :param:     blobValue       The value to bind.
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindBlobValue:(NSData * _Nonnull)blobValue named:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a NULL value to the parameter at the 1-based index.
///
/// :param:     atIndex         The 1-based index of the parameter.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindNullParameterAtIndex:(NSInteger)index error:(NSError * _Nullable * _Null_unspecified)error;

/// Binds a NULL value to a named parameter.
///
/// :param:     named           The name of the parameter to bind.
/// :param:     error           An error pointer.
///
/// :returns:   <code>true
/// </code> if the parameter was bound, <code>false
/// </code> otherwise.
- (BOOL)bindNullParameter:(NSString * _Nonnull)name error:(NSError * _Nullable * _Null_unspecified)error;

/// Resets the statement so it can be executed again. Paramters are NOT cleared. To clear them call clearParameters() after this method.
- (BOOL)resetAndReturnError:(NSError * _Nullable * _Null_unspecified)error;

/// The names of each column selected by this statement, or an empty array if the statement is not a SELECT.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull columnNames;

/// The number of columns in each row selected by this statement.
@property (nonatomic, readonly) NSInteger columnCount;
- (NSString * _Nonnull)nameOfColumnAtIndex:(NSInteger)columnIndex;

/// Gets the name of the column at an index.
///
/// :param:     columnIndex The index of a column
/// :returns:   The name of the column at the index
- (NSString * _Nonnull)columnNameAtIndex:(NSInteger)columnIndex;
@end


@interface BTRACEStatement (SWIFT_EXTENSION(BaiduTraceSDK))
@end


@interface BTRACEStatement (SWIFT_EXTENSION(BaiduTraceSDK))
@end



/// Describes a column in a database table.
SWIFT_CLASS("_TtC13BaiduTraceSDK10ColumnInfo")
@interface ColumnInfo : NSObject
- (nonnull instancetype)initWithIndex:(NSInteger)index name:(NSString * _Nonnull)name type:(NSString * _Nullable)type notNull:(BOOL)notNull defaultValue:(NSString * _Nullable)defaultValue primaryKeyIndex:(NSInteger)primaryKeyIndex OBJC_DESIGNATED_INITIALIZER;

/// The order of the column in the table.
@property (nonatomic, readonly) NSInteger index;

/// The column's name
@property (nonatomic, readonly, copy) NSString * _Nonnull name;

/// The type of the column. Since sqlite is dynamically typed, this value is not well defined. But it will often be 'INTEGER', 'TEXT', 'REAL', or 'BLOB'. However, it can also be missing, or an arbitrary user type.
@property (nonatomic, readonly, copy) NSString * _Nullable type;

/// Whether the column was created with 'NOT NULL'. true means the values of the column cannot be nil, false means that NULL is an allowable value.
@property (nonatomic, readonly) BOOL notNull;

/// The default value for the column.
@property (nonatomic, readonly, copy) NSString * _Nullable defaultValue;

/// 0 if the column is not part of the primary key, otherwise the 1-based index within the primary key.
///
/// For example, if a table had a compound key of (name, email_address), then the 'name' column would have a
/// <code>primaryKeyIndex
/// </code> of 1, and the 'email_address' column would be 2.
@property (nonatomic, readonly) NSInteger primaryKeyIndex;
@end


@interface NSData (SWIFT_EXTENSION(BaiduTraceSDK))
@end


@interface NSNull (SWIFT_EXTENSION(BaiduTraceSDK))
@end


@interface NSNumber (SWIFT_EXTENSION(BaiduTraceSDK))
@end


@interface NSURL (SWIFT_EXTENSION(BaiduTraceSDK))
@property (nonatomic, readonly, copy) NSString * _Nonnull URLString;
@end


@interface NSURLComponents (SWIFT_EXTENSION(BaiduTraceSDK))
@property (nonatomic, readonly, copy) NSString * _Nonnull URLString;
@end


@interface NSURLRequest (SWIFT_EXTENSION(BaiduTraceSDK))
@property (nonatomic, readonly, copy) NSString * _Nonnull URLString;
@end

@class NSMutableURLRequest;

@interface NSURLRequest (SWIFT_EXTENSION(BaiduTraceSDK))
@property (nonatomic, readonly, strong) NSMutableURLRequest * _Nonnull URLRequest;
@end


@interface NSURLSession (SWIFT_EXTENSION(BaiduTraceSDK))
@end

@class SchemaEntry;


/// Describes a database's schema -- its tables, indexes, and other structures. The schema can be accessed through the schema property of a Database object.
///
/// Schema objects are immutable, and will not change when the database is updated.
SWIFT_CLASS("_TtC13BaiduTraceSDK6Schema")
@interface Schema : NSObject
- (nonnull instancetype)init;
- (nonnull instancetype)initWithSchemaEntries:(NSArray<SchemaEntry *> * _Nonnull)schemaEntries OBJC_DESIGNATED_INITIALIZER;

/// The entries in the Schema, each describing a table, index, or other structure.
@property (nonatomic, readonly, copy) NSArray<SchemaEntry *> * _Nonnull schemaEntries;
- (SchemaEntry * _Nullable)objectForKeyedSubscript:(NSString * _Nonnull)entryName;

/// Returns the entry with the given name -- table, index, or trigger.
- (SchemaEntry * _Nullable)entryNamed:(NSString * _Nonnull)entryName;

/// All database tables.
@property (nonatomic, readonly, copy) NSArray<SchemaEntry *> * _Nonnull tables;

/// The names of all tables in the database.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull tableNames;

/// Returns the entry for a particular table.
- (SchemaEntry * _Nullable)tableNamed:(NSString * _Nonnull)tableName;

/// All database indexes.
@property (nonatomic, readonly, copy) NSArray<SchemaEntry *> * _Nonnull indexes;

/// The names of all database indexes.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull indexNames;

/// :param:   tableName The name of a table :returns: Descriptions of each index for the given table.
- (NSArray<SchemaEntry *> * _Nonnull)indexesOnTable:(NSString * _Nonnull)tableName;

/// :param:   tableName The name of a table :returns: The name of each index on for a table.
- (NSArray<NSString *> * _Nonnull)namesOfIndexesOnTable:(NSString * _Nonnull)tableName;
@end



/// Describes a table, index, or other database structure.
///
/// SchemaEntry objects are immutable and will not change when the database is updated.
SWIFT_CLASS("_TtC13BaiduTraceSDK11SchemaEntry")
@interface SchemaEntry : NSObject

/// The type of structure represented by this entry.
@property (nonatomic, readonly, copy) NSString * _Nonnull type;

/// type for tables.
@property (nonatomic, readonly, copy) NSString * _Nonnull TABLE_TYPE;

/// type for indexes.
@property (nonatomic, readonly, copy) NSString * _Nonnull INDEX_TYPE;

/// type for views.
@property (nonatomic, readonly, copy) NSString * _Nonnull VIEW_TYPE;

/// type for triggers.
@property (nonatomic, readonly, copy) NSString * _Nonnull TRIGGER_TYPE;

/// true if this entry describes a table, false otherwise.
@property (nonatomic, readonly) BOOL isTable;

/// true if this entry describes an index, false otherwise.
@property (nonatomic, readonly) BOOL isIndex;

/// true if this entry describes a view, false otherwise.
@property (nonatomic, readonly) BOOL isView;

/// true if this entry describes a trigger, false otherwise.
@property (nonatomic, readonly) BOOL isTrigger;

/// The name of the table, index, view, or trigger described by this object.
@property (nonatomic, readonly, copy) NSString * _Nonnull name;

/// If this entry describes a table or a view, this is identical to the name property. For an index, this is the name of the table that is indexed by the index. For triggers, this is the name of the table or view that causes the trigger to fire.
@property (nonatomic, readonly, copy) NSString * _Nonnull tableName;

/// The SQL string used to create the table, index, view, or trigger. It will be nil for automatically created objects, like a unique index created in a CREATE TABLE statement (e.g. "emailAddress TEXT UNIQUE NOT NULL")
@property (nonatomic, readonly, copy) NSString * _Nullable sql;
@end



/// Describes the structure of a table -- it's columns.
SWIFT_CLASS("_TtC13BaiduTraceSDK9TableInfo")
@interface TableInfo : NSObject
- (nonnull instancetype)initWithName:(NSString * _Nonnull)name columns:(NSArray<ColumnInfo *> * _Nonnull)columns OBJC_DESIGNATED_INITIALIZER;

/// The table name.
@property (nonatomic, readonly, copy) NSString * _Nonnull name;

/// Details about the table's columns.
@property (nonatomic, readonly, copy) NSArray<ColumnInfo *> * _Nonnull columns;

/// The names of all columns in the table.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull columnNames;
- (ColumnInfo * _Nullable)objectForKeyedSubscript:(NSString * _Nonnull)columnName;
@end

#pragma clang diagnostic pop
