//
//  LocationViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/7.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;
- (IBAction)onButtonClear:(id)sender;
- (IBAction)onButtonStart:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation LocationViewController

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

- (IBAction)onButtonClear:(id)sender {
}

- (IBAction)onButtonStart:(id)sender {
}
@end
