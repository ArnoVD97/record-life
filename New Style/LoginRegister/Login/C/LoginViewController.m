//
//  LoginViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
#import "InitViewController.h"
#import "HomeViewController.h"
#import "GameViewController.h"
#import "ShareViewController.h"
#import "PersonalViewController.h"
@interface LoginViewController () <LoginButtonDelegate>
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) RegisterViewController *registerViewController;
@property (nonatomic, strong) NSArray *array;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginView = [[LoginView alloc] initWithFrame:self.view.frame];
    self.loginView.loginButtonDelegate = self;
    [self.loginView viewInit];
    [self.view addSubview:self.loginView];
    [self controllerInit];
}

//视图控制器提前初始化
- (void)controllerInit {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    GameViewController *gameViewController = [[GameViewController alloc] init];
    ShareViewController *shareViewController = [[ShareViewController alloc] init];
    PersonalViewController *personalViewController = [[PersonalViewController alloc] init];
    UIColor *groundColor = [UIColor colorWithRed:(15.0f / 255.0f) green:(14.0f / 255.0f)blue:(18.0f / 255.0f) alpha:1.0f];
    
    homeViewController.view.backgroundColor = groundColor;
    gameViewController.view.backgroundColor = groundColor;
    shareViewController.view.backgroundColor = groundColor;
    personalViewController.view.backgroundColor = groundColor;
    
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    UINavigationController *gameNavigationController = [[UINavigationController alloc] initWithRootViewController:gameViewController];
    UINavigationController *shareNavigationController = [[UINavigationController alloc] initWithRootViewController:shareViewController];
    UINavigationController *personalNavigationController = [[UINavigationController alloc] initWithRootViewController:personalViewController];
    self.array = [NSArray arrayWithObjects:homeNavigationController, gameNavigationController, shareNavigationController, personalNavigationController, nil];
}

- (void)getButton:(UIButton *)button {
    if (button.tag == 0) {   //退出
        [[UIApplication sharedApplication]performSelector:@selector(suspend)];
    } else if (button.tag == 1) {   //登录
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = self.array;
        UIColor *titleColor = [UIColor colorWithRed:(85.0f / 255.0f) green:(83.0f / 255.0f)blue:(99.0f / 255.0f) alpha:1.0f];
        tabBarController.tabBar.barTintColor = titleColor;
        self.tabBarController.tabBar.translucent = NO;
        UIColor *tabBarColor = [UIColor colorWithRed:(32.0f / 255.0f) green:(31.0f / 255.0f)blue:(38.0f / 255.0f) alpha:1.0f];
        tabBarController.tabBar.backgroundColor = tabBarColor;
        //推出视图
        tabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:tabBarController animated:YES completion:nil];
    } else if (button.tag == 2) {   //注册
        self.registerViewController = [[RegisterViewController alloc] init];
        self.registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:self.registerViewController animated:YES completion:nil];
    }
}
@end
