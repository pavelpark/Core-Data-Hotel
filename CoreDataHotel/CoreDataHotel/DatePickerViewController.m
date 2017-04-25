//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/25/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"

@interface DatePickerViewController ()

@property (strong, nonatomic) UIDatePicker *endDate;
@property (strong, nonatomic) UIDatePicker *startDate;
@end

@implementation DatePickerViewController


-(void)loadView{
    [super loadView];
    
    [self setupDatePickers];
    [self setupDoneButton];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setupDoneButton{
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    
    [self.navigationItem setRightBarButtonItem:doneButton];
}

-(void)doneButtonPressed{
    
    NSDate *endDate = self.endDate.date;
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        self.endDate.date = [NSDate date];
        return;
    }
    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc] init];
    availabilityController.endDate = [NSDate date];
    [self.navigationController pushViewController:availabilityController animated:YES];
    
    NSDate *startDate = self.startDate.date;
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [startDate timeIntervalSinceReferenceDate]) {
        self.startDate.date = [NSDate date];
        availabilityController.startDate = [NSDate date];
        return;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupDatePickers{
    
    self.startDate = [[UIDatePicker alloc] init];
    self.startDate.datePickerMode = UIDatePickerModeDate;
    self.startDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    
    [self.view addSubview:self.startDate];
    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;
    
    self.endDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    //will need too make it so when the screen is rotated so that costraints work too.
    [self.view addSubview:self.endDate];
    
    
}
@end
