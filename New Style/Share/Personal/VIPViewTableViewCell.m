//
//  VIPViewTableViewCell.m
//  New Style
//
//  Created by zzy on 2023/4/11.
//

#import "VIPViewTableViewCell.h"
#import "Masonry.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface VIPViewTableViewCell()


@end
@implementation VIPViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _platformImageView = [[UIImageView alloc] init];
//    _platformImageView.image = [UIImage imageNamed:@"weChat.png"];
    [self.contentView addSubview:_platformImageView];
    
    self.platformLabel = [[UILabel alloc] init];
    self.platformLabel.textAlignment = NSTextAlignmentLeft;

    _platformLabel.textColor = [UIColor blackColor];
    [_platformLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
    [self.contentView addSubview:_platformLabel];
    _chooseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _chooseButton.userInteractionEnabled = YES;
    [_chooseButton addTarget:self action:@selector(buttonState) forControlEvents:UIControlEventTouchUpInside];
    [_chooseButton setImage:[UIImage imageNamed:@"off.png"] forState:UIControlStateNormal];
    [self.contentView addSubview:_chooseButton];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_platformImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@10);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [_platformLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@75);
        make.width.equalTo(@(SIZE_WIDTH * 0.65));
        make.height.equalTo(@40);
    }];
    [_chooseButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.top.mas_offset(5);
        make.right.mas_offset(-30);
    }];
}
- (void)buttonState {
    [_chooseButton setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
    NSLog(@"222");
}

@end
