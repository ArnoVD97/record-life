//
//  VIPViewController.m
//  New Style
//
//  Created by zzy on 2023/4/4.
//

#import "VIPViewController.h"
#import "VIPView.h"
#import "Masonry.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface VIPViewController ()<backDelegate>
@property  (nonatomic, strong) VIPView *vipView;

@end

@implementation VIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _vipView = [[VIPView alloc] init];
    
//    self.view.backgroundColor = [UIColor blackColor];
    self.vipView.pageBackDelegate = self;
    self.vipView.frame = self.view.frame;
    [self.view addSubview:self.vipView];
    [self.vipView viewInit];

    
    
}
- (void)pageBackNum:(int)pageTag {
    if(pageTag == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
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
