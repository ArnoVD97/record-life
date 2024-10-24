//
//  ShareView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShareView : UIView
- (void)viewInit;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;   //分栏控件
@property (nonatomic, strong) UIScrollView *scrollView;   //滚动视图
@property (nonatomic, strong) FMDatabase *shareDataBase;
- (void)queryData;

@property (nonatomic, strong, readonly) UICollectionView *photoCollectionView;   //左侧图片
@property (nonatomic, strong, readonly) UITableView *photoTableView;   //右侧图片
@end

NS_ASSUME_NONNULL_END
