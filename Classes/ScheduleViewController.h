//
//  ScheduleViewController.h
//  NY Ferry
//
//  Created by Todd Fearn on 7/28/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScheduleViewController : UIViewController {
	NSMutableArray *scheduleData;
	NSString *from;
	NSString *to;
	IBOutlet UILabel *fromLabel;
	IBOutlet UILabel *toLabel;
    IBOutlet UITableView *myTableView;
}
@property (nonatomic, retain) NSMutableArray *scheduleData;
@property (nonatomic, retain) NSString *from;
@property (nonatomic, retain) NSString *to;
@property (nonatomic, retain) IBOutlet UILabel *fromLabel;
@property (nonatomic, retain) IBOutlet UILabel *toLabel;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;

- (IBAction)switchButtonPressed:(id)sender;


@end
