//
//  ConfirmRollViewController.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import "ConfirmRollViewController.h"
#import "DetailViewController.h"

@interface ConfirmRollViewController (PrivateMethods)
- (void)configureView;
@end
@implementation ConfirmRollViewController

@synthesize detailViewController = _detailViewController;
@synthesize rollDefinition = _rollDefinition;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [rollDefinition release];
    [_detailViewController release];
    [super dealloc];
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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)setRollDefinition:(RollDefinition *)newRollDefinition
{
    if (_rollDefinition != newRollDefinition) {
        [_rollDefinition release]; 
        _rollDefinition = [newRollDefinition retain]; 
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.rollDefinition) {
        [self setTitle:[rollDefinition getDisplayName]];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(IBAction)letItRollButtonTapped:(id)sender{
    
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    self.detailViewController.rollDefinition = rollDefinition;
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}
@end
