//
//  RoomsViewController.h
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/24/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.m"

@interface RoomsViewController : UIViewController

@property (strong, nonatomic) Hotel *selectedHotel;

@end
