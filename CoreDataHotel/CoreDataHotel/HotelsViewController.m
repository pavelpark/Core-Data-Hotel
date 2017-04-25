//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

//#import "ViewController.h"
#import "HotelsViewController.h"

#import "AppDelegate.h"
#import "AutoLayout.h"

#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

#import "RoomsViewController.h"

#import "Room+CoreDataProperties.h"
#import "Room+CoreDataClass.h"

@interface HotelsViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *allHotels;

@property(strong, nonatomic)UITableView *tableView;

@end

@implementation HotelsViewController

-(void)loadView{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tableView = [[UITableView alloc]init];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    [self setupLayout];
    
    [self.view addSubview:self.tableView];
    //add TableView as subview and apply constraints.
}

-(void)setupLayout{
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self allHotels];
}

-(NSArray *)allHotels{
    if (!_allHotels) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        
        NSError * fetchError;
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error!");
        }
        _allHotels = hotels;
    }
    return _allHotels;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_allHotels count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Hotel *hotel = [_allHotels objectAtIndex:indexPath.row];
    
    cell.textLabel.text = hotel.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RoomsViewController *goingToTheRoom = [[RoomsViewController alloc]init];
    goingToTheRoom.selectedHotel = self.allHotels[indexPath.row];
    [self.navigationController pushViewController:goingToTheRoom animated:YES];
    NSLog(@"%@", _allHotels);
}


@end
//allHotels count for Rows in section.
