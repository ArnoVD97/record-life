//
//  FriendsView.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "FriendsView.h"
#import "CollectionTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface FriendsView()

@end
@implementation FriendsView

- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];

    _collectionLabelArray = [[NSMutableArray alloc] initWithObjects:@"我会保护你，无论你是对还是......",@"如何正确的吐槽", @"立一个flag，过年前写完合作项目", nil];
    _collectionImageArray = [[NSMutableArray alloc] initWithObjects:@"collection.pic.jpg", @"collection2.pic.jpg", @"collection3.pic.jpg", nil];
    _collectionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100,SIZE_WIDTH , SIZE_HEIGHT) style:UITableViewStylePlain];
    self.backgroundColor = [UIColor whiteColor];
    _collectionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _collectionTableView.delegate = self;
    _collectionTableView.dataSource = self;
    _collectionTableView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_collectionTableView];
    [_collectionTableView registerClass:[CollectionTableViewCell class] forCellReuseIdentifier:@"collectionCell"];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionTableViewCell *collectionCell = [self.collectionTableView dequeueReusableCellWithIdentifier:@"collectionCell" forIndexPath:indexPath];
    collectionCell.selectionStyle = UITableViewCellSelectionStyleGray;
    [collectionCell.collectionImageView setImage:[UIImage imageNamed:_collectionImageArray[indexPath.row]]];
    [collectionCell.collectionImageView.layer setMasksToBounds:YES];
    [collectionCell.collectionImageView.layer setCornerRadius:16];
    collectionCell.collectionLabel.text = _collectionLabelArray[indexPath.row];
    
    
    
    
    return collectionCell;
    }

@end
