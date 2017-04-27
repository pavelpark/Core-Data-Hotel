//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/25/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "BookViewController.h"

#import "AutoLayout.h"
#import "AppDelegate.h"

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"

#import "Reservation+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
@interface BookViewController ()

@property (strong, nonatomic) UITextField *firstName;
@property (strong, nonatomic) UITextField *lastName;
@property (strong, nonatomic) UITextField *email;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *firstName = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
    firstName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    firstName.backgroundColor=[UIColor redColor];
    firstName.placeholder=@"firstName";
    
    UITextField *lastName = [[UITextField alloc] initWithFrame:CGRectMake(45, firstName.frame.origin.y+75, 200, 40)];
    lastName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    lastName.backgroundColor=[UIColor redColor];
    lastName.placeholder=@"lastName";
    
    UITextField *email = [[UITextField alloc]initWithFrame:CGRectMake(45, lastName.frame.origin.y+75, 200, 40)];
    email.backgroundColor = [UIColor redColor];
    email.placeholder = @"email";
    
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bookButton.frame = CGRectMake(80.0, 120.0, 160.0, 40.0);
    
    
    [bookButton addTarget:self action:@selector(bookButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [bookButton setTitle:@"Finish Booking" forState:UIControlStateNormal];
    [self.view addSubview:bookButton];
    bookButton.backgroundColor = [UIColor greenColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 400, 400)];
    
//        [AutoLayout leadingConstraintFrom:firstName toView:self.view];
//        [AutoLayout trailingConstraintFrom:firstName toView:self.view];
//        [AutoLayout leadingConstraintFrom:lastName toView:self.view];
//        [AutoLayout trailingConstraintFrom:lastName toView:self.view];
//        [AutoLayout leadingConstraintFrom:email toView:self.view];
//        [AutoLayout trailingConstraintFrom:email toView:self.view];
//    
    
    
    view.backgroundColor = [UIColor whiteColor];
    [view addSubview:firstName];
    [view addSubview:lastName];
    [view addSubview:email];
    
    [self.view addSubview:view];
}

-(void)bookButtonPressed {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    
    reservation.startDate = self.startDate;
    reservation.endDate = self.endDate;
    reservation.room = self.selectedRoom;
    
    self.selectedRoom.reservation = reservation;
    
    reservation.guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    reservation.guest.firstName = self.firstName.text;
    reservation.guest.lastName = self.lastName.text;
    reservation.guest.email = self.email.text;
    
    NSError *bookError = nil;
    
    if (![context save:&bookError]) {
        NSLog(@"Can't Save! %@ %@", bookError, [bookError localizedDescription]);
        [bookError userInfo];
        //        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"Error messages suck" style:UIAlertActionStyleDestructive handler:nil];
    } else {
        NSLog(@"Saved successfully");
        NSLog(@"%@", self.firstName);
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}@end
