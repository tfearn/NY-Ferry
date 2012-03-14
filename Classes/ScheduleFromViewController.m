    //
//  ScheduleFromViewController.m
//  NY Ferry
//
//  Created by Todd Fearn on 7/20/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import "ScheduleFromViewController.h"
#import "ScheduleToViewController.h"


@implementation ScheduleFromViewController
@synthesize terminalData;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Get the terminals from the plist
	NSString *path = [[NSBundle mainBundle] pathForResource:@"terminals" ofType:@"plist"];
	NSDictionary *dictionary = [[[NSDictionary alloc] initWithContentsOfFile:path] autorelease];
	NSArray *array = [[dictionary allValues] sortedArrayUsingSelector: @selector(compare:)];
	
	self.terminalData = array;
	
	// Change the title of the navigation bar
	self.navigationItem.title = @"From";
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	
	[terminalData release];
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    return [self.terminalData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    }
    	
    UIImage *image = [UIImage imageNamed:@"ferry-small.png"];
    UIImage *image2 = [UIImage imageNamed:@"ferry-small.png"];
    cell.imageView.image = image;
    cell.imageView.highlightedImage = image2;
	
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [terminalData objectAtIndex:row];
	cell.textLabel.font = [UIFont systemFontOfSize:15.0];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Create the view controller
	ScheduleToViewController *controller = [[ScheduleToViewController alloc] initWithNibName:@"ScheduleToView" bundle:nil];
	
	// Give the controller data to display
    NSUInteger row = [indexPath row];
    NSString *from = [terminalData objectAtIndex:row];
	[controller setFrom:from];
	
	// Show the controller
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}


@end
