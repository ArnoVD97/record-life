//
//  CollectionTableViewCell.m
//  New Style
//
//  Created by zzy on 2023/4/13.
//

#import "CollectionTableViewCell.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation CollectionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _collectionImageView = [[UIImageView alloc] init];


    [self.contentView addSubview:_collectionImageView];
    
    _collectionLabel = [[UILabel alloc] init];
    _collectionLabel.numberOfLines = 2;
    _collectionLabel.textColor = [UIColor blackColor];
    _collectionLabel.font = [UIFont fontWithName:@"Helvetica-Bold"size:20];
    [self.contentView addSubview:_collectionLabel];
    return self;
}
- (void)layoutSubviews {
    [_collectionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12.5);
        make.left.equalTo(@(SIZE_WIDTH - 137.5));
        make.width.equalTo(@125);
        make.height.equalTo(@125);
    }];
    [_collectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@25);
        make.width.equalTo(@(SIZE_WIDTH - 150));
        make.height.equalTo(@75);
    }];
}
@end
