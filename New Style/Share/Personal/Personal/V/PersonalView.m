//
//  PersonalView.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "PersonalView.h"
#import "Masonry.h"
#import "PersonalTableViewCell.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface PersonalView ()
@property (nonatomic, strong) UILabel *VIPTopUpLabel;
@end

@implementation PersonalView

- (void)viewInit {    
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(SIZE_WIDTH/16, SIZE_HEIGHT/16, SIZE_WIDTH-50, SIZE_HEIGHT/3)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0.5, 0);
    gradient.endPoint = CGPointMake(0.5, 1);
    gradient.frame = CGRectMake(0, 0, SIZE_WIDTH-50, SIZE_HEIGHT/3);
    gradient.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor, (id)[UIColor colorWithRed:36.0/255.0 green:39.0/255.0 blue:45.0/255.0 alpha:1].CGColor, nil];
    [_backgroundView.layer insertSublayer:gradient atIndex:0];
    //    _backgroundView.backgroundColor = [UIColor grayColor];
    [_backgroundView.layer setMasksToBounds:YES];
    [_backgroundView.layer setCornerRadius:32];
    [self addSubview:_backgroundView];
    
    _VIPView = [[UIView alloc] initWithFrame:CGRectMake(SIZE_WIDTH / 16, SIZE_HEIGHT / 6 + 30, SIZE_WIDTH - 100, SIZE_HEIGHT / 8-20)];
    _VIPBGView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"VIPBG.png"]];
    _VIPBGView.frame = CGRectMake(SIZE_WIDTH / 16, SIZE_HEIGHT / 6 + 30, SIZE_WIDTH - 100, SIZE_HEIGHT / 8-20);
    CAGradientLayer *gradientVIP = [CAGradientLayer layer];
    gradientVIP.startPoint = CGPointMake(0, 0.5);
    gradientVIP.endPoint = CGPointMake(0.8, 0.8);
    gradientVIP.frame = CGRectMake(0, 0, SIZE_WIDTH - 90, SIZE_HEIGHT / 8);
    gradientVIP.colors = [NSArray arrayWithObjects:(id)[UIColor colorWithRed:92.0/ 255.0 green:177.0 / 255.0 blue:252.0 / 255.0 alpha:1].CGColor, (id)[UIColor colorWithRed:238.0 / 255.0 green:124 / 255.0 blue:230.0 / 255.0 alpha:1].CGColor, (id)[UIColor redColor].CGColor, (id)[UIColor yellowColor].CGColor, nil];
    [_VIPView.layer insertSublayer:gradientVIP atIndex:0];
    [_VIPView.layer setMasksToBounds:YES];
    [_VIPView.layer setCornerRadius:28];
//    [self.backgroundView addSubview:_VIPView];
    [_VIPBGView.layer setMasksToBounds:YES];
    [_VIPBGView.layer setCornerRadius:28];
    [self.backgroundView addSubview:_VIPBGView];
    
    _VIPLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 50)];
    _VIPLabel.text = @"纵享丝滑，极致体验";
    [_VIPLabel setFont:[UIFont fontWithName:@"SmileySans-Oblique" size:25]];
    _VIPLabel.textColor = [UIColor colorWithRed:250 / 255.0 green:233 / 255.0 blue:212 / 255.0 alpha:1];
    _VIPLabel.backgroundColor = [UIColor clearColor];
//    [self.VIPView addSubview:_VIPLabel];
    [self.VIPBGView addSubview:_VIPLabel];
    
    _VIPTopUpLabel  = [[UILabel alloc] initWithFrame:CGRectMake(30, 48, 200, 50)];
    _VIPTopUpLabel.text = @"最低0.5元/天";
    [_VIPTopUpLabel setFont:[UIFont fontWithName:@"SmileySans-oblique" size:18]];
    _VIPTopUpLabel.textColor = [UIColor whiteColor];
    _VIPTopUpLabel.backgroundColor = [UIColor clearColor];
    [self.VIPBGView addSubview:_VIPTopUpLabel];
    
    _VIPImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"VIP3.png"]];
    _VIPImageView.frame = CGRectMake(SIZE_WIDTH-220, 17.5, 100, 61);
    [_VIPImageView.layer setCornerRadius:30];
    [_VIPImageView.layer setMasksToBounds:YES];
    [self.VIPView addSubview:_VIPImageView];
    _VIPBGView.userInteractionEnabled = YES;
    [self.VIPBGView addSubview:_VIPImageView];
    
    //创建手势对象(轻点）
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    //设置相关属性
    //点击次数（默认1）
    tap.numberOfTapsRequired = 1;
    //手指的个数（默认1）
    tap.numberOfTouchesRequired = 1;
    //添加到视图
    [self.VIPBGView addGestureRecognizer:tap];

    
    //(id)[UIColor colorWithRed:235.0 / 255.0 green:195 / 255.0 blue:125.0 / 255.0 alpha:1].CGColor
