//
//  MapViewController.h
//  NY Ferry
//
//  Created by Todd Fearn on 7/29/10.
//  Copyright 2010 iDATA Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MapViewController : UIViewController <UIScrollViewDelegate> {
	IBOutlet UIScrollView *scrollView;
	IBOutlet UIImageView *imageView;
}
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *imageView;

@end
