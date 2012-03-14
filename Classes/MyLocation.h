//
//  MyLocation.h
//  NY Ferry
//
//  Created by Todd Fearn on 3/12/12.
//  Copyright (c) 2012 iDATA Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation> {
    int _number;
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
}
@property int number;
@property (copy) NSString *name;
@property (copy) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name number:(int)number address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;

@end