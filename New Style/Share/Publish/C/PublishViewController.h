//
//  PublishViewController.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/23.
//

#import "ViewController.h"
#import "PublishView.h"
#import "FMDB.h"
NS_ASSUME_NONNULL_BEGIN

@interface PublishViewController : ViewController
@property (nonatomic, strong) PublishView *publishView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) int flag;
@property (nonatomic, strong) FMDatabase *shareDataBase;
@end

NS_ASSUME_NONNULL_END
