//
//  ChangeTimeViewController.m
//  SMCLocationDemo
//
//  Created by SMC-MAC on 16/9/12.
//  Copyright © 2016年 heyou. All rights reserved.
//

#import "ChangeTimeViewController.h"

@interface ChangeTimeViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ChangeTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.pickerView selectRow:10 inComponent:1 animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 60;
    } else if (component == 1) {
        return 2;
    } else {
        return 1;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString* title = @"";
    if (component == 0) {
        title = [NSString stringWithFormat:@"%ld", row+1];
    } else if (component == 1) {
        if (row == 0) {
            title = @"秒";
        } else if (row == 1) {
            title = @"分";
        }
    }
    
    return title;
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
