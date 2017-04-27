//
//  LookUpRerservationController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/26/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "LookUpRerservationController.h"

#import "AutoLayout.h"

#import "AppDelegate.h"

#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"

@interface LookUpRerservationController () <UITableViewDataSource, UISearchBarDelegate>

@property(strong,nonatomic) UITableView *lookUpTable;
@property(strong,nonatomic) NSArray *allReservations;
@property(strong,nonatomic) UISearchBar *searchBar;
@property(strong,nonatomic) NSMutableArray *filterReservations;

@end

@implementation LookUpRerservationController

BOOL isSearching;

-(void)loadView {
    [super loadView];
    
}

- (NSArray *) reservationDetails {
    if (!_allReservations) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName: @"Reservation"];
        
        NSError *reservationFetchError;
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSArray *reservations = [context executeFetchRequest:request error:&reservationFetchError];
        
        if (reservationFetchError) {
            NSLog(@"There is a Fetch Error.");
        }
        _allReservations = reservations;
    }
    return _allReservations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.lookUpTable reloadData];
}

-(void) setupViewLayout {
    self.lookUpTable = [[UITableView alloc]init];
    self.searchBar = [[UISearchBar alloc]init];
    
    self.lookUpTable.dataSource = self;
    self.searchBar.delegate = self;
    
    [self.lookUpTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.lookUpTable.translatesAutoresizingMaskIntoConstraints = NO;
    
    //Adds it to the actual view with the addSubview.
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.lookUpTable];
    
    //Getting the value for the navigationBar
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    CGFloat statusBarHeight = 20.0;
    CGFloat topMargin = navBarHeight + statusBarHeight;
    CGFloat windowHeight = self.view.frame.size.height;
    CGFloat frameHeight = (windowHeight - topMargin - statusBarHeight);
    
    NSDictionary *viewDictionary = @{@"searchBar":self.searchBar,
                                     @"lookUpTable":self.lookUpTable};
    
    NSDictionary *metricsDictionary = @{@"topMargin": [NSNumber numberWithFloat:topMargin],
                                        @"frameHight": [NSNumber numberWithFloat:frameHeight]};
    //Setting up how its going to display on the table view using the NSDictionaries above^.
    NSString *visualFormatString =@"V:|-topMargin-[searchBar(==topMargin)][lookUpTable(==frameHeight)]|";
    
    //spreding out across the view with constraints.
    [AutoLayout leadingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout trailingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout leadingConstraintFrom:self.lookUpTable toView:self.view];
    [AutoLayout trailingConstraintFrom:self.lookUpTable toView:self.view];
    
    [AutoLayout constraintsWithVFLForViewDictionary:viewDictionary forMetricsDictionary:metricsDictionary withOptions:0 withVisualFormat:visualFormatString];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
}


@end
