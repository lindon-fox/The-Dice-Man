//
//  ConfirmRollViewController.m
//  TheDiceMan
//
//  Created by Johnny Grattan on 26/02/12.
//  Copyright (c) 2012 ABS. All rights reserved.
//

#import "ConfirmRollViewController.h"
#import "DetailViewController.h"
#import "RandomEngine.h"

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
    [_rollDefinition release];
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
    DBLog(@"Roll Definition: number of options: %d", self.rollDefinition.numberOfPossibilities);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.detailViewController.rollResult inSection:0];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
        [self setTitle:[self.rollDefinition getDisplayName]];
        [tableView reloadData];
        
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)pushResultsController{
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

-(IBAction)letItRollButtonTapped:(id)sender{
    
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    self.detailViewController.rollDefinition = self.rollDefinition;
    int rollResult = [RandomEngine rollWithRollDefinition:self.rollDefinition];
    DBLog(@"Roll result: %d", rollResult);
    self.detailViewController.rollResult = rollResult;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.detailViewController.rollResult inSection:0];
    tableView.allowsSelection = YES;
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    tableView.allowsSelection = NO;
    
    [self performSelector:@selector(pushResultsController) withObject:nil afterDelay:0.5];
}



// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.rollDefinition numberOfPossibilities];
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
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
    cell.textLabel.text = [NSString stringWithFormat:@"Option %d", indexPath.row + 1];
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

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Options";
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //do nothing
}
@end
