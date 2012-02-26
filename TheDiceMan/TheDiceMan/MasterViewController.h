//
//  MasterViewController.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 25/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RollDefinition.h"
#import "NewRollDefinitionViewController.h"

@class ConfirmRollViewController;
@class NewRollDefinitionViewController;

@interface MasterViewController : UITableViewController<NewRollDefinitionDelegate>{
    NSMutableArray *rollDefinitions;
}

@property (strong, nonatomic) ConfirmRollViewController *confirmRollViewController;
@property (strong, nonatomic) NewRollDefinitionViewController* newRollDefinitionViewController;

@end
