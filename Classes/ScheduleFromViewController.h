//
//  ScheduleFromViewController.h
//  NY Ferry
//
//  Created by Todd Fearn on 7/20/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleFromViewController.h"

@interface ScheduleFromViewController : UIViewController {
	NSArray *terminalData;
}
@property (nonatomic, retain) NSArray *terminalData;

@end
