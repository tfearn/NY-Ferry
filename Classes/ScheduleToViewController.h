//
//  ScheduleToViewController.h
//  NY Ferry
//
//  Created by Todd Fearn on 7/20/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScheduleToViewController : UIViewController {
	NSArray *terminalData;
	NSString *from;
}
@property (nonatomic, retain) NSArray *terminalData;
@property (nonatomic, retain) NSString *from;

@end
