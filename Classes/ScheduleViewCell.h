//
//  ScheduleViewCell.h
//  NY Ferry
//
//  Created by Todd Fearn on 7/20/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScheduleViewCell : UITableViewCell {
	IBOutlet UILabel *departsLabel;
	IBOutlet UILabel *arrivesLabel;
}

@property (nonatomic, retain) UILabel *departsLabel;
@property (nonatomic, retain) UILabel *arrivesLabel;

@end
