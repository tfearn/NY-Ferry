//
//  MyLocation.m
//  NY Ferry
//
//  Created by Todd Fearn on 3/12/12.
//  Copyright (c) 2012 iDATA Corporation. All rights reserved.
//

#import "MyLocation.h"

@implementation MyLocation
@synthesize number = _number;
@synthesize name = _name;
@synthesize address = _address;
@synthesize coordinate = _coordinate;

- (id)initWithName:(NSString*)name number:(int)number address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        _name = [name copy];
        _number = number;
        _address = [address copy];
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return _name;
}

- (NSString *)subtitle {
    return _address;
}

- (void)dealloc
{
    [_name release];
    _name = nil;
    [_address release];
    _address = nil;    
    [super dealloc];
}
@end
