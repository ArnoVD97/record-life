//
//  RegisterView.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//
#import "RegisterView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface RegisterView () <UITextFieldDelegate>
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *wonderfulLabel;
@property (nonatomic, strong) UITextField *mainTextField;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *verificationButton;  //验证码
@property (nonatomic, assign) int countSeconds;
@property (nonatomic, strong) NSTimer *countDownTimer;

@property (nonatomic, strong) UITextField *textField;
@end

@implementation RegisterView

- (void)viewInit {
    self.backgroundColor = [UIColor colorWithRed:(15.0f / 255.0f) green:(14.0f / 255.0f)blue:(18.0f / 255.0f) alpha:1.0f];
    self.emailString = [[NSMutableString alloc] init];
    self.textFieldArray = [[NSMutableArray alloc] init];
    [self buttonInit];
    [self labelInit];
    [self textFieldInit];
    [self intervalViewInit];
}
- (void)buttonInit {
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"fanhui.png"]] forState:UIControlStateNormal];
    self.backButton.tag = 0;
    [self addSubview:self.backButton];
    //状态栏高度
    NSSet *set = [UIApplication sharedApplication].connectedScenes;
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *statusBarManager = windowScene.statusBarManager;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker* make) {
        if (statusBarManager.statusBarFrame.size.height < 30) {
            make.top.equalTo(self).offset(43 - 20);
        } else {
            make.top.equalTo(self).offset(43);
        }
        make.height.equalTo(@35);
        make.width.equalTo(@35);
        make.top.equalTo(self).offset(43);
        make.left.equalTo(self).offset(15);
    }];
    [self.backButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.registerButton.tag = 1;
    self.registerButton.frame = CGRectMake(60, 550, SIZE_WIDTH - 120, 55);
    self.registerButton.layer.masksToBounds = YES;
    self.registerButton.layer.cornerRadius = 10;
    self.registerButton.backgroundColor = [UIColor colorWithRed:(37.0f / 255.0f) green:(35.0f / 255.0f)blue:(42.0f / 255.0f) alpha:1.0f];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    self.registerButton.tintColor = [UIColor whiteColor];
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:0.055 * SIZE_WIDTH];
    [self.registerButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.registerButton];
    
    self.verificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.verificationButton.frame = CGRectMake(100 + (SIZE_WIDTH - 120) / 2, 300, (SIZE_WIDTH - 120) / 2, 50);
    self.verificationButton.titleLabel.font = [UIFont systemFontOfSize:17];
    self.verificationButton.backgroundColor = [UIColor clearColor];
    [self.verificationButton setTitleColor:[UIColor colorWithRed:(20.0f / 255.0f) green:(105.0f / 255.0f)blue:(219.0f / 255.0f) alpha:1.0f] forState:UIControlStateNormal];
    [self.verificationButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.verificationButton.tag = 159;
    [self.verificationButton addTarget:self action:@selector(pressTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.verificationButton];
}
- (void)pressTimer:(UIButton *)button {
    self.textField = self.textFieldArray[0];
    self.emailString = (NSMutableString *)self.textField.text;
    if (button.tag == 159) {
        [self.verificationButton setTitle:@"60s后重发" forState:UIControlStateNormal];
        self.countSeconds = 60;
        self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timePress) userInfo:nil repeats:YES];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];
        button.userInteractionEnabled = NO;
        [self.registerButtonDelegate getButton:button];
    }
}
- (void)timePress {
    self.countSeconds--;
    if (self.countSeconds > 0) {
        [self.verificationButton setTitle:[NSString stringWithFormat:@"%ds后重发", self.countSeconds] forState:UIControlStateNormal];
    } else {
        [self.countDownTimer invalidate];
        [self.verificationButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.verificationButton.userInteractionEnabled = YES;
    }
}
- (void)labelInit {
    self.wonderfulLabel = [[UILabel alloc] init];
    self.wonderfulLabel.frame = CGRectMake(60, 90, 300, 100);
    self.wonderfulLabel.text = @"注册享更多精彩内容";
    self.wonderfulLabel.textColor = [UIColor whiteColor];
    self.wonderfulLabel.font = [UIFont systemFontOfSize:28];
    [self addSubview:self.wonderfulLabel];
}

- (void)textFieldInit {
    NSArray *array = @[@"请输入邮箱号", @"请输入验证码", @"请输入密码", @"请再次确认密码"];
    for (int i = 0; i < 4; i++) {
        self.mainTextField = [[UITextField alloc] init];
        self.mainTextField.delegate = self;
        if (i == 1) {
            self.mainTextField.frame = CGRectMake(60, 220 + i * 80, (SIZE_WIDTH - 120) / 2, 50);
        } else {
            self.mainTextField.frame = CGRectMake(60, 220 + i * 80, SIZE_WIDTH - 120, 50);
        }
        self.mainTextField.tag = i;
        if (i == 2 || i == 3) {
            self.mainTextField.secureTextEntry = YES;
        }
        self.mainTextField.backgroundColor = [UIColor clearColor];
        self.mainTextField.tintColor = [UIColor whiteColor];
        self.mainTextField.textColor = [UIColor whiteColor];
        self.mainTextField.font = [UIFont systemFontOfSize:20];
        self.mainTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:array[i] attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:(123.0f / 255.0f) green:(120.0f / 255.0f)blue:(133.0f / 255.0f) alpha:1.0f],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
        [self.textFieldArray addObject:self.mainTextField];
        [self addSubview:self.mainTextField];
    }
}

- (void)intervalViewInit {
    for (int i = 0; i < 4; i++) {
        UIView *intervalView = [[UIView alloc] init];
        intervalView.frame = CGRectMake(60, 270 + i * 80, SIZE_WIDTH - 120, 1);
        intervalView.backgroundColor = [UIColor colorWithRed:(123.0f / 255.0f) green:(120.0f / 255.0f)blue:(133.0f / 255.0f) alpha:1.0f];
        [self addSubview:intervalView];
    }
}

- (void)buttonReturn:(UIButton *)button {
    [self.registerButtonDelegate getButton:button];
}

@end
