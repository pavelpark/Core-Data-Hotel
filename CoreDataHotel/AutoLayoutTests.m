//
//  AutoLayoutTests.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/26/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoLayout.h"

@interface AutoLayoutTests : XCTestCase

@property(strong, nonatomic) UIViewController *testController;

@property(strong,nonatomic) UIView *testView;
@property(strong,nonatomic) UIView *superView;

@property(strong,nonatomic) UIView *equalHeightConstraintView;
@property(strong,nonatomic) UIView *equalHeightConstraintOtherView;

@property(strong,nonatomic) UIView *leadingConstraintsView;
@property(strong,nonatomic) UIView *leadingConstraintOtherView;


@end

@implementation AutoLayoutTests

- (void)setUp {
    [super setUp];

    self.testController = [[UIViewController alloc]init];
    
    self.testView = [[UIView alloc]init];
    self.superView = [[UIView alloc]init];
    
    self.equalHeightConstraintView = [[UIView alloc]init];
    self.equalHeightConstraintOtherView = [[UIView alloc]init];
    
    self.leadingConstraintsView = [[UIView alloc]init];
    self.leadingConstraintOtherView = [[UIView alloc]init];
    
//    //creating subViews
    [self.testController.view addSubview:self.testView];
    [self.testController.view addSubview:self.superView];
    
    [self.testController.view addSubview:self.equalHeightConstraintView];
    [self.testController.view addSubview:self.equalHeightConstraintOtherView];
    
    [self.testController.view addSubview:self.leadingConstraintsView];
    [self.testController.view addSubview:self.leadingConstraintOtherView];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    //tearing down properties
    self.testController = nil;
    self.testView = nil;
    self.superView = nil;
    
    self.equalHeightConstraintView = nil;
    self.equalHeightConstraintOtherView = nil;
    
    self.leadingConstraintsView = nil;
    self.leadingConstraintOtherView = nil;
    [super tearDown];
}

//Assertion
-(void)testGenericConstraintFromToViewWithAttribute{
    
    XCTAssertNotNil(self.testController, @"The testController is nil!");
    XCTAssertNotNil(self.testView, @"Self.testView is nil!");
    XCTAssertNotNil(self.superView, @"Self.superView is nil!");

    id constraint = [AutoLayout genericConstraintFrom:self.testView toView:self.superView withAttribute:NSLayoutAttributeTop];
    
    XCTAssert([constraint isKindOfClass:[NSLayoutConstraint class]], @"Constraint is not an instance of NSLayoutConstraint");
    
    
    XCTAssertTrue([(NSLayoutConstraint *)constraint isActive], @"Constraint was not activated");
}

-(void)testEqualHeightConstraintFromView{
    
    XCTAssertNotNil(self.equalHeightConstraintView, @"Self.equalHeightConstraintView");
    XCTAssertNotNil(self.equalHeightConstraintOtherView, @"Self.equalHeightConstraintOtherView");
    
    id equalConstraint = [AutoLayout equalHeightConstraintFromView:self.equalHeightConstraintView toView:self.equalHeightConstraintOtherView withMultiplier:NSLayoutAttributeTop];
    
    XCTAssert([equalConstraint isKindOfClass:[NSLayoutConstraint class]], @"Equal constraint is not an instance of NSLayoutConstraint");
    
    XCTAssertTrue([(NSLayoutConstraint *)equalConstraint isActive], @"Equal Constraint was not activated");
}

-(void)testLeadingConstraintFrom{
    
    XCTAssertNotNil(self.leadingConstraintsView, @"Self.leadingConstraintsView");
    XCTAssertNotNil(self.leadingConstraintOtherView, @"Self.leadingConstraintOtherView");
    
    id equalConstraint = [AutoLayout leadingConstraintFrom:]
}






@end
