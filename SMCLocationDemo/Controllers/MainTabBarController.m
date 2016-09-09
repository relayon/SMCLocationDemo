//
//  MainTabBarController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/9.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)onButtonClearLog:(id)sender;
- (IBAction)onSegmentedValueChanged:(id)sender;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)onButtonClearLog:(id)sender {
    
}

- (IBAction)onSegmentedValueChanged:(id)sender {
    
}
@end
