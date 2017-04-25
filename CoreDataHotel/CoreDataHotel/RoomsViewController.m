//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import "RoomsViewController.h"

#import "HotelsViewController.h"

#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface RoomsViewController () <UITableViewDataSource>

@property(strong, nonatomic) NSArray *allRooms;
@property(strong, nonatomic) UITableView *tableView;

@end

@implementation RoomsViewController

-(void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]init];
    
    [self.view addSubview:self.tableView];
    //add TableView as subview and apply constraints.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.allRooms = [[self.selectedHotel rooms] allObjects];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.allRooms count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    Room *room = [self.allRooms objectAtIndex: indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%hd", room.number];
    NSLog(@"%@", _allRooms);

    return cell;
}



@end
