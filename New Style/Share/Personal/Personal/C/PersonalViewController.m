//
//  PersonalViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "PersonalViewController.h"
#import "PersonalView.h"
#import "VIPViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "MapPageViewController.h"
#import "NameViewController.h"
#import "HelpViewController.h"
#import "InformViewController.h"
#import "FriendsViewController.h"
// 系统相机
#import <AVFoundation/AVFoundation.h>
// 系统相册
#import <AssetsLibrary/AssetsLibrary.h>
@interface PersonalViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) PersonalView* personView;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.editing = YES;
    self.imagePicker.delegate = self;
    //是否允许编辑
    self.imagePicker.allowsEditing = YES;
    self.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
    

    
    
    self.view.backgroundColor = [UIColor grayColor];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.title = @"我的";
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 10)];
    [tabBarItem setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
    tabBarItem.image = [[UIImage imageNamed: @"wode1.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed: @"wode2.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    _personView = [[PersonalView alloc] initWithFrame:self.view.frame];
    
    [self.personView viewInit];
    self.personView.pageJumpDelegate = self;
    [self.view addSubview:self.personView];
    //创建手势对象(轻点）
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick1:)];
    //设置相关属性
    //点击次数（默认1）
    tap1.numberOfTapsRequired = 1;
    //手指的个数（默认1）
    tap1.numberOfTouchesRequired = 1;
    //添加到视图
    [self.personView.headImageView addGestureRecognizer:tap1];
    
    //创建手势对象(轻点）
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick2:)];
    //设置相关属性
    //点击次数（默认1）
    tap1.numberOfTapsRequired = 1;
    //手指的个数（默认1）
    tap1.numberOfTouchesRequired = 1;
    //添加到视图
    [self.personView.nameLabel addGestureRecognizer:tap2];
    //注册观察者用于接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notice:) name:@"1" object:nil];
}

- (void)notice:(NSNotification *)sender {
    self.personView.nameLabel.text = sender.userInfo[@"name"];
}

- (void)tapClick2:(UITapGestureRecognizer *)tap {
    NSLog(@"1");
    NameViewController *nameViewController = [[NameViewController alloc] init];
    nameViewController.string = self.personView.nameLabel.text;
    [self.navigationController pushViewController:nameViewController animated:YES];
}

- (void)tapClick1:(UITapGestureRecognizer *)tap {
    //创建sheet提示框，提示选择相机还是相册
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择照片来源" message:@"" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //选择相机时，设置UIImagePickerController对象相关属性
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //self.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
        self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //跳转到UIImagePickerController控制器弹出相机
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];

    //相册选项
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        //选择相册时，设置UIImagePickerController对象相关属性
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //跳转到UIImagePickerController控制器弹出相册
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];

    //取消按钮
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];
    //添加各个按钮事件
    [alert addAction:camera];
    [alert addAction:photo];
    [alert addAction:cancel];
    //弹出sheet提示框
    [self presentViewController:alert animated:YES completion:nil];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //获取到的图片
    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    self.personView.headImageView.image = image;
    
}
- (void)pageJumpNum:(int)pageTag {
    if (pageTag == 0) {
        NSLog(@"0");
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"目前没有通知" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:sure];
//        [self presentViewController:alertController animated:YES completion:nil];
        InformViewController *infController = [[InformViewController alloc] init];
        [self.navigationController pushViewController:infController animated:YES];
    } else if (pageTag == 1) {
        FriendsViewController *collectionController = [[FriendsViewController alloc] init];
        [self.navigationController pushViewController:collectionController animated:YES];
        NSLog(@"1");
    } else if (pageTag == 2) {
        HelpViewController *helpViewController = [[HelpViewController alloc] init];
        [self.navigationController pushViewController:helpViewController animated:YES];
    } else if (pageTag == 3) {
        NSLog(@"3");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://xiyou3g.club:9999"]options:@{}completionHandler:nil];
    } else if (pageTag == 4) {
        SettingViewController *settingViewController = [[SettingViewController alloc] init];
        [self presentViewController:settingViewController animated:YES completion:nil];
        NSLog(@"4");
    } else if (pageTag == 5) {
        UIAlertController *closeAlertController = [UIAlertController alertControllerWithTitle:@"退出登陆" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
//                LoginViewController *loginViewController = [[LoginViewController alloc] init];
//                [self presentViewController:loginViewController animated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }];
        
        UIAlertAction *no = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:nil];
        
        [closeAlertController addAction:sure];
        [closeAlertController addAction:no];
        
        [self presentViewController:closeAlertController animated:YES completion:nil];
        LoginViewController *loginViewController = [[LoginViewController alloc] init];
        
        NSLog(@"5");
    }
    if(pageTag == 11) {
        MapPageViewController *mapController = [[MapPageViewController alloc] init];
        [self presentViewController:mapController animated:YES completion:nil];
    } else if(pageTag == 22) {
        VIPViewController* vipController = [[VIPViewController alloc] init];
        vipController.modalPresentationStyle = 0;
//        [self presentViewController:vipController animated:YES completion:nil];
        [self.navigationController pushViewController:vipController animated:YES];
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
