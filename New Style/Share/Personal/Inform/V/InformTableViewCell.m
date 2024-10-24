//
//  InformTableViewCell.m
//  New Style
//
//  Created by zzy on 2023/4/12.
//

#import "InformTableViewCell.h"
#import "InformView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation InformTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _informImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"] highlightedImage:UIControlStateNormal];
    [self.contentView addSubview:self.informImageView];
    
    _informLabel = [[UILabel alloc] init];
    _informLabel.textColor = [UIColor blackColor];
    _informLabel.textAlignment = NSTextAlignmentLeft;
    _informLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    [self.contentView addSubview:self.informLabel];
    
    
    
    return self;
}

- (void)layoutSubviews {
    
    [_informImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@(SIZE_WIDTH - 70));
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [_informLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@50);
        make.width.equalTo(@(SIZE_WIDTH - 50));
        make.height.equalTo(@50);
    }];
        
}

@end
