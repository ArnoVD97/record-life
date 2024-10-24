//
//  RegisterViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "Manager.h"
@interface RegisterViewController () <RegisterButtonDelegate>
@property (nonatomic, strong) RegisterView *registerView;

//用来记录textfield内容
@property (nonatomic, strong) NSMutableArray *textFieldTextArray;
@property (nonatomic, strong) UITextField *temporaryTextField;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registerView = [[RegisterView alloc] initWithFrame:self.view.frame];
    [self.registerView viewInit];
    self.registerView.registerButtonDelegate = self;
    [self.view addSubview:self.registerView];
}
- (void)getButton:(UIButton *)button{
    if (button.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (button.tag == 159) {
        [self getCode:self.registerView.emailString];
    } else {
        self.textFieldTextArray = [[NSMutableArray alloc] init];
        [self.textFieldTextArray addObject:self.registerView.emailString];
        for (int i = 1; i <= 3; i++) {
            self.temporaryTextField = self.registerView.textFieldArray[i];
            [self.textFieldTextArray addObject:self.temporaryTextField.text];
        }
        if ([self.textFieldTextArray[2] isEqualToString:self.textFieldTextArray[3]]) {
            [self addRegister];
        } else {
            UIAlertController *errorAlertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"两次输入密码不一致" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [errorAlertController addAction:alertAction];
            [self presentViewController:errorAlertController animated:YES completion:nil];
        }
    }
    
}

- (void)getCode:(NSString *)email {
    [[Manager sharedManage] getCode:^(NSString * _Nonnull codeString) {
        if (![codeString isEqualToString:@"200"]) {
            UIAlertController *errorAlertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"邮箱格式错误或邮箱已注册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [errorAlertController addAction:alertAction];
            [self presentViewController:errorAlertController animated:YES completion:nil];
        }
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error");
    } email:email];
}

//注册
- (void)addRegister {
    [[Manager sharedManage] registerNetWork:^(NSString * _Nonnull codeString) {
        if ([codeString isEqualToString:@"200"]) {
            UIAlertController *errorAlertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [errorAlertController addAction:alertAction];
            [self presentViewController:errorAlertController animated:YES completion:nil];
        } else {
            UIAlertController *errorAlertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"注册出现错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [errorAlertController addAction:alertAction];
            [self presentViewController:errorAlertController animated:YES completion:nil];
        }
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error");
    } email:self.textFieldTextArray[0] code:self.textFieldTextArray[1] password:self.textFieldTextArray[2]];
}
@end
