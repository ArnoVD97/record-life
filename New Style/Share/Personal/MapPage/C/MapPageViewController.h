//
//  MapPageViewController.h
//  New Style
//
//  Created by zzy on 2023/4/7.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapPageViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;

@end

NS_ASSUME_NONNULL_END
