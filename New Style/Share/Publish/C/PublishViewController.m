//
//  PublishViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/23.
//

#import "PublishViewController.h"

@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.publishView = [[PublishView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.publishView];
    [self.publishView viewInit];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressButton:) name:@"publishButton" object:nil];
    self.publishView.image = self.image;
    [self.publishView testPhoto];
}
- (void)pressButton:(NSNotification *)sender {
    UIButton *button = sender.userInfo[@"button"];
    if (button.tag == 0) {    //返回
        if (self.flag == 2) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    } else if (button.tag == 1) {   //发表
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM月dd日 HH:mm"];
        NSDate *dateNow = [NSDate date];
        NSString *timeString = [formatter stringFromDate:dateNow];
        [self insertPhotoDataBase:[UIImage imageNamed:@"head1.jpg"] andName:@"ArnoVD97" andMainLabel:self.publishView.mainTextView.text andMainImage:self.publishView.mainImageView.image andGood:@"0" andTime:timeString];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"发表成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (button.tag == 2) {   //添加图片
        //创建sheet提示框，提示选择相机还是相册
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择照片来源" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
             UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

              //选择相机时，设置UIImagePickerController对象相关属性
            self.publishView.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            self.publishView.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
          //    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
            self.publishView.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
              //跳转到UIImagePickerController控制器弹出相机
            [self presentViewController:self.publishView.imagePicker animated:YES completion:nil];
        }];

            //相册选项
        UIAlertAction * photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

            //选择相册时，设置UIImagePickerController对象相关属性
            self.publishView.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //跳转到UIImagePickerController控制器弹出相册
            [self presentViewController:self.publishView.imagePicker animated:YES completion:nil];
        }];

        //取消按钮
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

            //[self dismissViewControllerAnimated:YES completion:nil];
        }];
        //添加各个按钮事件
        [alert addAction:camera];
        [alert addAction:photo];
        [alert addAction:cancel];
        //弹出sheet提示框
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"publishButton" object:nil];
}

//FMDB插入数据
- (void)insertPhotoDataBase:(UIImage *)head andName:(NSString *)name andMainLabel:(NSString *)mainLabel andMainImage:(UIImage *)mainImage andGood:(NSString *)good andTime:(NSString *)time {
    NSData *headData = UIImagePNGRepresentation(head);
    NSData *mainImageData = UIImagePNGRepresentation(mainImage);
    if ([self.shareDataBase open]) {
        BOOL result = [self.shareDataBase executeUpdate:@"INSERT INTO shareData (head, name, mainLabel, mainImage, good, time) VALUES (?, ?, ?, ?, ?, ?);", headData, name, mainLabel, mainImageData, good, time];
        if (!result) {
            NSLog(@"增加数据失败");
        } else {
            NSLog(@"增加数据成功");
        }
        [self.shareDataBase close];
    }
}
@end
