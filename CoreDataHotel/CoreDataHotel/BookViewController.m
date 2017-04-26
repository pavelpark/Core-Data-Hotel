//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/25/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "BookViewController.h"
#import "AutoLayout.h"

@interface BookViewController ()

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *firstName = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
    firstName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    firstName.backgroundColor=[UIColor redColor];
    firstName.text=@"firstName";
    
    UITextField *lastName = [[UITextField alloc] initWithFrame:CGRectMake(45, firstName.frame.origin.y+75, 200, 40)];
    lastName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    lastName.backgroundColor=[UIColor redColor];
    lastName.text=@"lastName";
    
    UITextField *email = [[UITextField alloc]initWithFrame:CGRectMake(45, lastName.frame.origin.y+75, 200, 40)];
    email.backgroundColor = [UIColor redColor];
    email.text = @"email";
    
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bookButton.frame = CGRectMake(80.0, 120.0, 160.0, 40.0);
    
    
    [bookButton addTarget:self action:@selector(bookButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [bookButton setTitle:@"Finish Booking" forState:UIControlStateNormal];
    [self.view addSubview:bookButton];
    bookButton.backgroundColor = [UIColor greenColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 400, 400)];
    //
    //    [AutoLayout leadingConstraintFrom:firstName toView:self.view];
    //    [AutoLayout trailingConstraintFrom:firstName toView:self.view];
    //    [AutoLayout leadingConstraintFrom:lastName toView:self.view];
    //    [AutoLayout trailingConstraintFrom:lastName toView:self.view];
    //    [AutoLayout leadingConstraintFrom:email toView:self.view];
    //    [AutoLayout trailingConstraintFrom:email toView:self.view];
    //
    
    
    view.backgroundColor = [UIColor whiteColor];
    [view addSubview:firstName];
    [view addSubview:lastName];
    [view addSubview:email];
    
    [self.view addSubview:view];
}

-(void)bookButtonPressed {
    
    
    NSLog(@"Booked");
    
}
@end
