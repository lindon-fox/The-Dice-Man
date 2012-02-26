//
//  DetailViewController.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 25/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import "DetailViewController.h"
#import "RollDefinition.h"
#import "RandomEngine.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize rollDefinition = _rollDefinition;
@synthesize rollResult = _rollResult;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

- (void)dealloc
{
    [_rollDefinition release];
    [_detailDescriptionLabel release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setRollDefinition:(RollDefinition *)newRollDefinition
{
    if (_rollDefinition != newRollDefinition) {
        [_rollDefinition release]; 
        _rollDefinition = [newRollDefinition retain]; 
        // Update the view.
        requiresConfiguration = YES;
    }
}

-(void) setRollResult:(int)newRollResult
{
    if (_rollResult != newRollResult) {
        _rollResult = newRollResult;
        requiresConfiguration = YES;
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.rollDefinition) {
        self.detailDescriptionLabel.text = [self.rollDefinition getDisplayNameForOption:self.rollResult];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (requiresConfiguration) {
        [self configureView];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
        requiresConfiguration = YES;
    }
    return self;
}
							
@end
