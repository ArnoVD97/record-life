//
//  VIPView.h
//  New Style
//
//  Created by zzy on 2023/4/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol backDelegate <NSObject>

- (void)pageBackNum:(int)pageTag;

@end
@interface VIPView : UIView
@property (nonatomic, weak) id<backDelegate>pageBackDelegate;
- (void)viewInit;

@end

NS_ASSUME_NONNULL_END
