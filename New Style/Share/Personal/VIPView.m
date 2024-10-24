//
//  VIPView.m
//  New Style
//
//  Created by zzy on 2023/4/4.
//

#import "VIPView.h"
#import "Masonry.h"
#import "VIPViewTableViewCell.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface VIPView ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *VIPBackgroundView;
@property (nonatomic, strong) UIView *TopUpBackgroundView;
@property (nonatomic ,strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIScrollView *priceChooseScrollView;
@property (nonatomic , strong) UIView *sMonth;
@property (nonatomic ,strong) UIView *sSeason;
@property (nonatomic ,strong) UIView *sYear;
@property (nonatomic, strong) UIView *Month;
@property (nonatomic, strong) UIView *Season;
@property (nonatomic, strong) UIView *Year;
 
@property (nonatomic, strong) UILabel *warningLabel;
@property ( nonatomic , strong) UITableView *purchaseTableView;
@property (nonatomic, strong) NSMutableArray *imageNameArray;
@property (nonatomic, strong) NSMutableArray *platformLabelNameArray;
@property (nonatomic, strong) UILabel *purchaseLabel;



@end

@implementation VIPView


- (void)viewInit {
    self.backgroundColor = [UIColor blackColor];
    
    _TopUpBackgroundView = [[UIView alloc] init];
    _TopUpBackgroundView.frame = CGRectMake(0, SIZE_HEIGHT/3 - 100, SIZE_WIDTH, SIZE_HEIGHT/3 * 2 + 100);
    _TopUpBackgroundView.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:209 / 255.0 blue:161 / 255.0 alpha:1];
    [_TopUpBackgroundView.layer setMasksToBounds:YES];
    [_TopUpBackgroundView.layer setCornerRadius:32];
//    _TopUpBackgroundView.backgroundColor = [UIColor blackColor];
    [self addSubview:_TopUpBackgroundView];
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"臻选会员";
    _titleLabel.font = [UIFont fontWithName:@"SmileySans-Oblique" size:30];
    _titleLabel.textColor  = [UIColor colorWithRed:240 / 255.0 green:209 / 255.0 blue:161 / 255.0 alpha:1];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.frame = CGRectMake((SIZE_WIDTH - 100) / 2, 60, 100, 60);
    [self addSubview:_titleLabel];
    
    
    
    
    _purchaseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SIZE_HEIGHT/3+100, SIZE_WIDTH, SIZE_HEIGHT/3) style:UITableViewStylePlain];
    _imageNameArray = [[NSMutableArray alloc] initWithObjects:@"zhifubao.png", @"huabei.png", @"weChat.png", nil];
    _platformLabelNameArray = [[NSMutableArray alloc] initWithObjects:@"支付宝",@"花呗",@"微信",nil];
    
    self.purchaseTableView.backgroundColor = [UIColor clearColor];
    _purchaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _purchaseTableView.dataSource = self;
    _purchaseTableView.delegate = self;
    [_purchaseTableView setSeparatorColor:[UIColor grayColor]];
    [self.TopUpBackgroundView addSubview:_purchaseTableView];
    [_purchaseTableView registerClass:[VIPViewTableViewCell class] forCellReuseIdentifier:@"purchaseCell"];

//    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"angleLeft.png"]] forState:UIControlStateNormal];
//    self.backButton.tag = 0;
//    [self.VIPBackgroundView addSubview:self.backButton];
//    [_backButton addTarget:self action:@selector(buttonReturn) forControlEvents:UIControlEventTouchUpInside];
//    [self.backButton mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.height.equalTo(@25);
//        make.width.equalTo(@25);
//        make.top.equalTo(self).offset(43);
//        make.left.equalTo(self).offset(20);
//    }];
//    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _backButton.frame = CGRectMake(60, 120, 30, 30);
//    [_backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"angleLeft.png"]] forState:UIControlStateNormal];

//    [self.VIPBackgroundView addSubview:_backButton];
    
}

-  (void)buttonReturn {
    [_pageBackDelegate pageBackNum:1];
    NSLog(@"1111111");
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"1223232324");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VIPViewTableViewCell *purchaselCell = [self.purchaseTableView dequeueReusableCellWithIdentifier:@"purchaseCell" forIndexPath:indexPath];
    purchaselCell.backgroundColor = [UIColor clearColor];
    purchaselCell.selectionStyle = UITableViewCellSelectionStyleGray;
    [purchaselCell.platformImageView  setImage:[UIImage imageNamed: _imageNameArray[indexPath.row]]];
    purchaselCell.platformLabel.text = _platformLabelNameArray[indexPath.row];



 
//    [purchaselCell.contentView addSubview:purchaselCell.chooseButton];
//    [purchaselCell.contentView addSubview:purchaselCell.platformLabel];
    //[purchaselCell.contentView addSubview:purchaselCell.platformImageView];
  
    return purchaselCell;
}

- (void)buttonState {

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
