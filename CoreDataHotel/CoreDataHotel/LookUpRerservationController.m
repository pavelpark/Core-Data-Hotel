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
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
}


@end