//    [_backgroundView mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@65);
//        make.left.equalTo(@(SIZE_WIDTH/2-(SIZE_WIDTH-50)/2));
//        make.width.equalTo(@(SIZE_WIDTH-50));
//        make.height.equalTo(@(SIZE_HEIGHT/3));
//    }];
    _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head1.jpg"]];
    [_headImageView.layer setMasksToBounds:YES];
    [_headImageView.layer setCornerRadius:32];
    _headImageView.userInteractionEnabled = YES;
    [self.backgroundView addSubview:_headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@40);
        make.left.equalTo(@((SIZE_WIDTH-50)/8-10));
        make.width.equalTo(@120);
        make.height.equalTo(@120);
    }];
//    //创建手势对象(轻点）
//    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick1:)];
//    //设置相关属性
//    //点击次数（默认1）
//    tap1.numberOfTapsRequired = 1;
//    //手指的个数（默认1）
//    tap1.numberOfTouchesRequired = 1;
//    //添加到视图
//    [self.headImageView addGestureRecognizer:tap1];
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"ArnoVD97";
    _nameLabel.userInteractionEnabled = YES;
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.backgroundColor = [UIColor clearColor];
    [_nameLabel setFont:[UIFont fontWithName:@"SmileySans-Oblique" size:28]];
    [self.backgroundView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@(40));
        make.left.equalTo(@((SIZE_WIDTH-50)/2));
        make.width.equalTo(@150);
        make.height.equalTo(@75);
    }];
    _buttonConfig = [UIButtonConfiguration plainButtonConfiguration];
    
    _IPLocation = [[UILabel alloc] init];
    _IPLocation.text = @"IP属地：陕西";
    _IPLocation.font = [UIFont fontWithName:@"SmileySans-Oblique" size:24];
    _IPLocation.textColor = [UIColor blackColor];
    _IPLocation.backgroundColor = [UIColor clearColor];
    _IPLocation.userInteractionEnabled = YES;
    [self.backgroundView addSubview:_IPLocation];
    [_IPLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(100));
        make.left.equalTo(@((SIZE_WIDTH-50)/2));
        make.width.equalTo(@150);
        make.height.equalTo(@75);
    }];
    //创建手势对象(轻点）
    UITapGestureRecognizer *tapIP = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickMap:)];
    //设置相关属性
    //点击次数（默认1）
    tapIP.numberOfTapsRequired = 1;
    //手指的个数（默认1）
    tapIP.numberOfTouchesRequired = 1;
    //添加到视图
    [self.IPLocation addGestureRecognizer:tapIP];
    
//    [_buttonConfig setImage:[UIImage imageNamed:@"mail.png"]];
//    _buttonConfig.title = @"状态";
//    _buttonConfig.subtitle = @"投个币吧";
    _buttonConfig.buttonSize = UIButtonConfigurationSizeLarge;
    _buttonConfig.showsActivityIndicator = NO;//菊花指示器HUD图标，和image不能同时存在
//    _buttonConfig.attributedTitle = @"attributed";
//    _buttonConfig.baseBackgroundColor = [UIColor redColor];
//  文本颜色优先级低于AttributrTitle/SubTitle以及变形器，为一个全局设置变量，当你想让按钮任何状态时文本颜色不变时，可以设置这个值
    _buttonConfig.baseForegroundColor = [UIColor blackColor];
    //目前不知道优先级高低，不知道有什么作用,且不知道被什么方法覆盖掉了
//    _buttonConfig.preferredSymbolConfigurationForImage = [UIImageSymbolConfiguration configurationWithPointSize:30];
    //设置富标题和富子标题
//    _buttonConfig.attributedSubtitle = [[NSAttributedString alloc] initWithString:@"high " attributes:@{:[UIColor systemRedColor]}];
    //图片颜色变形器，当你输入一个颜色，再输出颜色的回调，不知道能干啥，可在回调内直接返回你想要设置的颜色即可
    _buttonConfig.imageColorTransformer = ^UIColor * _Nonnull(UIColor * _Nonnull color) {
        return [UIColor systemPurpleColor];
    };
