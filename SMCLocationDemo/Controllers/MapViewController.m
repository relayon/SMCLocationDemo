//
//  MapViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "MapViewController.h"
#import "MLogLocation.h"
@import MapKit;

@interface MapViewController () <MKMapViewDelegate> {
    RLMResults* _locationResults;
    RLMNotificationToken* _dataChange;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
//    self.mapView.delegate = self;
    
    _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
    [self _updateAnnotation];
    _dataChange = [[RLMRealm defaultRealm] addNotificationBlock:^(NSString *notification, RLMRealm *realm) {
        _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
        [self _updateAnnotation];
    }];
}

- (void)_updateAnnotation {
    [self.mapView removeAnnotations:self.mapView.annotations];
    if (_locationResults.count > 0) {
        NSInteger count = _locationResults.count;
        for (NSInteger idx = 0; idx < count; idx++) {
            MLogLocation* loc = [_locationResults objectAtIndex:idx];
            MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
            ann.coordinate = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);
            //        [ann setTitle:@"公司"];
            //        [ann setSubtitle:@"十八英尺"];
            //触发viewForAnnotation
            [self.mapView addAnnotation:ann];
        }
    }
}

//- (CLLocation*)_applyLocationManagerChinaLocationShift:(CLLocation*)location {
//    id sharedLocationManager = [NSClassFromString(@"MKLocationManager") performSelector:@selector(sharedLocationManager)];
//    SEL theSelector = @selector(_applyChinaLocationShift:);
//    
//    // this will ensure sharedLocationManager is non-nil and responds appropriately
//    if (![sharedLocationManager respondsToSelector:theSelector]) {
//        return nil; // fail silently - check this in the caller
//    }
//    return [sharedLocationManager performSelector:theSelector withObject:location];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
