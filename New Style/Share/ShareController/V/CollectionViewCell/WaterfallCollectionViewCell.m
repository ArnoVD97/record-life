//
//  WaterfallCollectionViewCell.m
//  New Style
//
//  Created by 翟旭博 on 2023/3/5.
//

#import "WaterfallCollectionViewCell.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface WaterfallCollectionViewCell ()
@property (nonatomic, strong) UIImageView *mainImageView;
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *goodImageView;
@property (nonatomic, strong) UILabel *goodLabel;
@end
@implementation WaterfallCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.mainImageView];
        [self.contentView addSubview:self.mainLabel];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.goodLabel];
        [self.contentView addSubview:self.goodImageView];
    }
    return self;
}

- (UIImageView *)mainImageView {
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.layer.masksToBounds = YES;
        _mainImageView.layer.cornerRadius = 0.03 * SIZE_WIDTH;
        _mainImageView.backgroundColor = [UIColor redColor];
    }
    return _mainImageView;
}

- (UILabel *)mainLabel {
    if (!_mainLabel) {
        _mainLabel = [[UILabel alloc] init];
        _mainLabel.numberOfLines = 0;
    }
    return _mainLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.textColor = [UIColor grayColor];
    }
    return _nameLabel;
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 0.025 * SIZE_WIDTH;
    }
    return _headImageView;
}

- (UIImageView *)goodImageView {
    if (!_goodImageView) {
        _goodImageView = [[UIImageView alloc] init];
        _goodImageView.image = [UIImage imageNamed:@"aixin.png"];
    }
    return _goodImageView;
}

- (UILabel *)goodLabel {
    if (!_goodLabel) {
        _goodLabel = [[UILabel alloc] init];
        _goodLabel.font = [UIFont systemFontOfSize:13];
        _goodLabel.textColor = [UIColor grayColor];
    }
    return _goodLabel;
}

- (void)setModel:(NSArray *)array and:(int)tag {
    self.mainLabel.text = array[tag][@"mainLabel"];
    self.nameLabel.text = array[tag][@"name"];
    self.mainImageView.image = array[tag][@"mainImage"];
    self.headImageView.image = array[tag][@"head"];
    self.goodLabel.text = array[tag][@"good"];
    [self addMasonry];
}
- (void)addMasonry {
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(5);
        make.left.mas_equalTo(self.contentView).offset(5);
        make.height.equalTo(@(0.05 * SIZE_WIDTH));
        make.width.equalTo(@(0.05 * SIZE_WIDTH));
    }];
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(5);
        make.right.mas_equalTo(self.contentView).offset(-5);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.height.mas_equalTo((self.frame.size.width - 10) * self.mainImageView.image.size.height / self.mainImageView.image.size.width);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(10);
        make.left.mas_equalTo(self.contentView).offset(0.05 * SIZE_WIDTH + 10);
        make.right.mas_equalTo(self.contentView).offset(-5);
        make.height.equalTo(@30);
    }];
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.nameLabel).offset(-20);
        make.left.mas_equalTo(self.contentView).offset(5);
        make.right.mas_equalTo(self.contentView).offset(-5);
        make.top.mas_equalTo(self.mainImageView.mas_bottom).offset(0);
    }];
    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(5);
        make.right.mas_equalTo(self.contentView).offset(-35);
        make.height.equalTo(@(0.05 * SIZE_WIDTH));
        make.width.equalTo(@(0.05 * SIZE_WIDTH));
    }];
    [self.goodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-20);
        make.height.equalTo(@30);
    }];
}
@end
