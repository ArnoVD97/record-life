//
//  FriendsView.h
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendsView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *collectionLabelArray;
@property (nonatomic, strong)NSMutableArray *collectionImageArray;
@property (nonatomic, strong)UITableView *collectionTableView;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
