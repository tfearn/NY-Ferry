//
//  LocationViewController.m
//  NY Ferry
//
//  Created by Todd Fearn on 3/12/12.
//  Copyright (c) 2012 iDATA Corporation. All rights reserved.
//

#import "LocationViewController.h"
#import "commondefs.h"

@implementation LocationViewController
@synthesize myMapView;

- (void)loadView {
    [super loadView];

	self.navigationItem.title = @"Ferry Terminals";

    // Setup the map region
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.7823234;
    zoomLocation.longitude = -73.9654161;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 10000.0, 10000.0);
    MKCoordinateRegion adjustedRegion = [myMapView regionThatFits:viewRegion];                
    [myMapView setRegion:adjustedRegion animated:YES];
    
    // Add the annotations
    CLLocationCoordinate2D coordinate;
    MyLocation *annotation = nil;

    coordinate.latitude = 40.433382;
    coordinate.longitude = -74.078853;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalBelford number:kTerminalBelfordTag address:@"10 Harbor Way, Belford, NJ 07718" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];   
    
    coordinate.latitude = 40.827963;
    coordinate.longitude = -73.969727;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalEdgewater number:kTerminalEdgewaterTag address:@"989 River Road, Edgewater, NJ 07020" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];   
    
    coordinate.latitude = 40.734145;
    coordinate.longitude = -74.027542;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalHoboken1 number:kTerminalHoboken1Tag address:@"1 Hudson Place, Hoboken, NJ 07030" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.752678;
    coordinate.longitude = -74.022607;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalHoboken2 number:kTerminalHoboken2Tag address:@"1401 Frank Sinatra Drive, Hoboken,NJ 07030" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.710959;
    coordinate.longitude = -74.040347;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalLibertyHarbor number:kTerminalLibertyHarborTag address:@"11 Luis Munoz Marin Blvd, Jersey City,NJ 07302" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.758733;
    coordinate.longitude = -74.022709;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalLincolnHarbor number:kTerminalLincolnHarborTag address:@"Harbor Blvd, Weehawken,NJ 07086" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.727519;
    coordinate.longitude = -74.029945;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalNewport number:kTerminalNewportTag address:@"30 River Court, Jersey City,NJ 07310" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];

    coordinate.latitude = 40.713704;
    coordinate.longitude = -74.03252;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalPaulus number:kTerminalPaulusTag address:@"Hudson St. @ Exchange Place, Jersey City,NJ 07302" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];        
    
    coordinate.latitude = 40.776672;
    coordinate.longitude = -74.01062;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalPortImperial number:kTerminalPortImperialTag address:@"4800 Avenue at Port Imperial, Weehawken, NJ 07086" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];        
    
    coordinate.latitude = 40.687395;
    coordinate.longitude = -74.07506;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalPortLiberte number:kTerminalPortLiberteTag address:@"7 Chapel Avenue, Jersey City, NJ 07302" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 41.505665;
    coordinate.longitude = -73.986724;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalBeacon number:kTerminalBeaconTag address:@"1 Ferry Plaza Beekman Street, New York, NY 10281" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 41.192901;
    coordinate.longitude = -73.958057;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalHaverstraw number:kTerminalHaverstrawTag address:@"30-34 Dr.Girling Dr, Haverstraw, NY 10927" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.760659;
    coordinate.longitude = -74.004089;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalMidtown number:kTerminalMidtownTag address:@"459 12th Avenue, New York, NY 10018" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 41.50084;
    coordinate.longitude = -74.004614;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalNewburgh number:kTerminalNewburghTag address:@"2 Washington St, Newburgh, NY 12550" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 41.156912;
    coordinate.longitude = -73.87125;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalOssining number:kTerminalOssiningTag address:@"1 Main Street & Westerly Rd, Ossining, NY 10562" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.703509;
    coordinate.longitude = -74.006578;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalPier11 number:kTerminalPier11Tag address:@"Pier 11 @ South Street, New York, NY" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
    
    coordinate.latitude = 40.715037;
    coordinate.longitude = -74.017789;    
    annotation = [[[MyLocation alloc] initWithName:kTerminalWFC number:kTerminalWFCTag address:@"Vessey Street, New York, NY 10281" coordinate:coordinate] autorelease];
    [myMapView addAnnotation:annotation];
}

- (void)viewWillAppear:(BOOL)animated {  
    [super viewWillAppear:animated];
}

- (void)dealloc {
    [myMapView release];
    [super dealloc];
}

- (void)showLocationDetails:(id)sender {
    NSString *title = ((UIButton *)sender).currentTitle;
    title = nil;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(MyLocation *)annotation {
    
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    if (!pinView) {
        pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"] autorelease];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        pinView.tag = annotation.number;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = rightButton;
    } else {
        pinView.annotation = annotation;
    }
    return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSString *terminal = nil;
    
    switch (view.tag) {
        case kTerminalBeaconTag:
            terminal = kTerminalBeacon;
            break;
        case kTerminalBelfordTag:
            terminal = kTerminalBelford;
            break;
        case kTerminalEdgewaterTag:
            terminal = kTerminalEdgewater;
            break;
        case kTerminalHaverstrawTag:
            terminal = kTerminalHaverstraw;
            break;
        case kTerminalHoboken1Tag:
            terminal = kTerminalHoboken1;
            break;
        case kTerminalHoboken2Tag:
            terminal = kTerminalHoboken2;
            break;
        case kTerminalLibertyHarborTag:
            terminal = kTerminalLibertyHarbor;
            break;
        case kTerminalMidtownTag:
            terminal = kTerminalMidtown;
            break;
        case kTerminalNewburghTag:
            terminal = kTerminalNewburgh;
            break;
        case kTerminalNewportTag:
            terminal = kTerminalNewport;
            break;
        case kTerminalOssiningTag:
            terminal = kTerminalOssining;
            break;
        case kTerminalPaulusTag:
            terminal = kTerminalPaulus;
            break;
        case kTerminalPier11Tag:
            terminal = kTerminalPier11;
            break;
        case kTerminalPortLiberteTag:
            terminal = kTerminalPortLiberte;
            break;
        case kTerminalLincolnHarborTag:
            terminal = kTerminalLincolnHarbor;
            break;
        case kTerminalPortImperialTag:
            terminal = kTerminalPortImperial;
            break;
        case kTerminalWFCTag:
            terminal = kTerminalWFC;
            break;
            
        default:
            break;
    }

	ScheduleToViewController *controller = [[ScheduleToViewController alloc] initWithNibName:@"ScheduleToView" bundle:nil];
	[controller setFrom:terminal];
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

@end
