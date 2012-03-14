    //
//  MapViewController.m
//  NY Ferry
//
//  Created by Todd Fearn on 7/29/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController
@synthesize scrollView;
@synthesize imageView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.scrollView.minimumZoomScale=0.20;
    self.scrollView.maximumZoomScale=2.0;
	self.scrollView.contentSize = CGSizeMake(2062, 2410);
    self.scrollView.delegate=self;
	self.scrollView.clipsToBounds = YES;
	self.scrollView.zoomScale=0.50;

    [super viewDidLoad];
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
	[scrollView release];
	[imageView release];
	
    [super dealloc];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
