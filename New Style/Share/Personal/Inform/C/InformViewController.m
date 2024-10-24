//
//  InformViewController.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "InformViewController.h"
#import "InformView.h"
@interface InformViewController ()
@property (nonatomic, strong)InformView *informView;
@end

@implementation InformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _informView = [[InformView alloc] init];
    self.informView.frame = self.view.frame;
    self.navigationItem.title = @"通知";
    [_informView viewInit];
    [self.view addSubview:_informView];
    // Do any additional setup after loading the view.
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
