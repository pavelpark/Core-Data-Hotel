//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/25/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (strong, nonatomic) UIDatePicker *endDate;
@end

@implementation DatePickerViewController


-(void)loadView{
    [super loadView];
    
    [self setupDatePickers];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupDatePickers{
    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDateAndTime;
    
    self.endDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    //will need too make it so when the screen is rotated so that costraints work too.
    [self.view addSubview:self.endDate];
}
@end
