//
//  DetailTableViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "DetailTableViewController.h"
#import "NSDate+String.h"
#import "ShowLocationViewController.h"
#import "SMCLocationManager.h"

#define K_DATE      @"取点时间"
#define K_BATTERY   @"电量"
#define K_APP_STATE @"状态"
#define K_LATITUDE  @"经度"
#define K_LONGITUDE @"纬度"
#define K_ALTITUDE  @"海拔"
#define K_HACCURACY @"水平精度"
#define K_VACCURACY @"垂直精度"
#define K_COURSE    @"方向"
#define K_SPEED     @"速度"
#define K_TIMESTAMP @"定位时间"
#define K_LAUNCH_STATUS @"启动方式"

@interface DetailTableViewController () {
    NSArray<NSString*>* _items;
}
- (IBAction)onButtonShowMap:(id)sender;

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _items = @[K_DATE, K_BATTERY, K_APP_STATE, K_LATITUDE, K_LONGITUDE, K_ALTITUDE, K_HACCURACY,
               K_VACCURACY, K_COURSE, K_SPEED, K_TIMESTAMP, K_LAUNCH_STATUS];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* identifier = @"tcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSString* title = [_items objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    NSString* txt = @"";
    if ([title isEqualToString:K_DATE]) {
        txt = [self.location.date hy_stringDefault];
    } else if ([title isEqualToString:K_BATTERY]) {
        txt = [NSString stringWithFormat:@"%f", self.location.battery];
    } else if ([title isEqualToString:K_APP_STATE]) {
        txt = [[SMCLocationManager sharedManager] getAppStatus:self.location.applicationState];
    } else if ([title isEqualToString:K_LATITUDE]) {
        txt = [NSString stringWithFormat:@"%f", self.location.latitude];
    } else if ([title isEqualToString:K_LONGITUDE]) {
        txt = [NSString stringWithFormat:@"%f", self.location.longitude];
    } else if ([title isEqualToString:K_ALTITUDE]) {
        txt = [NSString stringWithFormat:@"%f", self.location.altitude];
    } else if ([title isEqualToString:K_HACCURACY]) {
        txt = [NSString stringWithFormat:@"%f", self.location.horizontalAccuracy];
    } else if ([title isEqualToString:K_VACCURACY]) {
        txt = [NSString stringWithFormat:@"%f", self.location.verticalAccuracy];
    } else if ([title isEqualToString:K_COURSE]) {
        txt = [NSString stringWithFormat:@"%f", self.location.course];
    } else if ([title isEqualToString:K_SPEED]) {
        txt = [NSString stringWithFormat:@"%f", self.location.speed];
    } else if ([title isEqualToString:K_TIMESTAMP]) {
        txt = [self.location.timestamp hy_stringDefault];
    } else if ([title isEqualToString:K_LAUNCH_STATUS]) {
        txt = [[SMCLocationManager sharedManager] getLaunchStatus:self.location.launchStatus];
    }
    
    // Configure the cell...
    cell.detailTextLabel.text = txt;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ShowLocationViewController* sc = segue.destinationViewController;
    sc.location = self.location;
}

- (IBAction)onButtonShowMap:(id)sender {
}
@end
