    //
//  ScheduleViewController.m
//  NY Ferry
//
//  Created by Todd Fearn on 7/28/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleViewCell.h"
#import "commondefs.h"

@interface ScheduleViewController(Private)
- (void)refreshView;
@end


@implementation ScheduleViewController
@synthesize scheduleData;
@synthesize from;
@synthesize to;
@synthesize fromLabel;
@synthesize toLabel;
@synthesize myTableView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Change the title of the navigation bar
	self.navigationItem.title = @"Schedule";
	
    [self refreshView];
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
	[scheduleData release];
	[from release];
	[to release];
	[fromLabel release];
	[toLabel release];
    [myTableView release];
	
    [super dealloc];
}

- (void)refreshView {
	// Read the schedule from a property list
	NSString *path = [[NSBundle mainBundle] pathForResource:@"blank-schedule" ofType:@"plist"];
    
	if([from compare:kTerminalBeacon] == NSOrderedSame && [to compare:kTerminalNewburgh] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"beacon-newburgh-schedule" ofType:@"plist"];
	else if([from compare:kTerminalBelford] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"belford-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalBelford] == NSOrderedSame && [to compare:kTerminalPaulus] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"belford-paulus-schedule" ofType:@"plist"];
	else if([from compare:kTerminalBelford] == NSOrderedSame && [to compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"belford-pier11-schedule" ofType:@"plist"];
	else if([from compare:kTerminalBelford] == NSOrderedSame && [to compare:kTerminalWFC] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"belford-wfc-schedule" ofType:@"plist"];
	else if([from compare:kTerminalEdgewater] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"edgewater-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalHaverstraw] == NSOrderedSame && [to compare:kTerminalOssining] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"haverstraw-ossining-schedule" ofType:@"plist"];
	else if([from compare:kTerminalHoboken2] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"hoboken14-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalHoboken2] == NSOrderedSame && [to compare:kTerminalWFC] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"hoboken14-wfc-schedule" ofType:@"plist"];
	else if([from compare:kTerminalHoboken1] == NSOrderedSame && [to compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"hobokennjtransit-pier11-schedule" ofType:@"plist"];
	else if([from compare:kTerminalHoboken1] == NSOrderedSame && [to compare:kTerminalWFC] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"hobokennjtransit-wfc-schedule" ofType:@"plist"];
	else if([from compare:kTerminalLibertyHarbor] == NSOrderedSame && [to compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"libertyharbor-pier11-schedule" ofType:@"plist"];
	else if([from compare:kTerminalLincolnHarbor] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"lincolnharbor-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalBelford] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-belford-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalEdgewater] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-edgewater-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalHoboken2] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-hoboken14-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalLincolnHarbor] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-lincolnharbor-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalNewport] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-newport-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalPaulus] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-paulus-schedule" ofType:@"plist"];
	else if([from compare:kTerminalMidtown] == NSOrderedSame && [to compare:kTerminalPortImperial] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"midtown-portimperial-schedule" ofType:@"plist"];
	else if([from compare:kTerminalNewburgh] == NSOrderedSame && [to compare:kTerminalBeacon] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"newburgh-beacon-schedule" ofType:@"plist"];
	else if([from compare:kTerminalNewport] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"newport-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalOssining] == NSOrderedSame && [to compare:kTerminalHaverstraw] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"ossining-haverstraw-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPaulus] == NSOrderedSame && [to compare:kTerminalBelford] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"paulus-belford-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPaulus] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"paulus-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPaulus] == NSOrderedSame && [to compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"paulus-pier11-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPaulus] == NSOrderedSame && [to compare:kTerminalWFC] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"paulus-wfc-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame && [to compare:kTerminalBelford] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier11-belford-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame && [to compare:kTerminalHoboken1] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier11-hobokennjtransit-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame && [to compare:kTerminalLibertyHarbor] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier11-libertyharbor-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame && [to compare:kTerminalPaulus] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier11-paulus-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame && [to compare:kTerminalPortImperial] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier11-portimperial-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPier11] == NSOrderedSame && [to compare:kTerminalPortLiberte] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"pier11-portliberte-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPortImperial] == NSOrderedSame && [to compare:kTerminalMidtown] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"portimperial-midtown-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPortImperial] == NSOrderedSame && [to compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"portimperial-pier11-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPortImperial] == NSOrderedSame && [to compare:kTerminalWFC] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"portimperial-wfc-schedule" ofType:@"plist"];
	else if([from compare:kTerminalPortLiberte] == NSOrderedSame && [to compare:kTerminalPier11] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"portliberte-pier11-schedule" ofType:@"plist"];
	else if([from compare:kTerminalWFC] == NSOrderedSame && [to compare:kTerminalBelford] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"wfc-belford-schedule" ofType:@"plist"];
	else if([from compare:kTerminalWFC] == NSOrderedSame && [to compare:kTerminalHoboken2] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"wfc-hoboken14-schedule" ofType:@"plist"];
	else if([from compare:kTerminalWFC] == NSOrderedSame && [to compare:kTerminalHoboken1] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"wfc-hobokennjtransit-schedule" ofType:@"plist"];
	else if([from compare:kTerminalWFC] == NSOrderedSame && [to compare:kTerminalPaulus] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"wfc-paulus-schedule" ofType:@"plist"];
	else if([from compare:kTerminalWFC] == NSOrderedSame && [to compare:kTerminalPortImperial] == NSOrderedSame)
		path = [[NSBundle mainBundle] pathForResource:@"wfc-portimperial-schedule" ofType:@"plist"];
    
	// Put the data into a new array, ordered by the keys
    scheduleData = nil;
	scheduleData = [[NSMutableArray alloc] init];
	NSDictionary *dictionary = [[[NSDictionary alloc] initWithContentsOfFile:path] autorelease];
	for(int i=0; i<[dictionary count]; i++) {
		NSString *index = [NSString stringWithFormat:@"%d", i+1];
		NSString *departsArrives = [dictionary objectForKey:index];
		NSArray *chunks = [departsArrives componentsSeparatedByString:@","];
		NSDictionary *row = [[NSDictionary alloc] initWithObjectsAndKeys:
							 [chunks objectAtIndex:0], @"arrives", [chunks objectAtIndex:1], @"departs", nil];
		NSLog(@"%@", row);
		[scheduleData addObject:row];
		[row release];
	}
	
	// Set the to and from labels
	fromLabel.text = from;
	toLabel.text = to;
    
    [self.myTableView reloadData];
}

- (IBAction)switchButtonPressed:(id)sender {
    from = toLabel.text;
    to = fromLabel.text;
    
    [self refreshView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [scheduleData count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"Weekday Schedule";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    
    ScheduleViewCell *cell = (ScheduleViewCell *)[tableView 
												  dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    if (cell == nil)  
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ScheduleViewCell" 
                                                     owner:self options:nil];
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[ScheduleViewCell class]])
                cell = (ScheduleViewCell *)oneObject;
    }
	
	
    NSUInteger row = [indexPath row];
	NSDictionary *rowData = [self.scheduleData objectAtIndex:row];
	cell.departsLabel.text = [rowData objectForKey:@"departs"];
	cell.arrivesLabel.text = [rowData objectForKey:@"arrives"];
	
    return cell;
}

@end
