//
//  SettingTableViewCell.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "SettingTableViewCell.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor whiteColor];
    [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
    [self.contentView addSubview:_titleLabel];
    
    self.backImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_backImageView];
    
    
    return self;
}
- (void)layoutSubviews {
//    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@20);
//        make.left.equalTo(@40);
//        make.width.equalTo(@40);
//        make.height.equalTo(@40);
//    }];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.top.mas_offset(22);
        make.right.mas_offset(-30);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@45);
        make.width.equalTo(@(SIZE_WIDTH * 0.65));
        make.height.equalTo(@70);
    }];
}
@end
