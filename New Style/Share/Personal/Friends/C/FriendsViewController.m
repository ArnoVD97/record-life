//
//  FriendsViewController.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "FriendsViewController.h"
#import "FriendsView.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface FriendsViewController ()
@property (nonatomic, strong)FriendsView *collectionView;
@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   _collectionView = [[FriendsView alloc] init];
    self.collectionView.frame = self.view.frame;
    self.navigationItem.title = @"收藏";
    [_collectionView viewInit];
    [self.view addSubview:_collectionView];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
