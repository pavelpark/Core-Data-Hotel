//
//  LookupViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/27/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "LookupViewController.h"

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

@interface LookupViewController () <UITableViewDataSource, UISearchBarDelegate>

@property(strong,nonatomic) UITableView *lookUpTable;
@property(strong,nonatomic) NSArray *allReservations;
@property(strong,nonatomic) UISearchBar *searchBar;
@property(strong,nonatomic) NSMutableArray *filterReservations;

@end

@implementation LookupViewController

BOOL isSearching;

-(void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSearchBar];
    [self setupTableView];
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

- (void)setupSearchBar {
    self.searchBar = [[UISearchBar alloc]init];
    [self.searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.searchBar];
    self.searchBar.delegate = self;
    self.searchBar.backgroundColor = [UIColor redColor];
    
    [AutoLayout height:30 forView:self.searchBar];
    [AutoLayout offset:0 forItemTop:self.searchBar toItemBottom:self.topLayoutGuide];
    [AutoLayout leadingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout trailingConstraintFrom:self.searchBar toView:self.view];
    
}


- (void)setupTableView {
    self.lookUpTable = [[UITableView alloc]init];
    [self.view addSubview:self.lookUpTable];
    [self.lookUpTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.lookUpTable.dataSource = self;
    [self.lookUpTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [AutoLayout offset:0 forItemTop:self.lookUpTable toItemBottom:self.searchBar];
    [AutoLayout leadingConstraintFrom:self.lookUpTable toView:self.view];
    [AutoLayout trailingConstraintFrom:self.lookUpTable toView:self.view];
    [AutoLayout centerYforView:self.lookUpTable toView:self.view];
    [AutoLayout offset:0 forItemTop:self.lookUpTable toItemBottom:self.bottomLayoutGuide];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Reservation *reservation;
    //defaults to all the reservation on the tableView.
    if (self.filterReservations == nil) {
        reservation = self.allReservations[indexPath.row];
    } else {
        reservation = self.filterReservations[indexPath.row];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM-dd-yy"];
    
    NSString *formatStartDateString = [dateFormatter stringFromDate:reservation.startDate];
    NSString *formatEndDateString = [dateFormatter stringFromDate:reservation.endDate];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@: %@ In Room: %i, from: %@ To: %@", reservation.guest.firstName, reservation.guest.lastName, reservation.room.hotel.name, reservation.room.number, formatStartDateString, formatEndDateString];
    
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (isSearching) {
        return self.filterReservations.count;
    }else{
        return self.allReservations.count;
    }
}

@end
