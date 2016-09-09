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
    _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
    _dataChange = [[RLMRealm defaultRealm] addNotificationBlock:^(NSString *notification, RLMRealm *realm) {
        _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
    }];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    self.mapView.delegate = self;
    
    if (_locationResults.count > 0) {
        MLogLocation* loc = [_locationResults objectAtIndex:0];
        MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
        ann.coordinate = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);
//        [ann setTitle:@"天河城"];
//        [ann setSubtitle:@"购物好去处"];
        //触发viewForAnnotation
        [self.mapView addAnnotation:ann];
    }
    
}

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
