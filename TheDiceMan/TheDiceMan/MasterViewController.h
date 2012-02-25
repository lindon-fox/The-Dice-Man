//
//  MasterViewController.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 25/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
