//
//  LocationViewController.h
//  NY Ferry
//
//  Created by Todd Fearn on 3/12/12.
//  Copyright (c) 2012 iDATA Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "MyLocation.h"
#import "ScheduleToViewController.h"

@interface LocationViewController : UIViewController {
    IBOutlet MKMapView *myMapView;
}
@property (nonatomic, retain) MKMapView *myMapView;

@end
