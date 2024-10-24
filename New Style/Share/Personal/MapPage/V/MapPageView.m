//
//  MapPageView.m
//  New Style
//
//  Created by zzy on 2023/4/7.
//

#import "MapPageView.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation MapPageView

- (void)viewInit {
    _mapImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map.jpg"]];
    _mapImageView.frame = CGRectMake(0, 0, SIZE_WIDTH, SIZE_HEIGHT);
    [self addSubview:_mapImageView];
}

@end
