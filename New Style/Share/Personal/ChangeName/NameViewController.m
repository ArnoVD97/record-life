//
//  NameViewController.m
//  New Style
//
//  Created by 翟旭博 on 2023/4/10.
//

#import "NameViewController.h"

@interface NameViewController ()
@property (nonatomic, strong) UITextField *neTextField;
@end

@implementation NameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    NSArray *array = @[@"昵称",@"账号",@"个性签名"];
    NSArray *array2 = @[self.string,@" @qq.com",@"iOS组最帅"];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:20];
        label.frame = CGRectMake(50, 100 + 80 * i, 100, 50);
        label.text = array[i];
        [self.view addSubview:label];
        
        self.textField = [[UITextField alloc] init];
        self.textField.text = array2[i];
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.frame = CGRectMake(200, 100 + 80 * i, 150, 50);
        self.textField.layer.cornerRadius = 10;
        self.textField.layer.masksToBounds = YES;
        [self.view addSubview:self.textField];
        if (i == 0) {
            self.neTextField = self.textField;
        }
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(170, 350, 90, 55);
    button.layer.cornerRadius = 20;
    button.layer.masksToBounds = YES;
    button.backgroundColor = [UIColor colorWithRed:(37.0f / 255.0f) green:(35.0f / 255.0f)blue:(42.0f / 255.0f) alpha:1.0f];

    [button setTitle:@"修改" forState:UIControlStateNormal];
    button.tintColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:0.055 * 430];
    [button addTarget:self action:@selector(buttonReturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


}
- (void)buttonReturn {
    //注册通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"1" object:nil userInfo:@{@"name":self.neTextField.text}];
    [self.navigationController popViewControllerAnimated:YES];
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