//    _buttonConfig.image = [UIImage imageNamed:@"state.png"];
//    _buttonConfig = [UIButtonConfiguration borderlessButtonConfiguration];
    //图片与文字的相对位置
    _buttonConfig.imagePlacement = NSDirectionalRectEdgeTop;
//    图片与标题的间距
    _buttonConfig.imagePadding = 15;
//    标题与字幕的间距
    _buttonConfig.titlePadding = 0;
    _buttonConfig.buttonSize = UIButtonConfigurationSizeMedium;
    _buttonConfig.titleAlignment = UIButtonConfigurationTitleAlignmentCenter;
    //内容四边距，目前不知道能干啥
//    _buttonConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
    
//还不会用这个，到时候在看，swift里面应该很好用
//    UIBackgroundConfiguration* backgroundConfig = [UIBackgroundConfiguration clearConfiguration];
//    backgroundConfig.backgroundColor = [UIColor greenColor];
//    backgroundConfig.cornerRadius = 20;
//    _buttonConfig.background = backgroundConfig;
    
////状态按钮
//    _stateButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
//    [_stateButton setImage:[UIImage imageNamed:@"state.png"] forState:UIControlStateNormal];
//    [_stateButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
//    _stateButton.tag = 101;
////    [_stateButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica_Bold" size:30]];
//    [_stateButton setImage:[UIImage imageNamed:@"state1.png"] forState:UIControlStateHighlighted];
//    [_stateButton setTitle:@"状态" forState:UIControlStateNormal];
//    _stateButton.configuration.subtitle = @"设状态";
////    _stateButton.configurationUpdateHandler
////    _stateButton.titleLabel.font = [UIFont systemFontOfSize:32];
////    [_stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self addSubview:_stateButton];
//    [_stateButton mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
//        make.left.equalTo(@(37.5));
//    }];
//
////    邮件按钮
//    _mailButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
//    [_mailButton setImage:[UIImage imageNamed:@"mail.png"] forState:UIControlStateNormal];
//    [_mailButton setImage:[UIImage imageNamed:@"mail1.png"] forState:UIControlStateHighlighted];
//    [_mailButton setTitle:@"邮件" forState:UIControlStateNormal];
//    [_mailButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
//    _mailButton.tag = 102;
//
//    _mailButton.titleLabel.hidden = NO;
//    [self addSubview:_mailButton];
//    [_mailButton mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
//        make.left.equalTo(@(132.5));
//    }];
//
////    位置按钮
//    _positionButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
//    [_positionButton setImage:[UIImage imageNamed:@"user.png"] forState:UIControlStateNormal];
//    [_positionButton setTitle:@"个人" forState:UIControlStateNormal];
//    [_positionButton setImage:[UIImage imageNamed:@"user1.png"] forState:UIControlStateHighlighted];
//    [_positionButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
//    _positionButton.tag = 103;
//    [self addSubview:_positionButton];
//    [_positionButton mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
//        make.left.equalTo(@227.5);
//    }];
//
//    //喜欢按钮
//    _heartButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
//    [_heartButton setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
//    [_heartButton setTitle:@"喜欢" forState:UIControlStateNormal];
//    [_heartButton setImage:[UIImage imageNamed:@"heart1.png"] forState:UIControlStateHighlighted];
//    [_heartButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
//    _heartButton.tag = 104;
//    [self addSubview:_heartButton];
//    [_heartButton mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
//        make.left.equalTo(@317.5);
//    }];
    //学习时用的demo先放在这里，到时候删了
