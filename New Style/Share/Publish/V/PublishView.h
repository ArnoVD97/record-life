//
//  PublishView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublishView : UIView
- (void)viewInit;
- (void)testPhoto;
@property (nonatomic, strong) UIImagePickerController *imagePicker;   //从相册调图片
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong, readonly) UITextView *mainTextView;   //文字文本框
@property (nonatomic, strong, readonly) UIImageView *mainImageView;
@end

NS_ASSUME_NONNULL_END
