//
//  NewRollDefinitionViewController.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import "NewRollDefinitionViewController.h"
#import "RollDefinition.h"

@implementation NewRollDefinitionViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 9;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
 return [RollDefinition getDefaultNameForOption:row];   
}


-(IBAction)cancelButtonPressed:(id)sender{
    [delegate cancelButtonPressedForViewController:self];
}

-(IBAction)doneButtonPressed:(id)sender{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

@end
