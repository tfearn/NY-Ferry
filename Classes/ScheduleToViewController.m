    //
//  ScheduleToViewController.m
//  NY Ferry
//
//  Created by Todd Fearn on 7/20/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import "ScheduleToViewController.h"
#import "ScheduleViewController.h"
#import "commondefs.h"


@implementation ScheduleToViewController
@synthesize terminalData;
@synthesize from;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"terminals" ofType:@"plist"];
	
	if([from compare:kTerminalBeacon] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"beacon-terminal" ofType:@"plist"];
	else if([from compare:kTerminalBelford] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"belford-terminal" ofType:@"plist"];
	else if([from compare:kTerminalEdgewater] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"edgewater-terminal" ofType:@"plist"];
	else if([from compare:kTerminalHaverstraw] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"haverstraw-terminal" ofType:@"plist"];
	else if([from compare:kTerminalHoboken1] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"hoboken-njtransit-terminal" ofType:@"plist"];
	else if([from compare:kTerminalHoboken2] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"hoboken-14th-terminal" ofType:@"plist"];
	else if([from compare:kTerminalLibertyHarbor] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"liberty-harbor-terminal" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-terminal" ofType:@"plist"];
	else if([from compare:kTerminalNewburgh] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"newburgh-terminal" ofType:@"plist"];
	else if([from compare:kTerminalNewport] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"newport-terminal" ofType:@"plist"];
	else if([from compare:kTerminalOssining] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"ossining-terminal" ofType:@"plist"];
	else if([from compare:kTerminalPaulus] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"paulus-hook-terminal" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier-11-terminal" ofType:@"plist"];
	else if([from compare:kTerminalPortLiberte] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"port-liberte-terminal" ofType:@"plist"];
	else if([from compare:kTerminalLincolnHarbor] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"weehawken-lincoln-terminal" ofType:@"plist"];
	else if([from compare:kTerminalPortImperial] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"weehawken-port-imperial-terminal" ofType:@"plist"];
	else if([from compare:kTerminalWFC] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"wfc-terminal" ofType:@"plist"];
	
	// Get the terminals from the plist
	NSDictionary *dictionary = [[[NSDictionary alloc] initWithContentsOfFile:path] autorelease];
	NSArray *array = [[dictionary allValues] sortedArrayUsingSelector: @selector(compare:)];
	
	self.terminalData = array;
	
	// Change the title of the navigation bar
	self.navigationItem.title = @"To";
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
	[from release];
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
	// What did they select?

	// Create the view controller
	ScheduleViewController *controller = [[ScheduleViewController alloc] initWithNibName:@"ScheduleView" bundle:nil];
	
	// Give the controller data to display
    NSUInteger row = [indexPath row];
    NSString *to = [terminalData objectAtIndex:row];
	[controller setFrom:from];
	[controller setTo:to];
	
	// Show the controller
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}


@end
