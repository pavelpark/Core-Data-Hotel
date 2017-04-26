//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by Pavel Parkhomey on 4/25/17.
//  Copyright © 2017 Pavel Parkhomey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room+CoreDataClass.h"

@interface BookViewController : UIViewController

@property(strong, nonatomic)Room *selectedRoom;

@end
