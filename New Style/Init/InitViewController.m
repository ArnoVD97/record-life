//
//  InitViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "InitViewController.h"
#import "HomeViewController.h"
#import "GameViewController.h"
#import "ShareViewController.h"
#import "PersonalViewController.h"

#import "LoginViewController.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface InitViewController ()
@property (nonatomic, strong) UIImageView *beforeImageView;
@property (nonatomic, strong) NSArray *array;
@end

@implementation InitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:5  target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:myTimer forMode:NSRunLoopCommonModes];
    
    UIColor *groundColor = [UIColor colorWithRed:(15.0f / 255.0f) green:(14.0f / 255.0f)blue:(18.0f / 255.0f) alpha:1.0f];
    self.view.backgroundColor = groundColor;

    self.beforeImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SIZE_WIDTH - 250) / 2, 250, 250, 60)];
    [self.beforeImageView setImage:[UIImage imageNamed:@"title1.png"]];
    self.beforeImageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.beforeImageView];
    [self imageViewRun];
}

//第一个视图消失
- (void)imageViewRun {
    [UIImageView animateWithDuration:2 animations:^{
        self.beforeImageView.frame = CGRectMake((SIZE_WIDTH - 250) / 2 + 125, 280, 2.5, 0.6);
    }completion:^(BOOL finished) {
        self.beforeImageView.image = [UIImage imageNamed:@"image3.png"];
        [self imageViewSecondRun];
    }];
}

//第二个视图显示
- (void)imageViewSecondRun {
    [UIImageView animateWithDuration:2 animations:^{
        self.beforeImageView.frame = CGRectMake((SIZE_WIDTH - 300) / 2, 250, 300, 169);
    }];
    [self.beforeImageView stopAnimating];
}



//启动图结束
- (void)timeOut {
    //测试登录注册界面
    LoginViewController *a = [LoginViewController new];
    a.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:a animated:YES completion:nil];
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
