//
//  MasterViewController.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 25/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import "MasterViewController.h"
#import "ConfirmRollViewController.h"
#import "NewRollDefinitionViewController.h"


@interface MasterViewController(PrivateMethods)
-(void)addButtonPressed:(id)sender;
@end

@implementation MasterViewController

@synthesize confirmRollViewController = _confirmRollViewController;
@synthesize newRollDefinitionViewController = _newRollDefinitionViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        rollDefinitions = [[NSMutableArray alloc] init];
        [rollDefinitions addObject:[RollDefinition rollDefinitionWithNumberOfPossibilities:2]];
        [rollDefinitions addObject:[RollDefinition rollDefinitionWithNumberOfPossibilities:3]];
        [rollDefinitions addObject:[RollDefinition rollDefinitionWithNumberOfPossibilities:9]];
    }
    return self;
}
							
- (void)dealloc
{
    [rollDefinitions release];
    [_confirmRollViewController release];
    [super dealloc];
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
    UIBarButtonItem *addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];

    self.navigationItem.rightBarButtonItem = addBarButtonItem;
    [addBarButtonItem release];
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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [rollDefinitions count];
    }
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Configure the cell.
    RollDefinition *rollDefinition = (RollDefinition *)[rollDefinitions objectAtIndex:indexPath.row];
    cell.textLabel.text = [rollDefinition getDisplayName];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.confirmRollViewController) {
        self.confirmRollViewController = [[[ConfirmRollViewController alloc] initWithNibName:@"ConfirmRollViewController" bundle:nil] autorelease];
    }
    RollDefinition *rollDefinition = [rollDefinitions objectAtIndex:indexPath.row];
    [self.confirmRollViewController setRollDefinition:rollDefinition];
    [self.navigationController pushViewController:self.confirmRollViewController animated:YES];
}

- (void) addButtonPressed:(id)sender
{
    if (!self.newRollDefinitionViewController) {
        self.newRollDefinitionViewController = [[[NewRollDefinitionViewController alloc] initWithNibName:@"NewRollDefinitionViewController" bundle:nil] autorelease];
        self.newRollDefinitionViewController.delegate = self;
    }
    [self.navigationController presentModalViewController:self.newRollDefinitionViewController animated:YES];
}

- (void) cancelButtonPressedForViewController:(NewRollDefinitionViewController *)viewController{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

@end
