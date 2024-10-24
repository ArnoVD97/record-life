//
//  HJCAnnotion.h
//  New Style
//
//  Created by zzy on 2023/4/7.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HJCAnnotion : NSObject<MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

NS_ASSUME_NONNULL_END
