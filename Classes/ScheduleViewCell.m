    //
//  ScheduleViewCell.m
//  NY Ferry
//
//  Created by Todd Fearn on 7/20/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import "ScheduleViewCell.h"


@implementation ScheduleViewCell

@synthesize departsLabel;
@synthesize arrivesLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}

- (void)dealloc {
	[departsLabel release];
	[arrivesLabel release];
    [super dealloc];
}


@end
