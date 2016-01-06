//
//  ViewController.m
//  MyCustomPinProject
//
//  Created by Thomas Lextrait on 1/4/16.
//  Copyright © 2016 com.tlextrait. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomPointAnnotation.h"
#import "MyCustomPinAnnotationView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView setDelegate:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Center the map on Boston
    CLLocationCoordinate2D BostonCoordinates = CLLocationCoordinate2DMake(42.3601, -71.0589);
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(BostonCoordinates, 500, 500);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    MyCustomPointAnnotation* point1 = [[MyCustomPointAnnotation alloc] init];
    point1.coordinate = CLLocationCoordinate2DMake(42.3601, -71.0589);
    point1.price = 3;
    [self.mapView addAnnotation:point1];
    
    MyCustomPointAnnotation* point2 = [[MyCustomPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(42.3606, -71.0583);
    point2.price = 5;
    [self.mapView addAnnotation:point2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView*)mapView:(MKMapView *)mapView
           viewForAnnotation:(id<MKAnnotation>)annotation
{
    // Don't do anything if it's the user's location point
    if([annotation isKindOfClass:[MKUserLocation class]]) return nil;
    
    // We could display multiple types of point annotations
    if([annotation isKindOfClass:[MyCustomPointAnnotation class]]){
        MyCustomPinAnnotationView* pin = [[MyCustomPinAnnotationView alloc] initWithAnnotation:annotation];
        return pin;
    }
    
    return nil;
}

@end
