//
//  SettingView.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "SettingView.h"
#import "SettingTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation SettingView

- (void)viewInit {
//    self.backgroundColor = [UIColor whiteColor];
    _settingArray = [[NSArray alloc] initWithObjects:@"账号与安全",@"青少年模式",@"新消息通知",@"通用",@"朋友权限",@"个人信息与权限",@"关于NewStyle",nil];
    self.backgroundColor = [UIColor blackColor];
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"angleLeft.png"]] forState:UIControlStateNormal];
    _backButton.tag = 0;
    _backButton.frame = CGRectMake(5, 20, 30, 30);
    [_backButton addTarget:self action:@selector(buttonReturn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backButton];
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 75, SIZE_WIDTH, SIZE_HEIGHT) style:UITableViewStylePlain];
//    _settingTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    _settingTableView.separatorColor = [UIColor whiteColor];
 
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    _settingTableView.backgroundColor = [UIColor clearColor];
    [_settingTableView setSeparatorColor:[UIColor blackColor]];
    _settingTableView.separatorInset = UIEdgeInsetsMake(0,80, 0, 80);
//    [_settingTableView setSeparatorColor:[UIColor grayColor]];
    [self addSubview:_settingTableView];
    [_settingTableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"settingCell"];
    
}
- (void)buttonReturn {
    [_pageJumpDelegate pageJumpNum:(int)_backButton.tag];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *settingCell = [self.settingTableView dequeueReusableCellWithIdentifier:@"settingCell" forIndexPath:indexPath];
    settingCell.selectionStyle = UITableViewCellSelectionStyleGray;
//    settingCell.backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: _imageNameArray[indexPath.row]]];
    settingCell.titleLabel.text = _settingArray[indexPath.row];
    [settingCell.contentView addSubview:settingCell.backImageView];
    settingCell.backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"]];
    [settingCell.contentView addSubview:settingCell.backImageView];

    return settingCell;
}


@end
