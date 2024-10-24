//
//  MapPageViewController.m
//  New Style
//
//  Created by zzy on 2023/4/7.
//

#import "MapPageViewController.h"
#import "MapPageView.h"
#import "HJCAnnotion.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface MapPageViewController ()
@property (nonatomic, strong) UIButton *backButton;
@end

@implementation MapPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    MapPageView *map = [[MapPageView alloc] init];
//    [map viewInit];
//    [self.view addSubview:map];
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setImage:[UIImage imageNamed:@"angleLeft.png"] forState:UIControlStateNormal];
    _backButton.tag = 0;
    _backButton.frame = CGRectMake(5, 10, 30, 30);
    [_backButton addTarget:self action:@selector(buttonReturn) forControlEvents:UIControlEventTouchUpInside];
    [self.mapView addSubview:_backButton];
    self.view.backgroundColor = [UIColor blackColor];

    [self mapView];
    [self manager];
    //请求允许访问位置
    [self.manager requestAlwaysAuthorization];
    [self.manager startUpdatingLocation];
    
    _mapView.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *tapIP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    //设置相关属性
    //点击次数（默认1）
//    tapIP.numberOfTapsRequired = 2;
    tapIP.minimumPressDuration = 1;
    tapIP.allowableMovement = 10;
    //手指的个数（默认1）
    tapIP.numberOfTouchesRequired = 1;
    //添加到视图
    [self.mapView addGestureRecognizer:tapIP];
}
- (void)tapClick:(UILongPressGestureRecognizer*)tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)buttonReturn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark Manager
//懒加载位置管理器
- (CLLocationManager *)manager
{
    if (_manager == nil) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        
        [_manager startUpdatingLocation];
    }
    return _manager;
}
//经纬度
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    CLLocation *location = locations.lastObject;
//    NSLog(@"Latitude: %f, Longitude: %f", location.coordinate.latitude, location.coordinate.longitude);
}

// 获取方向信息
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    CLLocationDirection heading = newHeading.trueHeading;
    NSLog(@"%f", heading);
}


#pragma mark MapView
- (MKMapView *)mapView {
    if (!_mapView) {
        //当前地图跟踪模式
        CLLocationCoordinate2D center;
        center.latitude = 34.155739f;
        center.longitude = 108.905731f;
        MKCoordinateSpan span;
        span.latitudeDelta = 0.2;
        span.longitudeDelta = 0.2;
        MKCoordinateRegion region = {center, span};
        
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, SIZE_HEIGHT)];
        self.mapView.showsBuildings = YES;
        self.mapView.showsCompass = YES;
        self.mapView.showsScale = YES;
        self.mapView.showsTraffic = YES;
        [self.view addSubview:self.mapView];
        self.mapView.delegate = self;
        //self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        [self.mapView setRegion:region];
        
        HJCAnnotion* ann1 = [[HJCAnnotion alloc ] init];
        [self.mapView addAnnotation:ann1];
        //创建手势
        //UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addMyAnootation:)];
        //   加入地图上
        //[self.mapView addGestureRecognizer:top];
    }
    return _mapView;
}
//更新位置的时候，会触发
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"");
    //当前的坐标，反编码
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        //取出标记
        CLPlacemark *pm = [placemarks lastObject];
        //赋值
        userLocation.title = pm.name;
    }];
 
}

@end
