//
//  LogViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "LogViewController.h"
#import "MLogLocation.h"
#import "MLogRun.h"
#import "SMCLocationManager.h"
#import "NSDate+String.h"
#import "DetailTableViewController.h"

#define T_START     @"开始"
#define T_STOP      @"停止"

@interface LogViewController () <UITableViewDataSource, UITableViewDelegate> {
    RLMResults* _locationResults;
    RLMNotificationToken* _dataChange;
}

- (IBAction)onButtonStartStop:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonStartStop;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    RLMResults *logs = [MLogRun allObjects];
//    MLogRun *loc = [logs objectAtIndex:0];
//    NSLog(@"count = %ld", logs.count);
//    NSLog(@"date = %@", loc.date);
    
#if 1
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    
//    MLogRun* log = [MLogRun new];
//    [realm transactionWithBlock:^{
//        [realm addObject:log];
//    }];
#endif
    
    [self _updateButtonTitle];
    
    _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
    __weak __typeof(&*self)ws = self;
    _dataChange = [[RLMRealm defaultRealm] addNotificationBlock:^(NSString *notification, RLMRealm *realm) {
        _locationResults = [[MLogLocation allObjects] sortedResultsUsingProperty:@"date" ascending:NO];
        [ws.tableView reloadData];
    }];
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor*)_getLocationColor:(MLogLocation*)loc {
    UIColor* clr = [UIColor blackColor];
    
    if (loc.applicationState == UIApplicationStateActive) {
        if (loc.launchStatus == 0) {
            // 用户
            clr = [UIColor blackColor];
        } else if (loc.launchStatus == 1) {
            // 系统
            clr = [UIColor orangeColor];
        }
    } else if (loc.applicationState == UIApplicationStateBackground) {
        if (loc.launchStatus == 0) {
            // 用户
            clr = [UIColor greenColor];
        } else if (loc.launchStatus == 1) {
            // 系统
            clr = [UIColor lightGrayColor];
        }
    } else if (loc.applicationState == UIApplicationStateInactive) {
        if (loc.launchStatus == 0) {
            // 用户
            clr = [UIColor redColor];
        } else if (loc.launchStatus == 1) {
            // 系统
            clr = [UIColor purpleColor];
        }
    }
    
    return clr;
}

#pragma mark -- UITableView 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _locationResults.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* identifier = @"TCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    MLogLocation* location = [_locationResults objectAtIndex:indexPath.row];
    cell.textLabel.text = [location.date hy_stringDefault];
    cell.textLabel.textColor = [self _getLocationColor:location];
    
    NSString* launchStatus = [[SMCLocationManager sharedManager] getLaunchStatus:location.launchStatus];
    NSString* appStatus = [[SMCLocationManager sharedManager] getAppStatus:location.applicationState];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"{%@, %@}", launchStatus, appStatus];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self performSegueWithIdentifier:@"SG_SHOW_DETAIL" sender:indexPath];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DetailTableViewController* dv = segue.destinationViewController;
    NSIndexPath* indexPath = (NSIndexPath*)sender;
    MLogLocation* loc = [_locationResults objectAtIndex:indexPath.row];
    dv.location = loc;
}


- (void)_updateButtonTitle {
    BOOL bStarted = [[SMCLocationManager sharedManager] serviceStarted];
    if (bStarted) {
        [self.buttonStartStop setTitle:T_STOP forState:UIControlStateNormal];
    } else {
        [self.buttonStartStop setTitle:T_START forState:UIControlStateNormal];
    }
}

- (IBAction)onButtonStartStop:(id)sender {
    BOOL bStarted = [[SMCLocationManager sharedManager] serviceStarted];
    if (bStarted) {
        [[SMCLocationManager sharedManager] stop];
    } else {
        [[SMCLocationManager sharedManager] start:LocationType_Standard];
    }
    
    [self _updateButtonTitle];
}
@end
