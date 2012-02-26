//
//  DetailViewController.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 25/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RollDefinition;

@interface DetailViewController : UIViewController{
    
}

@property (strong, nonatomic) RollDefinition *rollDefinition;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;



@end
