//
//  InformView.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "InformView.h"
#import "InformTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface InformView()
@property (nonatomic, strong)UITableView *informTableView;
@property (nonatomic,strong)NSMutableArray *informLabelArray;
@end

@implementation InformView

- (void)viewInit {
    _informLabelArray = [[NSMutableArray alloc] initWithObjects:@"漓江塔塔主给你点赞了",@"服服不服气给你发来一条新消息", @"山侣山情给你发来一条新消息", nil];
    _informTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100,SIZE_WIDTH , SIZE_HEIGHT) style:UITableViewStylePlain];
    self.backgroundColor = [UIColor whiteColor];
    _informTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _informTableView.delegate = self;
    _informTableView.dataSource = self;
    _informTableView.backgroundColor = [UIColor clearColor];
    [self addSubview:_informTableView];
    [_informTableView registerClass:[InformTableViewCell class] forCellReuseIdentifier:@"informCell"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InformTableViewCell *informCell = [self.informTableView dequeueReusableCellWithIdentifier:@"informCell" forIndexPath:indexPath];

    
    informCell.informLabel.text = _informLabelArray[indexPath.row];
    
    
    
    
    return informCell;
    }
@end
