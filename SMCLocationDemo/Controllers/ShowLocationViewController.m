//
//  ShowLocationViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "ShowLocationViewController.h"
@import MapKit;

@interface ShowLocationViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ShowLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    MLogLocation* loc = self.location;
    MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
    ann.coordinate = CLLocationCoordinate2DMake(loc.latitude, loc.longitude);
    [self.mapView addAnnotation:ann];
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