//    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButtonConfiguration* btnConfig = [UIButtonConfiguration filledButtonConfiguration];
//    btn.configurationUpdateHandler = ^(UIButton *b) {
//            if (b.state == UIControlStateHighlighted) {
//                btnConfig.showsActivityIndicator = YES;
//                btnConfig.attributedTitle = [[NSAttributedString alloc] initWithString:@"Highlighted Title" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.attributedSubtitle = [[NSAttributedString alloc] initWithString:@"Highlighted Subtitle" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.image = [UIImage systemImageNamed:@"square.and.arrow.up.fill"];
//                btnConfig.activityIndicatorColorTransformer = ^UIColor * _Nonnull(UIColor * _Nonnull color) {
//                    return [UIColor systemPurpleColor];
//                };
//                ///这个赋值操作必须写，不然不生效
//                b.configuration = btnConfig;
//            }else {
//                btnConfig.showsActivityIndicator = NO;
//                btnConfig.attributedTitle = [[NSAttributedString alloc] initWithString:@"Normal Title" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.attributedSubtitle = [[NSAttributedString alloc] initWithString:@"Normal Subtitle" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.imagePadding = 10;
//                btnConfig.baseBackgroundColor = [UIColor grayColor];
//                btnConfig.image = [UIImage systemImageNamed:@"applelogo"];
//                btnConfig.imageColorTransformer = ^UIColor * _Nonnull(UIColor * _Nonnull color) {
//                    return [UIColor systemOrangeColor];
//                };
//                ///这个赋值操作必须写，不然不生效
//                b.configuration = btnConfig;
//            }
//        };
//    [self addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@((SIZE_HEIGHT/2)-50));
//        make.left.equalTo(@150);
//    }];
        
    self.personalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SIZE_HEIGHT/3+70, SIZE_WIDTH, SIZE_HEIGHT) style:UITableViewStylePlain];
    self.personalTableView.backgroundColor = [UIColor clearColor];
    _personalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _personalTableView.dataSource = self;
    _personalTableView.delegate = self;
    [_personalTableView setSeparatorColor:[UIColor grayColor]];
    [self addSubview:_personalTableView];
    _imageNameArray = [[NSArray alloc] initWithObjects:@"message.png",@"collection.png",@"help.png",@"connectUs.png",@"cog.png",@"poweroff.png",nil];
    _titleArray = [[NSArray alloc] initWithObjects:@"通知",@"收藏",@"帮助",@"联系我们",@"设置",@"退出", nil];
    [_personalTableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"personalCell"];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_pageJumpDelegate pageJumpNum:(int)indexPath.row];
    //[self.personalTableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalTableViewCell *personalCell = [self.personalTableView dequeueReusableCellWithIdentifier:@"personalCell" forIndexPath:indexPath];
    personalCell.selectionStyle = UITableViewCellSelectionStyleGray;
    personalCell.buttonImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: _imageNameArray[indexPath.row]]];
    personalCell.titleLabel.text = _titleArray[indexPath.row];
    [personalCell.contentView addSubview:personalCell.buttonImageView];
    personalCell.secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"]];
    [personalCell.contentView addSubview:personalCell.secondImageView];
    return personalCell;
}
//- (void)drawRect:(CGRect)rect {
//    // 图形上下文
//        CGContextRef ctx = UIGraphicsGetCurrentContext();
//        // 颜色空间
//        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//
//        // 创建颜色数组
//        // 由于指定RGB颜色空间，四个数组元素代表一个颜色(r, g, b, alpha)
//        CGFloat compoents[12] = {
//            0.2, 0.2, 0.2, 1,
//            0.4, 0.4, 0.4, 1,
//            0.8, 0.8, 0.8, 1
//        };
//
//        // 渐变位置(0~1)，数组元素个数不小于颜色数
//        CGFloat locations[3] = {0, 0.4, 0.8};
//
//        // 创建梯度上下文
//        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
//
//        // 绘制线性渐变
//        /*
//         startPoint与endPoint：起始于结束位置，需要位置坐标
//         options：绘制方式
//         kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
//         kCGGradientDrawsAfterEndLocation 开始位置之前不进行绘制，到结束点之后继续填充
//         */
//        CGContextDrawLinearGradient(ctx, gradient, CGPointMake(self.frame.size.width/2, 0), CGPointMake(self.frame.size.width/2, self.frame.size.height/3), kCGGradientDrawsAfterEndLocation);
//
//        // 释放颜色空间
//        CGColorSpaceRelease(colorSpace);
//
//}
//点按
- (void)tapClick:(UITapGestureRecognizer *)tap {
    NSLog(@"轻点手势响应！");
//    self.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
    [_pageJumpDelegate  pageJumpNum:22];
}

- (void)tapClick1:(UITapGestureRecognizer *)tap {
    NSLog(@"轻点手势响应！");
    //self.backgroundColor = [UIColor blackColor];
}
- (void)tapClickMap:(UITapGestureRecognizer *)tap {
    [_pageJumpDelegate pageJumpNum:11];
}

- (void)buttonReturn:(UIButton *)button {
    
}
@end
