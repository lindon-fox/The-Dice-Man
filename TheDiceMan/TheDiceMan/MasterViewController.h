//
//  MasterViewController.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 25/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RollDefinition.h"

@class ConfirmRollViewController;

@interface MasterViewController : UITableViewController{
    NSMutableArray *rollDefinitions;
}

@property (strong, nonatomic) ConfirmRollViewController *confirmRollViewController;

@end
