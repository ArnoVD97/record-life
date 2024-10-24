//
//  PersonalDataTableViewCell.h
//  New Style
//
//  Created by zzy on 2023/4/4.
//
//头像，名字，账号，性别，地区，（个性签名）

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalDataTableViewCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

NS_ASSUME_NONNULL_END
