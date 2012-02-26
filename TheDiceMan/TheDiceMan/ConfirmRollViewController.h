//
//  ConfirmRollViewController.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RollDefinition.h"

@class DetailViewController;

@interface ConfirmRollViewController : UIViewController{
    RollDefinition *rollDefinition;
}

@property (nonatomic, retain) RollDefinition *rollDefinition;
@property (strong, nonatomic) DetailViewController *detailViewController;


-(IBAction)letItRollButtonTapped:(id)sender;

@end
