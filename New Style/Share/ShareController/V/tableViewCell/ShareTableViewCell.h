//
//  ShareTableViewCell.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareTableViewCell : UITableViewCell
- (void)setModel:(NSDictionary *)dictionary;
@property (nonatomic, strong, readonly) UIButton *deleteButton;   //删除按钮
@end

NS_ASSUME_NONNULL_END
