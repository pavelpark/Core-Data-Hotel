//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

@import Crashlytics;

#import "ViewController.h"
#import "AutoLayout.h"
#import "HotelsViewController.h"

#import "DatePickerViewController.h"

#import "LookUpRerservationController.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLayout];
    
}

-(void)setupLayout{
    
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    
    browseButton.backgroundColor = [UIColor colorWithRed:0.44 green:0.69 blue:0.36 alpha:1.0];

    [AutoLayout leadingConstraintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstraintFrom:browseButton toView:self.view];

    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    
    bookButton.backgroundColor = [UIColor colorWithRed:0.78 green:0.76 blue:0.40 alpha:1.0];
    
    [AutoLayout leadingConstraintFrom:bookButton toView:self.view];
    [AutoLayout trailingConstraintFrom:bookButton toView:self.view];

    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    lookupButton.backgroundColor = [UIColor colorWithRed:0.70 green:0.32 blue:0.32 alpha:1.0];
    
    [AutoLayout leadingConstraintFrom:lookupButton toView:self.view];
    [AutoLayout trailingConstraintFrom:lookupButton toView:self.view];

    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    CGFloat statusBarHeight = 20.0;
    CGFloat topMargin = navBarHeight + statusBarHeight;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat buttonHeight = ((windowHeight - topMargin) / 3);
    
    NSDictionary *viewDictionary = @{@"browseButton": browseButton, @"bookButton": bookButton, @"lookupButton": lookupButton};
    
    NSDictionary *metricsDictionary = @{@"topMargin": [NSNumber numberWithFloat:topMargin], @"buttonHeight": [NSNumber numberWithFloat:buttonHeight]};
    
    NSString *visualFormatString = @"V:|-topMargin-[browseButton(==buttonHeight)][bookButton(==browseButton)][lookupButton(==browseButton)]|";
    
    [AutoLayout constraintsWithVFLForViewDictionary:viewDictionary forMetricsDictionary:metricsDictionary withOptions:0 withVisualFormat:visualFormatString];
    
//    NSLayoutConstraint *browseHeight = [AutoLayout equalHeightConstraintFromView:browseButton toView:self.view withMultiplier:0.33];
    
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [bookButton addTarget:self action:@selector(bookButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookUpButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)browseButtonSelected{
    HotelsViewController *hotelsView = [[HotelsViewController alloc]init];
    NSLog(@"Works");
    [self.navigationController pushViewController: hotelsView animated:YES];
    [Answers logCustomEventWithName:@"ViewController - Browse Button Pressed" customAttributes:nil];
}

-(void)bookButtonSelected{
    
    [Answers logCustomEventWithName:@"ViewController - Browse Button Pressed" customAttributes:nil];
    
    DatePickerViewController *datePickerController = [[DatePickerViewController alloc]init];
    
    [self.navigationController pushViewController:datePickerController animated:YES];
}

-(void)lookUpButtonSelected{
    
    LookUpRerservationController *lookUpController = [[LookUpRerservationController alloc]init];
    
    [self.navigationController pushViewController:lookUpController animated:YES];
}


-(UIButton *)createButtonWithTitle:(NSString *) title{
    
    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    
    return button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
