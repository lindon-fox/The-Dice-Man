//
//  NewRollDefinitionViewController.h
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewRollDefinitionViewController;

@protocol NewRollDefinitionDelegate <NSObject>

-(void)cancelButtonPressedForViewController:(NewRollDefinitionViewController *)viewController;

@end

@interface NewRollDefinitionViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {

    IBOutlet UITextField *nameTextField;
}
-(IBAction)cancelButtonPressed:(id)sender;
-(IBAction)doneButtonPressed:(id)sender;

@property (nonatomic, retain) id<NewRollDefinitionDelegate> delegate;

@end
