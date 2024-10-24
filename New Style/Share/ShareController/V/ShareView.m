//
//  ShareView.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "ShareView.h"
#import "ShareTableViewCell.h"
#import "WaterfallCollectionViewCell.h"
#import "MyLayout.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ShareView () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *photoCollectionView;   //左侧图片
@property (nonatomic, strong) UITableView *photoTableView;   //右侧图片
@property (nonatomic, strong) NSMutableArray *shareArray;
@end

@implementation ShareView

- (void)viewInit {
    self.backgroundColor = [UIColor colorWithRed:(13.0f / 255.0f) green:(12.0f / 255.0f)blue:(15.0f / 255.0f) alpha:1.0f];
    [self segmentedControlInit];
    [self scrollViewInit];
    [self tableViewInit];
    [self databaseInit];

}
- (void)segmentedControlInit {
    self.segmentedControl = [[UISegmentedControl alloc] init];
    self.segmentedControl.frame = CGRectMake(80, 55, SIZE_WIDTH - 160, 80);
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:(13.0f / 255.0f) green:(12.0f / 255.0f)blue:(15.0f / 255.0f) alpha:1.0f];
    self.segmentedControl.tintColor = [UIColor colorWithRed:(13.0f / 255.0f) green:(12.0f / 255.0f)blue:(15.0f / 255.0f) alpha:1.0f];
    self.segmentedControl.selectedSegmentTintColor = [UIColor colorWithRed:(13.0f / 255.0f) green:(12.0f / 255.0f)blue:(15.0f / 255.0f) alpha:1.0f];
    [self.segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:(146.0f / 255.0f) green:(145.0f / 255.0f)blue:(155.0f / 255.0f) alpha:1.0f], NSFontAttributeName: [UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    [self.segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:20]} forState:UIControlStateSelected];
    [self.segmentedControl insertSegmentWithTitle:@"普通share" atIndex:0 animated:YES];
    [self.segmentedControl insertSegmentWithTitle:@"瀑布流share" atIndex:1 animated:YES];
    [self.segmentedControl addTarget:self action:@selector(pressSegmented) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 1;
}
- (void)scrollViewInit {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 100, SIZE_WIDTH, SIZE_HEIGHT - 190);
    self.scrollView.tag = 666;
    self.scrollView.contentSize = CGSizeMake(SIZE_WIDTH * 2, 0);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.scrollView setContentOffset:CGPointMake(SIZE_WIDTH, 0)];
    [self addSubview:self.scrollView];
}
- (void)tableViewInit {
    self.photoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SIZE_WIDTH, SIZE_HEIGHT - 190) style:UITableViewStylePlain];
    self.photoTableView.backgroundColor = [UIColor whiteColor];
    self.photoTableView.delegate = self;
    self.photoTableView.dataSource = self;
    self.photoTableView.separatorColor = [UIColor grayColor];
    self.photoTableView.rowHeight = UITableViewAutomaticDimension;
    self.photoTableView.estimatedRowHeight = 400;
    [self.scrollView addSubview:self.photoTableView];
    [self.photoTableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"share2"];
}

- (void)collectionViewInit {
    MyLayout *layout = [[MyLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.dataArray = self.shareArray;

    self.photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(SIZE_WIDTH, 0, SIZE_WIDTH, SIZE_HEIGHT - 190) collectionViewLayout:layout];
    self.photoCollectionView.backgroundColor = [UIColor whiteColor];
    self.photoCollectionView.delegate = self;
    self.photoCollectionView.dataSource = self;
    [self.photoCollectionView registerClass:[WaterfallCollectionViewCell class] forCellWithReuseIdentifier:@"pubu"];
    [self.scrollView addSubview:self.photoCollectionView];
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shareArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareTableViewCell *cell = [self.photoTableView dequeueReusableCellWithIdentifier:@"share2" forIndexPath:indexPath];
    [cell setModel:self.shareArray[indexPath.row]];
    [cell.deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)pressDelete {
    
}

#pragma mark CollecctionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shareArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WaterfallCollectionViewCell *cell = [self.photoCollectionView dequeueReusableCellWithReuseIdentifier:@"pubu" forIndexPath:indexPath];
    [cell setModel:self.shareArray and:(int)indexPath.item];
    return cell;
}

- (void)pressSegmented{
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else if (_segmentedControl.selectedSegmentIndex == 1) {
        [self.scrollView setContentOffset:CGPointMake(SIZE_WIDTH, 0) animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x == 0) {
        _segmentedControl.selectedSegmentIndex = 0;
    } else if (self.scrollView.contentOffset.x == SIZE_WIDTH) {
        _segmentedControl.selectedSegmentIndex = 1;
    }
}

//FMDB初始化
- (void)databaseInit {
    NSString *shareDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", shareDoc);
    NSString *shareFileName = [shareDoc stringByAppendingPathComponent:@"shareData.sqlite"];
    self.shareDataBase = [FMDatabase databaseWithPath:shareFileName];
    if ([self.shareDataBase open]) {
        BOOL result = [self.shareDataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS shareData (head BLOB NOT NULL, name text NOT NULL, mainLabel text NOT NULL, mainImage BLOB NOT NULL, good text NOT NULL, time text NOT NULL);"];
        if (result) {
            NSLog(@"创表成功");
        } else {
            NSLog(@"创表失败");
        }
    }
}
//FMDB查询数据
- (void)queryData {
    if ([self.shareDataBase open]) {
        // 1.执行查询语句
        FMResultSet *shareResultSet = [self.shareDataBase executeQuery:@"SELECT * FROM shareData"];
        self.shareArray = [[NSMutableArray alloc] init];
        // 2.遍历结果
        while ([shareResultSet next]) {
            NSDictionary *dictionary = @{@"head":[UIImage imageWithData:[shareResultSet dataForColumn:@"head"]], @"name":[shareResultSet stringForColumn:@"name"], @"mainLabel":[shareResultSet stringForColumn:@"mainLabel"], @"mainImage":[UIImage imageWithData:[shareResultSet dataForColumn:@"mainImage"]], @"good":[shareResultSet stringForColumn:@"good"], @"time":[shareResultSet stringForColumn:@"time"]};
            [self.shareArray insertObject:dictionary atIndex:0];
        }
        [self.shareDataBase close];
    }
    [self collectionViewInit];
}

@end
